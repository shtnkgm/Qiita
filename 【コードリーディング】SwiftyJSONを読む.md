# 【コードリーディング】SwiftyJSONを読む
# はじめに
自分がよく利用しているOSSの**SwiftyJSON**のソースコードを読んでみようと思います。

> SwiftyJSON
https://github.com/SwiftyJSON/SwiftyJSON

SwiftyJSONはSwiftでJSONデータを簡単に扱うためのライブラリです。
同様な機能を持つライブラリには[Himotoki](https://github.com/ikesyo/Himotoki)や[ObjectMapper](https://github.com/Hearst-DD/ObjectMapper)などがあり、幅広く利用されているライブラリの１つです。

**基本情報（2017/9月現在）**

 - サポート環境iOS8以上、macOS10.1以上、tvOS9.0以上、watchOS2.0以上
 - CocoaPods、Carthage、Swift Package Managerでのインストールに対応
 - MITライセンス（https://github.com/SwiftyJSON/SwiftyJSON/blob/master/LICENSE）
 - Star数15,453
 - 最新リリースバージョン3.1.4

# ソースコード
SwiftyJSONのメインファイルは意外と少なく、以下の**SwiftyJSON.swift**の1ファイルのみです。

> SwiftyJSON / Source / [SwiftyJSON.swift](https://github.com/SwiftyJSON/SwiftyJSON/blob/master/Source/SwiftyJSON.swift)

行数は、**1453行でstructが1つとprotocolが1つ、enumが5つ**です。class定義はありません。各定義の中身の説明は大枠に留め、ファイル構造だけ俯瞰すると以下のようになっています。

```swift:SwiftyJSON.swift（要約）
// ライセンス表記（MIT）

// エラードメイン、エラーコードに関する定数定義
// （deprecatedとなっており、下記のenumの利用を推奨している）

// SwiftyJSONに関するエラーの定義
public enum SwiftyJSONError: Int, Swift.Error { }

// CustomNSErrorプロトコルに準拠し、エラードメインやエラーコード、ユーザー向け情報を定義
extension SwiftyJSONError: CustomNSError { }

// http://www.json.orgに基づくJSONに含まれる型の定義
public enum Type: Int { }

// JSONのデータ構造を表現する構造体
// 各種イニシャライザメソッド、マージメソッド、プロパティ定義
public struct JSON { }

// ネストしたJSONをアンラップするための関数
private func unwrap(_ object: Any) -> Any { }

// Comparableプロトコルに準拠したIndexの定義
public enum Index<T: Any>: Comparable { }

// JSON構造体をCollectionプロトコルに準拠
extension JSON: Swift.Collection { }

// JSON構造体をsubscript（添字）でアクセス可能にする
public enum JSONKey { }
public protocol JSONSubscriptType { }
extension Int: JSONSubscriptType { }
extension String: JSONSubscriptType { }
extension JSON { }

// JSON型の変数に各リテラルを代入できるようにする
extension JSON: Swift.ExpressibleByStringLiteral { }
extension JSON: Swift.ExpressibleByIntegerLiteral { }
extension JSON: Swift.ExpressibleByBooleanLiteral { }
extension JSON: Swift.ExpressibleByFloatLiteral { }
extension JSON: Swift.ExpressibleByDictionaryLiteral { }
extension JSON: Swift.ExpressibleByArrayLiteral { }
extension JSON: Swift.ExpressibleByNilLiteral { }

// RawRepresentableプロトコルに準拠し、raw valueとの変換を可能にする
extension JSON: Swift.RawRepresentable { }

// JSON構造体を文字列で表現可能にする
extension JSON: Swift.CustomStringConvertible, Swift.CustomDebugStringConvertible { }

// Arrayに関するプロパティ（array、arrayValue、arrayObject）
extension JSON { }

// Dictionaryに関するプロパティ（dictionary、dictionaryValue、dictionaryObject）
extension JSON { }

// Boolに関するプロパティ（bool、boolValue）
extension JSON { }

// Stringに関するプロパティ（string、stringValue）
extension JSON { }

// Numberに関するプロパティ（number、numberValue）
extension JSON { }

// Nullに関するプロパティ（null）、メソッド（exists() -> Bool）
extension JSON { }

// URLに関するプロパティ（url）
extension JSON { }

// 数値型に関するプロパティ
// Int, Double, Float, Int8, Int16, Int32, Int64
extension JSON { }

// Comparableに準拠し、JSON型を比較できるようにする
extension JSON : Swift.Comparable { }

// raw value変換時のメタ情報キー
public enum writingOptionsKeys { }
```

これだけみても...という感じですね。
あまり見聞きしないプロトコルも使われているようなので、ざっと調べてみます。

# 利用プロトコル一覧

SwiftyJSONで利用されているプロトコルをまとめると以下のようになります。

|プロトコル|説明|
|:---|:---|
|[Swift.Error](https://developer.apple.com/documentation/swift/error)|throwされる可能性のあるエラー値であることを表す型|
|[CustomNSError](https://developer.apple.com/documentation/foundation/customnserror)|[Error](https://developer.apple.com/documentation/swift/error)に準拠し、さらにerrorDomain、errorCode、errorUserInfoプロパティを持つ|
|[Swift.Collection](https://developer.apple.com/documentation/swift/collection)|複数の要素を集められ、索引（Index）でアクセスでき、さらに[Sequence](https://developer.apple.com/documentation/swift/sequence)に準拠し、連続する要素を次々に取り出せる型|
|[Swift.ExpressibleByStringLiteral](https://developer.apple.com/documentation/swift/expressiblebystringliteral)|文字リテラルで初期化できる型|
|[Swift.ExpressibleByIntegerLiteral](https://developer.apple.com/documentation/swift/expressiblebyintegerliteral)|整数リテラルで初期化できる型|
|[Swift.ExpressibleByBooleanLiteral](https://developer.apple.com/documentation/swift/expressiblebybooleanliteral)|ブールリテラルで初期化できる型|
|[Swift.ExpressibleByFloatLiteral](https://developer.apple.com/documentation/swift/expressiblebyfloatliteral)|浮動小数点リテラルで初期化できる型|
|[Swift.ExpressibleByDictionaryLiteral](https://developer.apple.com/documentation/swift/expressiblebydictionaryliteral)|辞書リテラルで初期化できる型|
|[Swift.ExpressibleByArrayLiteral](https://developer.apple.com/documentation/swift/expressiblebyarrayliteral)|配列リテラルで初期化できる型|
|[Swift.ExpressibleByNilLiteral](https://developer.apple.com/documentation/swift/expressiblebynilliteral)|nilリテラルで初期化できる型|
|[Swift.RawRepresentable](https://developer.apple.com/documentation/swift/rawrepresentable)|raw valueとの相互変換が可能な型|
|[Swift.CustomStringConvertible](https://developer.apple.com/documentation/swift/customstringconvertible)|カスタマイズした文字列に変換できる型|
|[Swift.CustomDebugStringConvertible](https://developer.apple.com/documentation/swift/customdebugstringconvertible)|デバッグ用にカスタマイズした文字列に変換できる型|
|[Swift.Comparable](https://developer.apple.com/documentation/swift/comparable)|比較演算子（<, <=, >=, >）で比較可能な型|

ざっくりまとめると、SwiftyJSONで定義している`JSON`構造体にプロトコルで以下の性質を持たせていることが分かります。

 - JSONを扱う時のエラーを区別できる（Error, CustomNSError）
 - JSONをArrayやDictionaryなどのコレクションのように添字アクセスできる（Collection）
 - 各リテラル表現からJSONを初期化できる（ExpressibleBy〜Literal）
 - JSONをraw valueとの相互変換ができる（RawRepresentable）
 - JSONのprint時に整形して出力できる（CustomStringConvertible, CustomDebugStringConvertible）
 - JSONを比較できる（Comparable）


