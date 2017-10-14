# SwiftでJSON文字列の比較がしたい
SwiftでJSON文字列の比較がしたくなって、試行錯誤したのでそのメモです。

# JSON文字列比較をユニットテストに利用したい

例えばこんなケース。

**API通信処理のHttpリクエストボディのJSONが正しく生成できているかチェックしたい**

例)この2つのJSONが一致するかユニットテストを書きたい

 - プログラムで生成したJSON `{"id": "001", ""query": "hoge", "keyword": "cat"}`
 - 期待するリクエストJSON `{"id": "001","query": "hoge", "keyword": "dog"}`

※上記のJSONの場合、keywordキーの部分が異なっていることをテストで検出したい

# JSON文字列を比較する際に考慮が必要なこと
SwiftのString型はEquatableプロトコルに準拠しているため、==演算子で比較できますが、JSONの文字列を単純に1文字ずつ比較しても今回の要件は満たせません。

JSON文字列の形式が一致しているか厳密に比較したいのでなく、以下のように形式は違えど、JSONデータの中身が同じであれば等しいものと考えたいからです。

 - Minified形式（改行やホワイトスペースを削除し、ファイルサイズを圧縮した形式）
 - キーの記載順序が異なる
 - インデント数やスペースの挿入箇所が異なる（表示形式のゆらぎ）

# SwiftyJSONで比較できないか
JSONのパース処理にはSwiftyJSONというJSONを扱いやすくするライブラリをよく利用しています。

SwiftyJSON
https://github.com/SwiftyJSON/SwiftyJSON

ドキュメントを読んだり、compareやEquatable等でリポジトリを検索しても欲しいものはないようでした。また、JSON構造体を==で比較することはできますが、上記の要件は満たせませんでした。

# JSON文字列を比較するメソッドを実装して見る
JSON文字列を比較するメソッドを実装してみます。
（命名や、DictionaryのExtension実装などはあまり深く検討していません）
JSON文字列をDictionaryに変換するため、SwiftyJSONを利用しています。

```swift:JSON文字列を比較するメソッド
func isEqualJson(_ jsonString1: String, _ jsonString2: String) -> Bool {
    // Jsonの形式差異（Minifiedかどうか、キー順序）をなくすため、Dictionaryに変換する
    guard let dict1 = JSON(parseJSON: jsonString1).dictionaryObject,
        let dict2 = JSON(parseJSON: jsonString2).dictionaryObject else {
            return false
    }
    
    // isEqual(to:)メソッドを利用するため、NSDictionaryに変換する
    return NSDictionary(dictionary: dict1).isEqual(to: dict2)
}
```

ポイントとしてはまず、Jsonの形式差異（Minifiedかどうか、キー順序）をなくすために、Dictionaryに変換している点です。


また、Dictionaryは比較できないため、`NSDictionary(dictionary:)`イニシャライザでNSDictionaryに変換し、NSDictionaryの`isEqual(to:)`メソッドで比較しています。

```swift:Dictionaryを比較しようとした場合
let dict1: [AnyHashable: Any] = ["String": "hoge", "Int": 1, "Bool": true]
let dict2: [AnyHashable: Any] = ["String": "hoge", "Int": 1, "Bool": false]

// ==演算子が利用できないためコンパイルエラー
// error: binary operator '==' cannot be applied to two '[AnyHashable : Any]' operands
print(dict1 == dict2)
```

NSDictionaryの`isEqual(to:)`メソッドは、辞書内にNSObjectを継承したクラスや独自のクラスオブジェクトが含まれていた場合、同じインスタンスでなければfalseを返します。

```swift:NSObjectを継承したクラスや独自のクラスオブジェクトの比較はできない
class SomeObject {
    let hoge: Int
    init(hoge: Int) {
        self.hoge = hoge
    }
}

let object1 = SomeObject(hoge: 1)
let object2 = SomeObject(hoge: 1)
let dict1: [AnyHashable: Any?] = ["Object": object1]
let dict2: [AnyHashable: Any?] = ["Object": object2]

// false（クラスの値は同じだが、別インスタンスなのでfalseとなる）
print(NSDictionary(dictionary: dict1).isEqual(to: dict2))
```

しかしJSONに含まれる**文字列型、数値型、Bool型、null**は
同じインスタンスでなくても比較が可能なため、今回の要件を満たします。
（ネストした辞書型、配列型となっていても同様に比較可能）
※JSON定義→http://www.json.org/

```swift
let dict1: [AnyHashable: Any?] = ["String": "hoge", "Number": 1, "Bool": true, "Null": nil]
let dict2: [AnyHashable: Any?] = ["String": "hoge", "Number": 1, "Bool": true, "Null": nil]

// true
print(NSDictionary(dictionary: dict1).isEqual(to: dict2))
```

NSプレフィックスのついた型はObjective-C時代の遺産なのであまり使いたくないのが正直なところですが、簡潔に実装するのであれば、上記の方法で問題なさそうです。その他何かもっと良い方法があれば、コメントなどで教えていただけるとうれしいです。




