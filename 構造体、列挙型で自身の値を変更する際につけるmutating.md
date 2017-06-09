# 構造体、列挙型で自身の値を変更する際につけるmutating
struct, enumで自身の値を変更する場合、funcの前にmutatingキーワードを書く。
再代入が行われるため、mutatingなメソッドは定数に対しては実行できない。

```swift
extension Int {
    // mutatingがない場合、コンパイルエラー
    // left side of mutating operator isn't mutable: 'self' is immutable
    mutating func plusOne() {
        self += 1
    }
}

var a = 1
a.plusOne() //2

let b = 1
// letで宣言したためコンパイルエラー
// cannot use mutating member on immutable value: 'b' is a 'let' constant
b.plusOne()
```

structの場合、ストアドプロパティを変更する場合にもmutatingキーワードが必要。
（structのストアドプロパティの変更=構造体の値の変更のため）

```swift
struct MyStruct {
    var member: Int
    
    init(member: Int){
        self.member = member
    }
    
    mutating func plusOne() {
        self.member += 1
    }
}

let myStruct = MyStruct(member: 1)
// letで宣言したためコンパイルエラー
// cannot use mutating member on immutable value: 'myStruct' is a 'let' constant
myStruct.plusOne()
```

