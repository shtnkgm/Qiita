# Swiftのイニシャライザについて
# はじめに
Swiftの型（クラス、構造体、列挙体）とイニシャライザの関係を整理します。
以下のキーワードが**モヤっとしている方におすすめ**です。

 - Failable Initilizer｜失敗可能イニシャライザ
 - Default Initializer｜既定イニシャライザ
 - Memberwise Initilaizer｜全項目イニシャライザ
 - Designated Initializer｜指定イニシャライザ
 - Convenience Initializer｜簡易イニシャライザ
 - Required Initializer｜必須イニシャライザ

# イニシャライザとは
 - 型（クラス、構造体、列挙体）のインスタンスを初期化（initialize）する特殊なメソッドのこと
 - [Apple公式リファレンス｜Initialization](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html)

```swift:
init() {
    // 初期化
}
```

# イニシャライザの記法
通常のメソッドの記法に近いですが、イニシャライザは特殊なメソッドのため、funcキーワードが不要です。また呼び出し時のメソッド名も省略できます。イニシャライザ内では全てのプロパティの初期化が完了していないとインスタンスメソッドは実行できません。

```swift
class User {
    let name: String
    
    // funcが不要（initキーワードのみ）
    init(name: String) {
        // 全てのプロパティを初期化する前にインスタンスメソッドを実行することはできない
        // printName() → コンパイルエラー
        self.name = name
        printName() // OK
    }
    
    // インスタンスメソッド
    func printName() {
        print(name)
    }
}
let user1 = User.init(name: "hoge")
// 呼び出し時のメソッド名が省略可能
let user2 = User(name: "hoge")
```

## なぜイニシャライザでの初期化が必要なの？
プロパティが正しく初期化できない場合...

 - 型の整合性が取れない
 - メモリ安全でない（メモリ確保、初期化がされる前にインスタンスにアクセスしてしまう）

CやObjective-Cでは初期化がされていない場合は、強引に0やfalse、NULLなどを値に代入し、初期化していましたが、これは予期せぬ動作となる可能性があり、バグの元となります。それに対し、Swiftでは型の整合性や初期化はコンパイラによってプログラム実行前に静的にチェックされるためより安全です。

以下の例では、非Optionalとして宣言した定数を初期化していないため、nameは実質nilとなり型の不整合が生じます。

```Swift:例）非Optionalのプロパティに何も値が入っていない（nil）
class Book {
    let name: String
    
    init(name: String) {
        // エラー
        // return from initializer without initializing all stored properties
    }
}
```

## Swiftクイズ：どのプロパティの初期化が必要？
以下ケースの場合、どのプロパティを初期化する必要があるでしょうか？

```swift
class MyClass {
    let a: Int
    let b: Int = 0
    let c: Int?
    let d: Int? = 0
    var e: Int
    var f: Int = 0
    var g: Int?
    var h: Int? = 0
    var i: Int { return 0 }
    var j: Int? { return 0 }
    
    init() {
        // どのプロパティを初期化する???
    }
}
```

## 正解
正解はa、c、eです。

```swift
class MyClass {
    let a: Int
    let b: Int = 0
    let c: Int?
    let d: Int? = 0
    var e: Int
    var f: Int = 0
    var g: Int?
    var h: Int? = 0
    var i: Int { return 0 }
    var j: Int? { return 0 }
    
    init() {
        a = 0
        c = 0
        e = 0
    }
}
```

## 解説
Swiftクイズの各プロパティを分類すると以下のようになります。

```swift
    // （不要）コンピューテッドプロパティ
    var i: Int { return 0 }
    var j: Int? { return 0 }

    // （不要）デフォルト値ありのストアドプロパティ
    let b: Int = 0
    let d: Int? = 0
    var f: Int = 0
    var h: Int? = 0

    // （不要）Optional型の変数ストアドプロパティ
    // ★暗黙的にnilがデフォルト値として設定される
    var g: Int?

    // （必要）デフォルト値なし、非オプショナルの変数ストアドプロパティ
    var e: Int

    // （必要）デフォルト値なしの定数ストアドプロパティ
    let a: Int
    let c: Int?
```

※ストアドプロパティ（stored property）：値を保持するプロパティ
※コンピューテッドプロパティ（computed property）：値を保持せず計算するプロパティ

## 変数プロパティの暗黙的なnil代入について

デフォルト値なしのOptionalのストアドプロパティに関しては定数か変数かによって挙動が異なります。変数の場合は暗黙的にnilが代入されますが、定数はnilが代入されません。定数の場合、暗黙的にnilを代入しても、変更ができないので意味がないためです。

[Apple公式リファレンス｜Initialization - Optional Property Types](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html)
> Properties of optional type are automatically initialized with a value of nil, indicating that the property is deliberately intended to have “no value yet” during initialization.

## イニシャライザ内で初期化の要否まとめ

|要否|プロパティ種別|補足説明|
|:---|:---|:---|
|必要|デフォルト値なしの定数ストアドプロパティ|-|
|必要|デフォルト値なし、非オプショナルの変数ストアドプロパティ|-|
|-|Optional型の変数ストアドプロパティ|暗黙的にnilで初期化される|
|-|デフォルト値ありのストアドプロパティ|デフォルト値で初期化される|
|-|コンピューテッドプロパティ|値を保持しないので初期化が不要|

# すべての型で共通のイニシャライザ
ここからはクラス、構造体、列挙体で共通のイニシャライザについて説明します。

## 失敗可能イニシャライザ｜Failable Initilizer
 - 初期化に失敗する可能性のあるinitilizer
 - 戻り値はOptional型（初期化に失敗した場合にnilを返す）

```swift:失敗可能イニシャライザの例
class WebPage {
    let title: String
    let url: URL
    init?(title: String, urlString: String) {
        // URL文字列をURLに変換できない場合は初期化を失敗させる
        guard let url = URL(string: urlString) else { return nil }
        self.title = title
        self.url = url
    }
}
```

## 既定イニシャライザ｜Default Initializer
 - プロパティの初期化が不要な場合に暗黙的に定義される

```swift
class MyClass {
    var name: String = "MyClass"
    var number: Int = 0
 
    // 暗黙的にinit()が実装される
}

let myClass = MyClass()
```

# 構造体（Struct）のイニシャライザ

## 全項目イニシャライザ｜Memberwise Initilaizer
 - structで暗黙的に定義されるイニシャライザ
 - プロパティが多い場合に、イニシャライザを実装する手間が省ける

```swift:全項目イニシャライザの例
struct Book {
    let id: String
    let title: String
    var price: Int
    
    // イニシャライザは実装していない
}

let book = Book(id: "001", title: "SwiftyBook", price: 1500)
```

通常、独自イニシャライザを定義すると利用できなくなりますが、extentionに独自イニシャライザを定義することで、それを回避できます。

```swift:独自イニシャライザをextensionに記載
struct Book {
    let id: String
    let title: String
    var price: Int
}

// 独自イニシャライザをextensionに記載
extension Book {
    init() {
        id = "000"
        title = "タイトルなし"
        price = 0
    }
}

let book1 = Book(id: "001", title: "SwiftyBook", price: 1500)
let book2 = Book()
```

ただし、暗黙的に実装される全項目イニシャライザのアクセスレベルはinternalです。ライブラリ化などで、別モジュールからアクセスする必要がある場合は注意しましょう。

# 列挙体（enum）のイニシャライザ

## 列挙体のメンバ名で初期化
enumはストアドプロパティを持たないため、初期化は簡単です。

```swift
enum TrafficSignal {
    case green
    case yellow
    case red
}

let signal: TrafficSignal = .green
```

## 独自イニシャライザ
独自のイニシャライザも実装することができます。イニシャライザ内では、selfに値を代入します。

```swift
enum TrafficSignal {
    case green
    case yellow
    case red
    
    init() {
        self = .red
    }
}

// .red
let signal = TrafficSignal() 
```

## raw valueが定義されている場合のイニシャライザ
raw valueを引数に取る失敗可能イニシャライザが暗黙的に定義されます。

```swift
enum TrafficSignal: String {
    case green
    case yellow
    case red

    // 失敗可能イニシャライザが暗黙的に定義される
}

let signal = TrafficSignal(rawValue: "yellow")
```

# クラス（class）のイニシャライザ
 - classはenumやstructと違い、継承の特徴を持つため、各階層で定義されたプロパティが初期化されることを保証する必要がある
 - サブクラスのプロパティだけでなく、スーパークラスのプロパティなども初期化する必要がある

![image.png](https://qiita-image-store.s3.amazonaws.com/0/113553/3bce1141-9903-2a73-dbb8-34755c9b6cbf.png)

## 指定イニシャライザ｜Designated Initializer
 - 必須のイニシャライザ
 - 全てのストアドプロパティを初期化する
 - 継承している場合は、初期化後にスーパークラスの指定イニシャライザを呼ぶ

```swift
class Book {
    let title: String
    let price: Int
    
    // 指定イニシャライザ
    init(title: String, price: Int) {
        self.title = title
        self.price = price
    }
}

class Ebook: Book {
    var urlString: String
    
    // 指定イニシャライザ
    init(title: String, price: Int, urlString: String) {
        self.urlString = urlString
        super.init(title: title, price: price)
    }
}
```

## 簡易イニシャライザ｜Convenience Initializer
 - 指定イニシャライザと違い、必須でない（初期化処理を便利にするためのイニシャライザ）
 - 指定イニシャライザをラップし、内部で指定イニシャライザを呼ぶ
 - 同一クラスのイニシャライザを呼び、最終的に指定イニシャライザを呼んでも良い
 - 最終的に指定イニシャライザで初期化する必要があるため、定数プロパティは簡易イニシャライザで初期化できない

```swift
class Book {
    let title: String
    let price: Int
    
    // 指定イニシャライザ
    init(title: String, price: Int) {
        self.title = title
        self.price = price
    }
}

class Ebook: Book {
    var urlString: String
    
    // 指定イニシャライザ
    init(title: String, price: Int, urlString: String) {
        self.urlString = urlString
        super.init(title: title, price: price)
    }
    
    // 簡易イニシャライザ
    convenience init(title: String, price: Int, url: URL) {
        self.init(title: title, price: price, urlString: url.absoluteString)
    }
}

let ebook1 = Ebook(title: "SwiftBook", price: 1000, urlString: "https://qiita.com/")
let url = URL(string: "https://qiita.com/")!
let ebook2 = Ebook(title: "SwiftBook", price: 1000, url: url)
```

## イメージ図
以下の図のように、どのイニシャライザを実行しても全ての階層の指定イニシャライザが実行されていることが分かります。
![image.png](https://qiita-image-store.s3.amazonaws.com/0/113553/2e6fa62c-613b-3485-8770-33b4478da967.png)

## 必須イニシャライザ｜Required Initializer
 - requiredキーワードのついたイニシャライザがある場合、サブクラスでの実装が必須となる
 - サブクラス側ではoverrideの記述は不要でrequiredのみ記述する（自明なため）

UIViewの準拠するNSCodingプロトコルでは必須イニシャライザが定義されています。それ以外ではあまり見ないため、必須イニシャライザの用途としてはあまり多くないのかもしれません。

```swift
class MyView: UIView {
    // 指定イニシャライザ
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    // 簡易イニシャライザ
    convenience init() {
        self.init(frame: .zero)
    }
    
    // 必須イニシャライザ（指定イニシャライザ）
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
```

プロトコルでイニシャライザを定義した場合、そのプロトコルに準拠するクラスでのイニシャライザ実装は必須イニシャライザとなります。

```swift:プロトコルでのイニシャライザ定義
protocol MyProtocol {
    var stringValue: String { get set }
    
    // requiredは指定していない
    init(intValue: Int)
}

class MyClass: MyProtocol {
    var stringValue: String
    
    // requiredが必要
    required init(intValue: Int) {
        stringValue = String(intValue)
    }
}
```

# まとめ
型とイニシャライザの関係、各イニシャライザの説明をまとめると以下のように整理できます。

|利用可能な型|種別|説明|
|:---|:---|:---|
|共通|Failable Initilizer/失敗可能イニシャライザ|初期化に失敗する可能性のあるイニシャライザ|
|共通|Default Initializer/既定イニシャライザ|初期化が不要な場合に暗黙的に実装されるイニシャライザ|
|構造体|Memberwise Initilaizer/全項目イニシャライザ|構造体で全てのストアドプロパティを初期化するよう暗黙的に実装されるイニシャライザ|
|クラス|Designated Initializer/指定イニシャライザ|全てのストアドプロパティを初期化し、親クラスがあれば親クラスの指定イニシャライザを実行する、必須のイニシャライザ|
|クラス|Convenience Initializer/簡易イニシャライザ|指定イニシャライザをラップする、任意のイニシャライザ|
|列挙体|Required Initializer/必須イニシャライザ|サブクラスでのイニシャライザの実装を必須とするイニシャライザ|

# 参考
 - Swift実践入門 ( http://gihyo.jp/book/2017/978-4-7741-8730-3 )
 - 詳解Swift ( http://www.sbcr.jp/products/4797390537.html )
 - [しめ鯖日記｜Swiftのプロパティーと初期化とConvenience initializer](http://llcc.hatenablog.com/entry/2015/05/23/163146)

