# SwiftとObjective-C混合プロジェクトのビルド速度改善方法
# 概要
古くからあるプロジェクトなど、まだSwift移行が完全にできていない場合など、**SwiftとObjective-Cの両方のコードが存在するプロジェクトで有効なビルド速度改善方法**を説明します。

Swift-Objective-Cのビルドプロセスに着目した、改善方法の原理も合わせて説明します。

# 無駄な再ビルドを防止する
まずはSwiftとObjective-Cの混合プロジェクトでビルドが遅くなる原因を説明します。デバッグビルドでは一度ビルドをした後に、再ビルドをする場合、**修正箇所の影響範囲に応じて**差分ビルドが実行されます。

ビルドを高速化するためには、この**差分ビルドの影響範囲を狭め、なるべく多くのファイルを再ビルドさせないこと**が重要です。また、フルビルドの場合でもコンパイラが考慮すべき依存関係を減らすことで、高速化が見込めます。

# ビルドプロセスに着目
では、**差分ビルドの影響範囲を狭め、依存関係を減らす**ためにはどうすべきでしょうか。SwiftとObjective-Cの混合プロジェクトの**ビルドプロセス**に着目してみます。

**ビルドプロセス**
![image.png](https://qiita-image-store.s3.amazonaws.com/0/113553/5d5e49b2-abbe-30bb-4766-8ed570877e47.png)


1. Objecitve-Cのヘッダファイル（.h）をコンパイル
2. Bridging Headerをコンパイル（Objecitve-CからSwiftに公開するもの）
3. Swiftファイルをコンパイル
4. Generated Headerをコンパイル（SwiftからObjective-Cに公開するもの）
5. Objecitve-Cの実装ファイル（.m）をコンパイル

上記の通り、Objective-CとSwift間のインタフェースはBridging HeaderとGenerated Headerとなります。そのため、SwiftからはBridging Headerしか見えておらず、Objective-CからはGenerated Headerしか見えていないことになります。

つまり、修正の結果、Bridging HeaderとGenerated Headerに修正が入らなければ、再ビルドの必要はありません。結論としてBridging HeaderとGenerated Headerを必要最低限にし、修正がなるべく入らないようにする工夫が必要です。

# Bridging Headerを最小限にする

## Bridging Headerでのimportは最低限に
シンプルですが、Bridging HeaderにはSwiftへ公開するヘッダファイル以外は記載しないようにします。過去は使っていたが、もうSwift側で利用しなくなった場合など、Bridging Headerからの消し忘れがないようにします。

## プロパティやメソッドの隠蔽
Bridging Headerでimportしているヘッダファイルの中身も最低限にします。
**Objective-C側にも公開する必要のないプロパティやメソッドは実装ファイル側に隠蔽**します。

プロパティなどはカテゴリにより実装ファイル側に記載できます。

```objc:実装ファイル
#import "SomeClass.h"
@interface SomeClass ()
@property (nonatomic, assign) int hoge; // 非公開プロパティ
@end
```

## カテゴリによるヘッダファイル分割
同一クラス内でSwiftに公開するものとそうでないものが混在する場合、ヘッダファイルの分割を検討します。以下のように、カテゴリによりヘッダファイルを分割することができます。

```objc:Swift側に公開するヘッダファイル
@interface SomeClass: NSObject
// ...
@end
```

```objc:ObjCのみに公開するヘッダファイル
#import "SomeClass.h"
@interface SomeClass ()
@property (nonatomic, strong) ObjCInternalClass *hoge; // ObjCのみで利用
@end
```

分割したヘッダファイルがSwift側に公開するもののみBridging Headerに記載します。

# Generated Headerを最小限にする
Generated Headerを最小限にするには、Generated Headerを生成するコンパイラディレクティブである`@objc`をなるべく付与しないようにする、もしくは付与したとしても隠蔽するようにします。

## `@objc`推論をオフに
Swift3まではNSObjectを継承したクラスのプロパティやメソッドなどには自動で`@objc`が推論により付与されます。一見気づきにくいですが、UIViewControllerを継承したクラスなど、UIKitのクラスはNSObjectを継承していますので、さらにそれらのクラスを継承した場合でも同様です。

Swift4ではビルド設定で`@objc`推論をオフ（OffまたはDefault）にすることができます。

![image.png](https://qiita-image-store.s3.amazonaws.com/0/113553/d176bc3f-29bc-a929-01f3-791d7d0e8ee3.png)

**推論を無効化し、必要最低限の`@objc`のみ付与**します。

## privateの利用
`@objc`を付与する必要があったとしても、Objective-C側のソースやその他のクラスに公開する必要のないプロパティやメソッドは**privateやfileprivateを付与し、外部から隠蔽**します。

```swift
class Some {
    @objc private var foo: Int
    @objc private func bar() { 
        ///
    }
```

Swift4環境未満で`@objc`が自動推論される場合でも同様です。

```swift
class Some: UIViewController {
    private var foo: Int
    private func bar() { 
        ///
    }
}
```

## セレクタを利用しない
セレクタを利用する場合、Objective-Cの動的ディスパッチ機能が必要なため、`@objc`を付与する必要が発生します。NotificationCenterのaddObserverメソッドやTimerのscheduledTimerメソッドなどではコールバック時の処理を**セレクタではなくクロージャで実行**するようにします。

```swift:コールバックにセレクタを利用したAPI
// Bad
func addObserver(_ observer: Any, 
        selector aSelector: Selector, 
            name aName: NSNotification.Name?, 
          object anObject: Any?)
```

```swift:コールバックにクロージャを利用したAPI
// Good
func addObserver(forName name: NSNotification.Name?, 
          object obj: Any?, 
           queue: OperationQueue?, 
           using block: @escaping (Notification) -> Void) -> NSObjectProtocol
```

# 参考
 - [Building Faster in Xcode](https://developer.apple.com/videos/play/wwdc2018/408/)

