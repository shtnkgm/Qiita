# Swiftとオブジェクト間の通知のパターン
# はじめに
Swiftとオブジェクト間の通知のパターンについて考えてみます。
**「オブジェクト間の通知」とはオブジェクト間のメッセージのやりとり**を意味します。

iOSアプリ開発では複数のオブジェクトを扱うため、その**通知方法の設計**は疎かにはできません。アプリの規模が大きくなるにつれて、コードの重複を避け、再利用のためにコードを責務（役割）に応じて分割する必要があります。例えば、View（UI）とModel（ビジネスロジック）を分けた場合、**Modelのデータ更新の完了をViewへどのように通知**したらよいでしょうか。

<img src="https://qiita-image-store.s3.amazonaws.com/0/113553/13a5d502-0609-7e61-aaeb-4eb4eabdb028.png" width="100%">

# 概要
本記事では**アンチパターンを含めた以下の6つの通知パターン**を説明します。最後に、それぞれの**パターンの比較と使い分け**について説明します。

1. 循環参照パターン（アンチパターン）
2. Delegateパターン（弱参照+ポリモーフィズム）
3. NotificationCenterパターン
4. KVO（Key-Value Observing: キー値監視）パターン
5. Closure Callbackパターン
6. Data Bindingパターン（プロパティオブザーバ+Closure）

※これら以外にも[RxSwift](https://github.com/ReactiveX/RxSwift)や[Bond](https://github.com/ReactiveKit/Bond)など、OSSを用いた通知のパターンもありますが本記事の内容には含まれません。

# 6つの通知パターン

## 1. 循環参照パターン（アンチパターン）
はじめに、やってはダメなアンチパターンについて触れておきます。シンプルに考えると、通知のために別オブジェクトのメソッドを実行するには、**そのオブジェクトの参照を持っていれば良い**ということになります。そのため、オブジェクト間で相互にやりとりをするにはお互いの参照を持っていれば良いことになります。

循環参照パターンのソースコード例は以下のようになります。

```swift:循環参照パターン
import Foundation

class View {
    // ★ Modelオブジェクトへの参照
    var model: Model = Model()
    
    // 1. UIイベントの発生
    func receiveUIEvent() {
        model.view = self

        // 2. データの更新をModelに通知
        model.updateData()
    }
    
    // 5. UIの更新
    func updateUI() {
        print("\(model.data)")
    }
}

class Model {
    // ★ Viewオブジェクトへの参照
    var view: View?
    var data: Int = 0

    // 3. データの更新
    func updateData() {
        data += 1

        // 4. Viewへデータの更新完了を通知
        view?.updateUI()
    }
}

let view = View()
view.receiveUIEvent()
```
こちらのソースコードは正常に動作しますが、**「循環参照」(strong reference cycle)**という問題を抱えています。オブジェクトがお互いに参照を持つ状態になった場合、参照関係が循環していると言えます。循環参照になった場合、オブジェクトは**メモリから解放されなくなってしまいます**。この状態を**メモリリーク**と言います。メモリリークが増えるとパフォーマンスが落ち、最悪アプリがクラッシュするため、このパターンを採用すべきではありません。

**＜補足: iOSのメモリ管理方式について＞**
iOSではメモリ管理を**参照カウンタ(Reference Counting)**という方式で行っています。オブジェクトへの参照を持つごとに参照カウンタを+1し、オブジェクトへの参照がなくなった時点で-1します。つまりどのオブジェクトも参照していない場合、参照カウンタが0になるため、OSはそのオブジェクトをメモリから開放しても良いと判断します。ARC（自動参照カウンタ）の採用により、iOS5以降ではプログラマがメモリ管理を意識することは減りましたが、循環参照には気をつける必要があります。

## 2. Delegateパターン（弱参照+ポリモーフィズム）
次に紹介するのはパターン1の改良版です。Swiftではプロパティに`weak`キーワードをつけることで、「弱参照」（weak reference）することができます。弱参照の場合は通常の「強参照」と異なり、**先に説明した参照カウンタが増えません**。つまり**循環参照の問題が解決**します。弱参照のプロパティでは参照先のオブジェクトが解放され、nilが代入される可能性があるため、オプショナル型で定義する必要があります。

```swift:Viewオブジェクトへの参照を弱参照にする
// weakキーワードで弱参照
weak var view: View?
```

これで循環参照の問題は解決しました。しかしこのパターンにはさらに改良の余地があります。それはViewとModelが**「密結合」**であるという点です。密結合な設計は**変更に弱く、再利用もしづらい**と言えます。ここで言う変更に弱いというのは、**仕様変更が入った場合に変更箇所が多くなる**という意味です。

例えば、ViewでなくSecondViewがModelを使うよう仕様変更が入ったとします。Modelのクラス内にはViewが書かれているため、これを修正しないとSecondViewからは利用できません。**「ModelはViewに依存している」**とも言えます。

```swift:Modelの仕様変更
class Model {
    // View → SecondViewに変更が必要
    weak var view: View?
    var data: Int = 0
    func updateData() {
        data += 1
        view?.updateUI()
    }
}
```

この問題を解決するには、ModelがViewに依存しない書き方にする必要があります。具体的には、ModelがViewに依存するのではなく、より**抽象的なインタフェースに依存させる**ようにします。Modelが必要とする抽象的なインタフェースとは何でしょうか？

それは**「updateUIメソッドが実行できること」**のみです。updateUIメソッドが実行できるクラスであればViewでなくともSecondViewでもどんなクラスでも良いということになります。この抽象的なインタフェースを表す方法の1つとして、Swiftではプロトコルがあります。プロトコルはJavaにおける**interface**に近い概念です。

updateUIメソッドを持つという概念をプロトコルで実装すると以下のようになります。

```swift:プロトコルの例
protocol ViewProtocol {
    func updateUI()
}
```

プロトコルはインスタンス化することはできません。しかし**型として扱える**ため、Modelクラスの実装を以下のように書くことができます。

```swift:ModelをViewProtocolに依存させる
// ViewProtocolに準拠することを宣言
class View: ViewProtocol {
    var model: Model = Model()
    
    func receiveUIEvent() {
        model.view = self
        model.updateData()
    }
    
    // ViewProtocolに準拠したメソッド
    func updateUI() {
        print("\(model.data)")
    }
}

protocol ViewProtocol: class {
    func updateUI()
}

class Model {
    // ViewでなくViewProtocolに依存
    weak var view: ViewProtocol?
    var data: Int = 0
    func updateData() {
        data += 1
        view?.updateUI()
    }
}
```
これでModelがViewに依存しないコードになりました。これは**「ポリモーフィズム」**の一例にもなっています。ポリモーフィズム（polymorphism: 多態性）は、**動的にメソッドによって呼び出されるオブジェクトが変わり、そのオブジェクトによって振る舞いが変わるという性質**です。今回の例では、Modelはviewプロパティに対しupdateUIメソッドを実行していますが、viewプロパティがViewなのかSecondViewなのかは分かりません。しかし、実行されるオブジェクトによってupdateUIメソッドの実装は異なり、振る舞いが変化します。

UIKitフレームワークでは[UITableViewDelegate](https://developer.apple.com/documentation/uikit/uitableviewdelegate)プロトコルなど、多くのオブジェクトでこのデリゲートパターンが採用されています。デリゲートパターンにおけるポリモーフィズムの性質を活かすことで、再利用性の高いUI部品が提供されています。

**＜補足: プロトコルのclass継承について＞**

```swift:プロトコルのclass継承
protocol ViewProtocol: class {
    func updateUI()
}
```

上記のコード例では、ViewProtocolは**classを継承**させています。classを継承すると、そのプロトコルはクラスにしか適用できなくなります。先に説明したように、Modelのviewプロパティはweak（弱参照）で定義されているため、クラス（参照型）である必要があります。クラス以外の構造体や列挙体は値型であるため、weakを利用できません。そのため、**ViewProtocolがクラス（参照型）であることを明示するため**にclassを継承する必要があります。

```swift
class Model {
    // weakがついているのでViewProtocolは参照型である必要がある
    weak var view: ViewProtocol?
```

## 3. NotificationCenterパターン
次に**[NotificationCenter](https://developer.apple.com/documentation/foundation/notificationcenter)**クラスを利用した通知のパターンを説明します。NotificationCenterは受信登録したオブジェクトに対し情報をブロードキャストします。また、同じ通知名を別のオブジェクトからも送信できるため、多対多の通知を実現できます。

NotificationCenterは以下のように利用できます。通知名はNotification.Nameをextensionで拡張し、staticプロパティで定義しておくと利用しやすいです。

```swift:NotificationCenterの使い方
// 通知名を登録
extension Notification.Name {
    static let updateDataNotification = Notification.Name("updateDataNotification")
}

//　通知の受信登録（updateDataNotificationの通知を受信したら、updateUIメソッドを実行）
NotificationCenter.default.addObserver(self, 
                                       selector: #selector(updateUI),
                                       name: .updateDataNotification,
                                       object: nil)

// 通知の送信（updateDataNotificationの通知を送信）
NotificationCenter.default.post(name: .updateDataNotification,
                                object: nil)
```

NotificationCenterを利用した場合のModelからViewへ通知する例は以下のようになります。

```swift:NotificationCenterパターン
// 通知名を登録
extension Notification.Name {
    static let updateDataNotification = Notification.Name("updateDataNotification")
}

class View {
    var model: Model = Model()
    
    init() {
        // 通知の受信登録（updateDataNotificationの通知を受信したら、updateUIメソッドを実行）
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateUI),
                                               name: .updateDataNotification,
                                               object: nil)
    }
    
    func receiveUIEvent() {
        model.updateData()
    }
    
    @objc func updateUI() {
        print("\(model.data)")
    }
}

class Model {
    var data: Int = 0
    func updateData() {
        data += 1
        
        // 通知の送信（updateDataNotificationの通知を送信）
        NotificationCenter.default.post(name: .updateDataNotification,
                                        object: nil)
    }
}
```
※通知の受信解除（removeObserver）はiOS9以降ではdeinit時に自動で実行されます。
※Selectorは実行時に呼び出すメソッドが決定する、Objective-C方式の動的な呼び出しを行うため、updateUIメソッドには`@objc`属性をつけています。

NotificationCenterパターンは通知名の文字列で簡単に通知を実装できますが、**多用すると処理の流れが追いづらく、スパゲッティプログラムになる可能性もある**ので、少し注意が必要です。**N対Nの通知が必要な場合や通知したいオブジェクト間に直接の参照関係がない場合**にも利用できるため、そのようなケースでは有効です。

## 4. KVO（Key-Value Observing: キー値監視）パターン
KVOは**特定のオブジェクトのプロパティ値の変化を監視する仕組み**です。
Objective-Cのランタイム機能を利用しているため、監視対象のオブジェクトはObjective-Cの**NSObjectを継承している必要**があります。Swift4では、監視部分のコードをクロージャーで書けるようになり、より使いやすくなりました。

```swift:KVOパターン
class View {
    var model: Model = Model()
    
    // 監視オブジェクトを保持する
    var observation: NSKeyValueObservation?
    
    init() {
        // modelのdataプロパティをKVOで監視する
        observation = model.observe(\.data, options: [.new]) { model, change in
            // model.dataが変化した場合に実行されるクロージャー
            if let newValue = change.newValue {
                print(newValue) // print(model.data) でもOK
            }
        }
    }
    
    func receiveUIEvent() {
        model.updateData()
    }
}

// NSObjectを継承
class Model: NSObject {
    // @objcとdynamicをつける
    @objc dynamic var data: Int = 0
    func updateData() {
        data += 1
    }
}
```

KVOではObjective-Cのランタイム呼び出しによる動的ディスパッチ（実行時に動的にプロパティが決定される）を利用するため、監視するプロパティには`@objc`属性と`dynamic`キーワード（dynamic dispatch）が必要です。

WebKitの[WKWebView](https://developer.apple.com/documentation/webkit/wkwebview)のプロパティの中には、[title](https://developer.apple.com/documentation/webkit/wkwebview/1415015-title)や[url](https://developer.apple.com/documentation/webkit/wkwebview/1415005-url)、[estimatedProgress](https://developer.apple.com/documentation/webkit/wkwebview/1415007-estimatedprogress)など、**KVOに対応したプロパティ**(key-value observing compliant)があり、KVOと相性が良いです。逆に、構造体（struct）はNSObjectを継承することができないため、KVOは利用できません。

## 5. Closure Callbackパターン
次に、よく使われるClosure Callbackパターンを説明します。Closure Callbackパターンでは、**完了後の処理をクロージャーで受け取り、そのコールバック用のクロージャーを実行する**ことで通知します。

```swift:ClosureCallbackパターン
class View {
    var model: Model = Model()
    
    func receiveUIEvent() {
        // 完了後の処理をクロージャーで指定する
        // 末尾のクロージャーの引数名は省略できる（trailing closure記法）
        model.updateData { data in
            print(data)
        }
    }
}

class Model {
    var data: Int = 0
    
    // 完了後の処理を引数のクロージャーで受け取って実行する
    func updateData(completion: (_ data: Int) -> Void) {
        data += 1
        completion(data)
    }
}
```
Closure Callbackパターンは通知完了後の処理を呼び出しメソッドの近くに書けるため、可読性が高くなります。ただし複数の非同期処理を逐次実行する場合は、クロージャーのネストが深くならないように注意が必要です。

```swift:Closureのネストが深くなる例
func receiveUIEvent() {
    model.updateData(completion: { data in
        model.updateData(completion: { data in
            model.updateData(completion: { data in
                print(data)
            })
        })
    })
}
```

Closure CallbackパターンはUIKitでも利用されています。例えば、UIAlertControllerのUIAlertActionはダイアログタップ時の処理をクロージャーで指定します。

```swift:UIAlertAction
let alertAction = UIAlertAction(title: "OK",
                                style: .default) { handler in
                                // OKボタンタップ時の処理
                                print("OKがタップされました")
}
```

## 6. Data Bindingパターン
最後に、Data Bindingパターンを説明します。Swiftではデータバインディングの仕組みは言語としてサポートされておらず、その実現のために大抵はライブラリを利用しています。Data Bindingパターンを実現する方法の一つとして、**bind の仕組みを備えたgenericな型を用意し、それをプロパティとする**ことが挙げられます。



```swift:DataBindingパターンの例
/// 簡易的なデータバインディング機能を実現するクラス
class Variable<E> {
    var value: E {
        didSet {
            // プロパティオブザーバーによりデータの変更時にバインディング先に通知
            callbacks.forEach { $0(value) }
        }
    }

    // バインディング用のクロージャーを保持
    private var callbacks: [((E) -> Void)] = []

    init(_ value: E) {
        self.value = value
    }

    func bind(dataDidChange: @escaping (E) -> Void) {
        callbacks.append(dataDidChange)
    }
}

class View {
    let model: Model = Model()

    init() {
        // データの変更時の処理を記述
        model.data.bind() { data in
            print(data)
        }
    }

    func receiveUIEvent() {
        model.updateData()
    }
}

class Model {
    let data = Variable(0)

    func updateData() {
        data.value += 1
    }
}
```

# 通知パターンの比較と使い分け
最後に通知のパターンの使い分けについて考えてみます。

通知のパターンはこれが一番良いというものはありません。用途に応じて適切に通知のパターンを選択する必要があります。まずは**通知元と通知先の数の関係に応じて通知のパターンを選択**します。その上で、各通知方法のメリット・デメリットを考慮し、採用するのが良いかと思います。

| 通知のパターン | 通知元と通知先の数 | メリット |デメリット|
|:-:|:-:|:-:|:-:|
| Delegate  | 1：1 | プロトコルにより実装すべき通知インタフェースが明確。 | 通知するメソッドが1つの場合は、記述量に見合わない。 |
| Notification | N：N | 直接の参照がないオブジェクト間でも通知が可能。オブジェクト間が疎結合。 | 多用すると処理が追いづらくなる。グローバルなスコープで通知を行うため、プログラマが意図しない処理が動いてしまう可能性がある。 |
| KVO  | 1：N  | WKWebViewなどKVOに対応したクラスと相性が良い。 |Objective-Cのランタイムが必要。構造体では利用できない。|
| Closure Callback  | 1：1 | 処理の依頼部分と完了後の処理を近くに書くことができ、可読性が高い。 | クロージャーのネストが増えすぎると逆に可読性が落ちる。 |
| Data Binding  | 1：N | 構造体でもKVOと同様のことが実現可能。 | 言語レベルでサポートされないため、実装なための記述量が増える、もしくはライブラリの採用が必要 |

少し長めになってしまいましたが、ご覧いただきありがとうございます。間違っている点や不明な点があれば編集リクエストやコメントにて記載いただけますと幸いです。

