# Swiftでネストした構造体の初期化エラー
# 概要
下記のようにネストした構造体の配列を初期化しようとした時に何故かコンパイルエラーが出たのでメモ。
（Apple Swift version 3.0.2 (swiftlang-800.0.63 clang-800.0.42.1)）

# ネストした構造体配列の初期化エラー
構造体StructAの中に構造体StructBを定義し、入れ子にする。

```swift:ネストした構造体
struct StructA {
    let a: Int

    struct StructB {
        let b: Int
    }

}
```

上記のStructBの配列を初期化しようとしたときに、
以下の記述だと何故かシンタックスシュガーが機能せず、コンパイルエラーが出る。

``` swift:StructBの配列を初期化
// NGパターン
let list1 = [StructA.StructB]()
// error: cannot call value of non-function type '[StructA.StructB.Type]'
```

# 回避方法

以下記述方法であればコンパイルエラーはでない。

```swift:回避方法
// OKパターン
let list2 = Array<StructA.StructB>()

let list3: [StructA.StructB] = []

typealias StructBinA = StructA.StructB
let list4 = [StructBinA]()
```

# 参考
stackoverflowを見るとどうやらswiftのバグらしい。
 - [stackoverflow / Array of Nested Type: Why Does the Compiler Complain?](http://stackoverflow.com/questions/36773355/array-of-nested-type-why-does-the-compiler-complain)
 - [stackoverflow / Why can't I instantiate an empty array of a nested class?](http://stackoverflow.com/questions/25682113/why-cant-i-instantiate-an-empty-array-of-a-nested-class)

