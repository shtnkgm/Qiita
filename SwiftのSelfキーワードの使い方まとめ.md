# SwiftのSelfキーワードの使い方まとめ
Swiftにおける`Self`キーワードについて、整理する意味も含めてメモします。
※小文字開始の`self`ではなく大文字開始の`Self`についてです。

# 概要
 - `Self`はクラスやプロトコルの定義内で、**その型自身**を表します。
 - プロトコル定義内では特に、その**プロトコルを準拠する型**を表します。

# どんな用途で使うの？
 - (1) protocol extensionを準拠する型で限定する
 - (2) protocol extensionを準拠する型のAssociatedTypeで限定する
 - (3) プロトコル定義内のメソッドの引数、戻り値、変数の定義
 - (4) クラス定義内のメソッドの戻り値の定義

## (1) protocol extensionを準拠する型で限定する
 - プロトコルを準拠する型をSelfで参照できる
 - Selfで参照した型が条件をみたす場合にのみextensionを有効にすることができる
 - 条件は準拠している他のプロトコルや継承しているクラスを指定可能

```swift
// プロトコルを準拠する型がSomeClassを継承しているクラスの場合のみ有効
extension SomeProtocol where Self: SomeClass { }

// プロトコルを準拠する型がOtherProtocolに準拠している型の場合のみ有効
extension SomeProtocol where Self: OtherProtocol { }
```

## (2) protocol extensionを準拠する型のAssociatedTypeで限定する
 - protocolを準拠する方のAssociatedTypeをSelf.{AssociatedType名}で参照できる
 - AssociatedTypeが条件をみたす場合にのみextensionを有効にすることができる
 - 条件は準拠している他のプロトコルや継承しているクラス、一致する型を指定可能

```swift
// SomeAssociatedTypeがSomeClassを継承しているクラスの場合のみ有効
extension SomeProtocol where Self.SomeAssociatedType: SomeClass { }

// SomeAssociatedTypeがOtherProtocolに準拠している型の場合のみ有効
extension SomeProtocol where Self.SomeAssociatedType: OtherProtocol { }

// SomeAssociatedTypeがSomeClassに一致する場合のみ有効
extension SomeProtocol where Self.SomeAssociatedType == SomeClass { }
```

## (3) プロトコル定義内のメソッドの引数や戻り値の定義
 - プロトコルを準拠する型をSelfとして引数や戻り値、変数の型に指定できる
 - EquatableプロトコルやBitwiseOperationsプロトコル等で利用されている

```swift
protocol SomeProtocol {
    // 引数の型をプロトコルを準拠する型にする
    func someMethod1(some: Self) -> Void

    // 戻り値の型をプロトコルを準拠する型にする
    func someMethod2() -> Self

    // 変数の型をプロトコルを準拠する型にする
    var someVariable: Self { get }
}

/// Equatableプロトコルの例
public protocol Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool
}

/// BitwiseOperationsプロトコルの例
public protocol BitwiseOperations {
    public static func &(lhs: Self, rhs: Self) -> Self
    public static func |(lhs: Self, rhs: Self) -> Self
    public static func ^(lhs: Self, rhs: Self) -> Self
    prefix public static func ~(x: Self) -> Self
    public static var allZeros: Self { get }
}
```

## (4) クラス定義内でのメソッドの戻り値の定義

 - Selfはクラス定義内の場合、プロトコルと違い、戻り値の型としてのみ指定できる
 - サブクラスでもサブクラスの型を参照するため、再定義の必要がない
 - クラス名に依存しない書き方が出来るので、メソッドの再利用がし易い

```swift
class SomeClass {
    // 戻り値の型をSomeClassと書かず、Selfで指定
    // ファクトリメソッドなど、インスタンスを生成して返すメソッドなどで便利
    class func create() -> Self {
        return self()
    }
}
```
  

