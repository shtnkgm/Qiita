# Swiftのattributeまとめ[Swift4対応]
Swiftのattributeの一覧です。

# attributeとは
 - コンパイラに対し、宣言や型の補足情報を伝えるものです
 - 属性や修飾子とも呼ばれます。
 - Swift4では[公式リファレンス]((https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Attributes.html))に記載されているもので全19種類あります。

# attributeの記法
 - attributeの記法は以下のようになり、より詳細な情報を補足するために引数も指定することができます。
 - **@〜**という記法はコンパイラディレクティブと呼ばれ、コンパイラに対する指示を記載する際に利用されます。

```swift
// 引数なしの場合
@属性名

// 引数ありの場合
@属性名（引数）
```

# attribute一覧

### `@autoclosure`
 - 以下のように、呼び出し部分で引数として渡した値を、メソッド（関数）内ではクロージャーとして扱えます
 - クロージャーとして渡しているため、引数が実際に評価されるのは、クロージャーの実行時になります（遅延評価が可能）

```swift:例
// 定義部分
func someMethod(closure: @autoclosure () -> Int) {
    print(closure())
}

// 呼び出し部分
someMethod(closure: 10)
```
利用シーンは少ないと想定しますが、&&演算子や||演算子の実装などで利用されています

```swift:&&演算子、||演算子の実装
public static func &&(lhs: Bool, rhs: @autoclosure () throws -> Bool) rethrows -> Bool
public static func ||(lhs: Bool, rhs: @autoclosure () throws -> Bool) rethrows -> Bool
```

### `@escaping`
 - クロージャをスコープ外でも保持する必要があることを示します
 - 以下の例では、completionクロージャーの実行を非同期で実行しているため、スコープ外ではクロージャーが保持されず、コンパイルエラーとなります
 
```swift:例
// NG: コンパイルエラー
func someAsyncMethod(completion: () -> Void) {
    DispatchQueue.main.async {
       completion()
    }
}

// OK
func someAsyncMethod(completion: @escaping () -> Void) {
    DispatchQueue.main.async {
       completion()
    }
}
```

### `@convention`
 - 関数のポインタに対し、その呼び出し方式を指定します

```swift:例
// Swiftの関数ポインタ(デフォルト)
var swiftFunction: @convention(swift) (Bool) -> Bool

// Objective-Cと互換性をもつブロックポインタ
var block: @convention(block) (Bool) -> Bool

// C言語の関数ポインタ
var cFunction: @convention(c) (Bool) -> Bool
```

### `@available`
 - 各OSバージョンなどの環境に対し、APIの有効性を表します
 - Swiftのバージョン（swift）
 - プラットフォームの種類（iOS,iOSApplicationExtension, macOS, macOSApplicationExtension, watchOS, watchOSApplicationExtension ,tvOS, tvOSApplicationExtension）

```swift:例
// 全環境（*）で利用不可（unavailable）、SomeProtocolにリネームした（renamed:）
@available(*, unavailable, renamed: "SomeProtocol")
protocol MyProtocol { ... }

// macOS 10.12で廃止（obsoleted）とメッセージを表示（message）
@available(macOS 10.12, obsoleted=10.12, message="macOS 10.12で廃止されました")
func someMethod() { ... }

// iOS2で導入（introduced）、iOS9で非推奨（deprecated）
@available(iOS, introduced=2.0, deprecated=9.0)
var some: String
```

例えば、iOS9で非推奨となった、UIAlertViewは以下のようにattribute指定することで、UIAlertViewを利用した際にコンパイラ警告を出し、UIAlertControllerの利用を推奨しています。

![スクリーンショット 2017-06-30 4.50.06.png](https://qiita-image-store.s3.amazonaws.com/0/113553/519836b8-1d4f-9021-60f3-d7b1f323d08f.png)

```swift:UIAlertView.h
@available(iOS, introduced: 2.0, deprecated: 9.0, 
message: "UIAlertView is deprecated. Use UIAlertController with a 
preferredStyle of UIAlertControllerStyleAlert instead")
open class UIAlertView : UIView { ... }
```


### `@discardableResult`
 - 返り値を持つ関数やメソッドの返り値を利用しなかった場合のコンパイラ警告を無視します
 - 返り値を必ずしも利用しなくて良いメソッドを定義するのに適します

```swift:例
// メソッドの定義部分
func someMethod1() -> Bool { ... }

@discardableResult
func someMethod2() -> Bool { ... }

// 呼び出し部分
someMethod1() // NG:メソッドの返り値を利用していないためコンパイラ警告がでる
someMethod2() // OK
```
`@discardableResult`を指定しない場合は「Result of call to 'someMethod()' is unused」とwarningが表示されます。
![スクリーンショット 2017-06-30 4.57.07.png](https://qiita-image-store.s3.amazonaws.com/0/113553/52b29521-799f-1ffa-728b-bac95a8de571.png)

### `@objc`
 - Objective-Cから使用できることを明示的に宣言します
 - extensionに指定すると全てのメンバに一括で指定できます
 - `@objc(引数)`でObjective-Cで使いたい名前を指定できます
 - Swift4以前ではNSObjectを継承したクラスやdynamicでは暗黙的に`@objc`が付け加えられていましたが、Swift4では付与されなくなりました（[Proposal: SE-0160](https://github.com/apple/swift-evolution/blob/master/proposals/0160-objc-inference.md)）

```swift:例
// someMethodとしてObjective-Cから利用可能
@objc(someMethod)
func someMethodForObjc() { ... }
```

### `@nonobjc`
 - Objective-Cから使用できないことを明示的に宣言します
 - extensionに指定すると全てのメンバに一括で指定できます

```swift:例
@nonobjc
func SomeMethodForSwift() { ... }
```

### `@objcMembers`
 - クラス全体に対し一括でObjective-Cから使用できることを明示的に宣言します
 - @objcMembersを付与したクラスのサブクラスやエクステンションにも影響します。
 - Swift4で導入（[Proposal: SE-0160](https://github.com/apple/swift-evolution/blob/master/proposals/0160-objc-inference.md)）

```swift:例
@objcMembers
class MyClass : NSObject {
    // @objcになる
    func foo() { }             

    // @objcにならない（タプルを返しているため）
    func bar() -> (Int, Int) { return (1, 1) }   
}

extension MyClass {
    // @objcになる
    func baz() { }   
}

class MySubClass : MyClass {
    // @objcになる
    func wibble() { } 
}

extension MySubClass {
    // @objcになる
    func wobble() { }   
}
```

### `@GKInspectable`
 - カスタムのGameplayKitコンポーネントプロパティをSpriteKitエディタのUIに公開します
 - 暗黙的に`@objc`が付け加えられる

```swift:例
class MyComponent: GKComponent {
    @GKInspectable var speed: Float = 1.0
    @GKInspectable var friction: Float = 2.0
}
```

### `@UIApplicationMain`
 - アプリケーションデリゲートであることを示します（iOSアプリ用）
 - この属性がない場合はmain.swiftを用意し、UIApplicationMain(_:_:_:)関数を利用してデリゲート設定を行います

```swift:例（AppDelegate.swift）
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    func applicationWillResignActive(_ application: UIApplication) { }
    func applicationDidEnterBackground(_ application: UIApplication) { }
    func applicationWillEnterForeground(_ application: UIApplication) { }
    func applicationDidBecomeActive(_ application: UIApplication) { }
    func applicationWillTerminate(_ application: UIApplication) { }
}
```

### `@NSApplicationMain`
 - アプリケーションデリゲートであることを示します（macアプリ用）
 - この属性がない場合はmain.swiftを用意し、UIApplicationMain(_:_:_:)関数を利用してデリゲート設定を行います

```swift:例（AppDelegate.swift）
import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) { }
    func applicationWillTerminate(_ aNotification: Notification) { }
}
```

### `@NSCopying`
 - ストアドプロパティのセッターでコピーした値をセットします
 - Objective-Cのcopy属性と同様
 - Swift4でイニシャライザでの挙動が改善されました（[Proposal: SE-0153](https://github.com/apple/swift-evolution/blob/master/proposals/0153-compensate-for-the-inconsistency-of-nscopyings-behaviour.md)）

```swift:例
@NSCopying var foo: Foo
```

### `@NSKeyedArchiverClassName`
 - クラスに対し、インスタンスをアーカイブする際に`NSKeyedArchiver`や`NSKeyedUnarchiver`で利用される名前を指定します

### `@NSManaged`
 - クラスのインスタンスメソッドやストアドプロパティに対し、CoreDataで実行時に動的に実装が生成されることを宣言します

```swift:例
@NSManaged var name: String
```

### `@testable`
 - モジュールのimport宣言に対し、internal以上のアクセスレベルで公開されているメソッドやプロパティに対しテストクラスがアクセス可能なことを宣言します

```swift:例
@testable import SomeModule
```

### `@IBAction`
 - メソッドがInterfaceBuilder（StoryBoard）に配置したパーツのアクションに紐付けられることを示します
 - 暗黙的に`@objc`が付け加えられます

```swift:例
@IBAction func buttonTapped() { ... }
```

### `@IBOutlet`
 - プロパティがInterfaceBuilder（StoryBoard）に配置したパーツに紐づけられることを示します
 - 暗黙的に`@objc`が付け加えられます

```swift:例
@IBOutlet weak var detailDescriptionLabel: UILabel!
```

### `@IBDesignable`
 - UIViewまたはNSViewを継承したカスタムクラスに指定するとデザインやサブビューがInterfaceBuilder（StoryBoard）上でライブレンダリングされます
 - 暗黙的に`@objc`が付け加えられます

```swift:例
@IBDesignable class CustomView: UIView { ... }
```

### `@IBInspectable`
 - プロパティに指定すると、InterfaceBuilder（StoryBoard）のAttribute Inspectorで設定でき、ライブレンダリングでデザインを確認できます
 - 対応する型（Int, CGFloat, Double, String, Bool, CGPoint, CGSize, CGRect, UIColor, UIImage）
 - 暗黙的に`@objc`が付け加えられます

```swift:例
@IBInspectable 
public var cornerRadius: CGFloat = 2.0 { 
    didSet { 
        self.layer.cornerRadius = self.cornerRadius 
    } 
}
```

# 参考
[The Swift Programming Language (Swift 4) - Attributes](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Attributes.html)

