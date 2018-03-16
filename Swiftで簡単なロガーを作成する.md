# Swiftで簡単なロガーを作成する
# はじめに
Swift用ロギングライブラリの[SwiftyBeaver](https://github.com/SwiftyBeaver/SwiftyBeaver)などを参考にできるだけシンプルなロガーをSwiftで作成してみます。もちろんOSSのロガーを利用するのも便利で良いですが、自分の思い通りにロガーをつくるのも面白いと思います。

# どんなロガーをつくるか

## 必要な機能
 ロガーをつくる上で、あった方が便利な機能を挙げてみます。

 1. 特に何もしなくてもログの実行箇所が出力される
  - クラス
  - メソッド
  - 行数
 2. 実行日時が出力される 
 3. ログの重要度でフィルタできるように、ログレベルを出力する
  - verbose
  - debug
  - info
  - warn
  - error
 4. ログレベルがerrorの場合はさらにプログラムを停止させる
 5. デバッグビルド時にのみ出力する（リリースビルド時には出力しない）

## 利用イメージ
こんな風に書くと、

```swift:ログの実行イメージ
Logger.info()
Logger.debug("Viewのサイズ: \（view.frame.size）")
Logger.error("ここが実行されたら何かがおかしい")
```
こんな風に出力されるものをつくります。

```:ログの出力イメージ
2018/01/15 23:19:50 [INFO] ViewController.viewDidLoad() #20
2018/01/15 23:20:00 [DEBUG] ViewController.viewDidApper() #39: Viewのサイズ: (375.0, 667.0)
2018/01/15 23:21:10 [ERROR] APIClient.request() #15: ここが実行されたら何かがおかしい
```

# 実装

## ポイント
**「特に何もしなくてもログの実行箇所が出力される」**を実現するために、ログの実行メソッドの引数のデフォルト値に、`#function`などを指定し、呼び出し側は何も指定しなくても良いようにしています。

```swift
   public static func info(file: String = #file, function: String = #function, line: Int = #line, _ message: String = "") {
        printToConsole(logLevel: .info, file: file, function: function, line: line, message: message)
    }
```

**「ログの重要度でフィルタできるように、ログレベルを出力する」**を実現するため、ログレベルをenumで表現しました。ログレベルはログメソッドの引数にしても良かったのですが、メソッド名にしたほうが使いやすいのでメソッド名にしました。

```swift:ログの重要度でフィルタできるように、ログレベルを出力する
    public enum LogLevel: String {
        case verbose
        case debug
        case info
        case warn
        case error
    }

    public static func verbose( 〜略〜 )　{ 〜略〜 }
    public static func debug( 〜略〜 )　{ 〜略〜 }
    public static func info( 〜略〜 )　{ 〜略〜 }
    public static func warn( 〜略〜 )　{ 〜略〜 }
    public static func error( 〜略〜 )　{ 〜略〜 }
```

**「ログレベルがerrorの場合はさらにプログラムを停止させる」**を実現するため、ログレベルがerrorの場合は、`assertionfailure()`を実行し、プログラムを停止させます。

```swift:ログレベルがerrorの場合はさらにプログラムを停止させる
    public static func error(file: String = #file, function: String = #function, line: Int = #line, _ message: String = "") {
        printToConsole(logLevel: .error, file: file, function: function, line: line, message: message)
        assertionFailure(message)
    }
```

**「デバッグビルド時にのみ出力する（リリースビルド時には出力しない）」**を実現するため、DEBUGのプリプロセッサマクロの判定文をログ出力部分に書いています。

```swift:デバッグビルド時にのみ出力する（リリースビルド時には出力しない）
    private static func printToConsole(logLevel: LogLevel, file: String, function: String, line: Int, message: String) {
        #if DEBUG
            print("\(dateString) [\(logLevel.rawValue.uppercased())] \(className(from: file)).\(function) #\(line): \(message)")
        #endif
    }
```

## 完成コード
ソースコードは以下の1ファイルのみです。

```swift
import Foundation

public struct Logger {
    private static var dateString: String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return formatter.string(from: date)
    }

    public enum LogLevel: String {
        case verbose
        case debug
        case info
        case warn
        case error
    }

    public static func verbose(file: String = #file, function: String = #function, line: Int = #line, _ message: String = "") {
        printToConsole(logLevel: .verbose, file: file, function: function, line: line, message: message)
    }

    public static func debug(file: String = #file, function: String = #function, line: Int = #line, _ message: String = "") {
        printToConsole(logLevel: .debug, file: file, function: function, line: line, message: message)
    }

    public static func info(file: String = #file, function: String = #function, line: Int = #line, _ message: String = "") {
        printToConsole(logLevel: .info, file: file, function: function, line: line, message: message)
    }

    public static func warn(file: String = #file, function: String = #function, line: Int = #line, _ message: String = "") {
        printToConsole(logLevel: .warn, file: file, function: function, line: line, message: message)
    }

    public static func error(file: String = #file, function: String = #function, line: Int = #line, _ message: String = "") {
        printToConsole(logLevel: .error, file: file, function: function, line: line, message: message)
        assertionFailure(message)
    }

    private static func className(from filePath: String) -> String {
        let fileName = filePath.components(separatedBy: "/").last
        return fileName?.components(separatedBy: ".").first ?? ""
    }

    private static func printToConsole(logLevel: LogLevel, file: String, function: String, line: Int, message: String) {
        #if DEBUG
            print("\(dateString) [\(logLevel.rawValue.uppercased())] \(className(from: file)).\(function) #\(line): \(message)")
        #endif
    }
}
```

# まとめ
これだけで簡単にロガーをつくることができました。+αの機能として、**ファイルやクラウド上に保存するなど拡張する**、もっと**見やすくログを色付け**したり、**絵文字🍏を出力**しても面白いかと思います。もしも、開発アプリにロガーを導入していない場合はデバッグに大いに役立ちますので、検討してみても良いかと思います。

# 参考記事

- [Swift向けのシンプルなロギングライブラリを作った](https://qiita.com/gomi_ningen/items/5194d0bfb555608130f2)
- [Swiftの自前ログクラス](https://qiita.com/VirgomanBros/items/0e1bc3b0073057f607bb)
- [「Swiftの自前ログクラス」のSwift3対応版](https://qiita.com/hirocueki2/items/643c05819039a4120c68#_reference-de88920dc6f524d73829)

