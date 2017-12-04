# CharacterSetを使って、文字列の操作をする
# はじめに
Swiftの`CharacterSet`を使うと、**特定の種類の文字列の抽出や削除が可能**です。
例) 数字のみ取り除く、記号を抽出する、改行を取り除く、など

CharacterSetを用いて、どのように文字列操作が可能か、試したのでメモします。

Apple公式ドキュメント | CharacterSet
https://developer.apple.com/documentation/foundation/characterset

# StringのExtensionを作成
以下のように、StringのExtensionとして、`remove(characterSet:)`と`extract(characterSet:)`を定義し、CharacterSetを元に文字列を簡単に操作できるようにしました。

 - remove(characterSet:)・・・StringからCharacterSetを取り除く
 - extract(characterSet:)・・・StringからCharacterSetを抽出する

```swift
extension String {
    /// StringからCharacterSetを取り除く
    func remove(characterSet: CharacterSet) -> String {
        return components(separatedBy: characterSet).joined()
    }
    
    /// StringからCharacterSetを抽出する
    func extract(characterSet: CharacterSet) -> String {
        return remove(characterSet: characterSet.inverted)
    }
}
```

# サンプル
各CharacterSetを用いて、文字列を抽出したサンプルが以下となります。
各CharacterSetでどのような文字が抽出できるのかお分かりいただけると思います。

```swift
var string = "あいうえお"
string += "がぎぐげごぱぴぷぺぽ"
string += "山川海"
string += "👪🌽🌿👨‍👩‍👦‍👦👨‍🌾👩‍🎨"
string += "♞✈㎝㎞㏄☜☝☞"
string += "!\"#$%&'()=~|`{+*}<>?_-^¥@[;:],."
string += "abcdefg"
string += "ABCDEFG"
string += "1234567890"
string += " 　   "
string += "\n\t\r"

// 数字（全角数字含む）
print(string.extract(characterSet: .decimalDigits))
// 出力: 1234567890

// 結合文字（濁音など、複数の文字を結合してできた文字）
print(string.extract(characterSet: .decomposables))
// 出力: がぎぐげごぱぴぷぺぽ

// 通常文字（アルファベット、かな、漢字など）
print(string.extract(characterSet: .letters))
// 出力: あいうえおがぎぐげごぱぴぷぺぽ山川海abcdefgABCDEFG

// 通常文字（アルファベット、かな、漢字など）と数字、結合文字
print(string.extract(characterSet: .alphanumerics))
// 出力: あいうえおがぎぐげごぱぴぷぺぽ山川海abcdefgABCDEFG1234567890

// 記号
print(string.extract(characterSet: .punctuationCharacters))
// 出力: !"#%&'(){*}?_-@[;:],.\n

// シンボル（などUnicode私用領域の文字は除く）
print(string.extract(characterSet: .symbols))
// 出力: 👪🌽🌿👨👩👦👦👨🌾👩🎨♞✈㎝㎞㏄☜☝☞$=~|`+<>^¥

// 大文字
print(string.extract(characterSet: .uppercaseLetters))
// 出力: ABCDEFG

// 小文字
print(string.extract(characterSet: .lowercaseLetters))
// 出力: abcdefg

// ホワイトスペース
print(string.extract(characterSet: .whitespaces))
// 出力:  　       （見えませんがホワイトスペースが出力されています）

// ホワイトスペースと改行
print(string.extract(characterSet: .whitespacesAndNewlines))
// 出力: 　   \n    \r （見えませんがホワイトスペースが出力されています）

// 改行
print(string.extract(characterSet: .newlines))
// 出力: \n\r

// 制御文字
print(string.extract(characterSet: .controlCharacters))
// 出力: ‍‍‍‍‍\n    \r

// 何も出力されなかったもの
print(string.extract(characterSet: .capitalizedLetters))
print(string.extract(characterSet: .illegalCharacters))
print(string.extract(characterSet: .nonBaseCharacters))
```

だいたい利用方法がわかりましたが、以下の点だけまだもやっと感があります。
詳しい方がいらっしゃったらコメント等で教えて頂けるとうれしいです！

 - `punctuationCharacters`と`symbols`の違い
 - `capitalizedLetters`、`illegalCharacters`、`nonBaseCharacters`にカテゴライズされる文字

# 応用例
応用例としては以下のように、記号を含む文字列から数字のみを取り出すことができます。

```swift
// 電話番号から数字だけを抽出
let phoneNumber = "+81-3-0000-1111"
print(phoneNumber.extract(characterSet: .decimalDigits))

// 郵便番号から数字だけを抽出
let postalCode = "〒123-4567"
print(postalCode.extract(characterSet: .decimalDigits))
```

# 参考記事

 - [swift3 CharacterSet.urlxxxx addingPercentEncoding](https://qiita.com/nagisawks/items/25433a5f1d45756dbfde)
 - [Swift3で文字列を分割(split)する方法](https://qiita.com/tomonoriTAKA/items/0527160bd3142b2bc4ea)
 - [Swift4で言語処理100本ノック 2015 第1章,第2章](https://qiita.com/tikidunpon/items/4fcefec2d1171e08d188)
 - [NSStringの前後の空白をトリミングする際、全角スペースはそのままにしとく](https://qiita.com/superdog/items/77e62e2239db475067a2)

