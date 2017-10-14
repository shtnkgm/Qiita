# 参照型のプロパティを持つstructについて考える
# はじめに
新たに型を設計する場合、classにするべきか、structにするべきか迷うことがあるかと思います。
この記事では、**参照型のプロパティを持つ型を設計する場合、型はstructでなくclassを利用することを検討したほうが良い**という設計指針をたまに見かけるので、その理由を考えてみます。

# structかclassか
Swift標準のライブラリではstructで宣言されている型が多く、**structで実現できない場合にclassを採用することが推奨される**ように思われます。

## こんなときはclass？
 - インスタンスの参照を共有したい
 - デイニシャライザを利用し、インスタンスの破棄タイミングに合わせて何か処理を行いたい
 - protocolでなく、継承で実装したい

## 参照型のプロパティを持つstructを実装した場合どうなるのか
参照型のプロパティを持つ、以下のようなstructを考えてみます。
structの` SomeStruct`は参照型のプロパティである、`numberClass`を持ちます。

```swift
// 参照型プロパティに持つ構造体
struct SomeStruct {
    var numberStruct = NumberStruct() // 値型プロパティ
    var numberClass = NumberClass()   // 参照型プロパティ
}

// 構造体
struct NumberStruct {
    var number: Int = 0
}

// クラス
class NumberClass {
    var number: Int = 0
}
```

以下のように、`SomeStruct`型の変数をコピーした場合、

```swift
// 構造体を初期化して、別の変数に代入する
let someStruct1 = SomeStruct()
var someStruct2 = someStruct1

// コピー先の値を変更する
someStruct2.numberStruct.number = 1
someStruct2.numberClass.number = 1

// コピー元の値を確認する
print(someStruct1.numberStruct.number) // 0（値のコピーのみ）
print(someStruct1.numberClass.number)  // 1（参照が共有されている）
```
コピー先でプロパティを変更しても、値型のプロパティ`numberStruct`は値が変化しませんが、
参照型の`numberClass`は値が0から1に変化してしまっています。
（参照型の特性として、参照を共有する形で代入が行われたため、当然といえば当然）

**値型として定義した型でも、プロパティが参照型の場合、その特性は保たれる**ということになります。

今回のケースではシンプルな設計でしたが、型が多重のネストされた構造になっている場合は、プログラマーがどのプロパティがコピーされて、どのプロパティが参照共有になるかは判断がつきづらくなります。

そのため、値型で定義する型は、すべてのプロパティを値型にするというシンプルな設計の方が**分かりやすく、予期せぬ参照共有によるバグも生まれにくい**ということかと思われます。

## 補足

Swiftの公式ドキュメントにも以下の記載がありました。
[The Swift Programming Language (Swift 4) - Classes and Structures](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html)
> Any properties stored by the structure are themselves value types, which would also be expected to be copied rather than referenced.

構造体は値型なので、そのプロパティも値型としてコピーされることが期待されます。（意訳）

# 参考
 - [The Swift Programming Language (Swift 4) - Classes and Structures](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html)
 - [recruit-lifestyle/swift-style-guide](https://github.com/recruit-lifestyle/swift-style-guide)
 - [Swiftにおけるclassとstructの使い分け](http://cockscomb.hatenablog.com/entry/choosing-between-classes-and-structures)

