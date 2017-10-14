# indexがArrayの範囲内かチェックする色々な書き方
# はじめに

Swiftで配列の要素を取得する際に、指定したインデックスがArrayの範囲外を指す場合、
以下のように、**実行時エラー**となります。

```swift
let array = [1, 2]
array[0] // 1
array[1] // 2
array[2] // fatal error: Index out of range
```
意図しない実行時エラーを防ぐためには、なるべく配列の要素にアクセスする際にはインデックスのチェックが必要となります。インデックスのチェックする方法をいろんなパターンで書いてみました。

# パターン

```swift
// 1. array.count（要素数）を利用する
guard index >= 0 && index < array.count else { return }

// 2. array.indices（インデックスの配列）とcontains（配列に含まれるか）を利用する
guard array.indices.contains(index) else { return }

// 3. 半区間演算子..<とarray.count（要素数）とcontains（配列に含まれるか）を利用する
guard (0..<array.count).contains(index) else { return }

// 4. array.indices（インデックスの配列）と~=（パターンマッチ）を利用する
guard array.indices ~= index else { return }

// 5. 半区間演算子..<とarray.count（要素数）と~=（パターンマッチ）を利用する
guard 0..<array.count ~= index else { return }
```
ベーシックな書き方としてはパターン1の`index >= 0 && index < array.count`をよく見るように思います。個人的には、パターン2の`array.indices.contains(index)`でチェックするのが可読性が高くて良いかと思います。

また、その他の方法として、新しいsubscript構文をArrayのエクステンションに追加するという方法もよく見かけられます。

 - インデックスが配列の範囲内の場合は配列の要素を返す
 - インデックスが配列の範囲外の場合はnilを返す

```swift
// エクステンション
extension Array {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

// 利用方法
let array = [1, 2]
array[safe: 0] // Optional(1)
array[safe: 1] // Optional(2)
array[safe: 2] // nil
```
このパターンの場合は、subscriptの実装でインデックスのチェックが担保されるため、安全に要素が取得できます。戻り値はオプショナル値となるため、適宜アンラップが必要となります。


