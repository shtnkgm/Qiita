# Swiftと3種類のポリモーフィズム
# 概要
Swiftの**「ポリモーフィズム」**についてまとめます。
以下のキーワードがモヤっとしている方におすすめです。

 - Ad hoc polymorphism｜アドホック多相
 - Parametric polymorphism｜パラメータ多相
 - Subtyping｜部分型付け

# ポリモーフィズムとは

ポリモーフィズム（polymorphism / 多相）とは、**「複数の異なる型に対して、共通のインタフェースを提供すること」**です。簡単に言うと、同じ関数でも引数として渡す型によって異なる動作をさせることです。イメージとしては、動物は「鳴く」という共通のインタフェースを持っていますが、その動物によって鳴き声は異なる（型によって振る舞いが異なる）ようなものです。

<img src="https://qiita-image-store.s3.amazonaws.com/0/113553/3595c42f-7339-3a13-5e81-e3de9e8a20d9.png" width="50%">


# ポリモーフィズムには３種類ある

ポリモーフィズムには以下の３種類があります。上から順に説明します。

 - Ad hoc polymorphism（アドホック多相）
 - Parametric polymorphism（パラメータ多相）
 - Subtyping（部分型付け）

## Ad hoc polymorphism（アドホック多相）

Ad hoc polymorphismは**「関数が引数の型によって異なる実装を持つ場合のポリモーフィズム」**です。
Ad hoc polymorphismを実現するSwiftの言語機能には**「関数のオーバーロード」**があります。

### Ad hoc polymorphismの実装例

以下のような、PersonとBookの構造体を考えます。

```swift
struct Person {
    let firstName: String
    let lastName: String
}

struct Book {
    let title: String
}
```

Person、Bookそれぞれの型に対する同一インタフェースの関数を多重に定義（オーバーロード）します。

```swift
func getName(of person: Person) -> String {
    return person.firstName + " " + person.lastName
}

func getName(of book: Book) -> String {
    return book.title
}
```

以下のように「複数の異なる型に対して、共通のインタフェースを提供する」メソッドができていることがわかります。

```swift
let person = Person(firstName: "Jhon", lastName: "Doe")
let book = Book(title: "Swift4 Programming")

print(getName(of: person))
print(getName(of: book))
```

## Parametric polymorphism（パラメータ多相）

Parametric polymorphismは**「特定の型を指定しない場合のポリモーフィズム」**です。
Parametric polymorphismを実現するSwiftの言語機能には**「ジェネリクス（型パラメータ）」**があります。

### Parametric polymorphismの実装例（ジェネリック関数）

以下のような、PersonとBookの構造体を考えます。

```swift
struct Person {
    let firstName: String
    let lastName: String
}

struct Book {
    let title: String
}
```

ジェネリクスの型パラメータにより、総称型として引数を受け取ることで、Person、Bookどちらでも受け取れるようにします。

```swift
func getName<T>(of t: T) -> String {
    if let person = t as? Person {
        return person.firstName + " " + person.lastName
    } else if let book = t as? Book {
        return book.title
    } else {
        return ""
    }
}

```

以下のように「複数の異なる型に対して、共通のインタフェースを提供する」メソッドができていることがわかります。

```swift
let person = Person(firstName: "Jhon", lastName: "Doe")
let book = Book(title: "Swift4 Programming")

print(getName(of: person))
print(getName(of: book))
```

## Subtyping（部分型付け）

Subtypingは**「共通のインタフェースを持つ複数の型の異なる実装を実行する場合のポリモーフィズム」**です。
Subtypingを実現するSwiftの言語機能には**「スーパークラス（継承）」**と**「プロトコル」**があります。

### Subtyping（スーパークラス）の実装例

nameというプロパティを持つ抽象インタフェースとしてNamedTypeを**クラス**で定義します。

```swift
class NamedType {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
```

PersonとBookはNamedTypeを継承する具象クラスとして定義します。

```swift
class Person: NamedType {
    let firstName: String
    let lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        super.init(name: firstName + " " + lastName)
    }
}

class Book: NamedType {
    let title: String
    
    init(title: String) {
        self.title = title
        super.init(name: title)
    }
}
```

関数の引数の型に抽象型であるNamedTypeを指定することで、NamedType自身やその継承クラスを引数として受け取れるようになります。

```swift
func getName(of namedType: NamedType) -> String {
    return namedType.name
}
```

以下のようにスーパークラスによって「複数の異なる型に対して、共通のインタフェースを提供する」メソッドができていることがわかります。

```swift
let person = Person(firstName: "Jhon", lastName: "Doe")
let book = Book(title: "Swift4 Programming")

print(getName(of: person))
print(getName(of: book))
```

### Subtyping（プロトコル）の実装例

nameというプロパティを持つ抽象インタフェースとしてNamedTypeを**プロトコル**で定義します。

```swift
protocol NamedType {
    var name: String { get }
}
```

PersonとBookはNamedTypeに準拠する構造体（具象型）として定義します。


```swift
struct Person: NamedType {
    let firstName: String
    let lastName: String
    
    var name: String {
        return firstName + " " + lastName
    }
}

struct Book: NamedType {
    let title: String
    
    var name: String {
        return title
    }
}
```

関数の引数の型に抽象型であるNamedTypeを指定することで、NamedTypeに準拠する型を引数として受け取れるようになります。

```swift
func getName(of namedType: NamedType) -> String {
    return namedType.name
}
```

以下のようにプロトコルによって「複数の異なる型に対して、共通のインタフェースを提供する」メソッドができていることがわかります。

```swift
let person = Person(firstName: "Jhon", lastName: "Doe")
let book = Book(title: "Swift4 Programming")

print(getName(of: person))
print(getName(of: book))
```

# まとめ
以上をまとめると、以下のようになります。

|種類|和名|概要|実現機能|
|:---|:---|:---|:---|
|Ad hoc polymorphism|アドホック多相|hoge|関数のオーバーロード（多重定義）|
|Parametric polymorphism|パラメータ多相|hoge|ジェネリクス|
|Subtyping|部分型付け|hoge|プロトコル、スーパークラス|

# 参考

 - [Polymorphism (computer science) / Wikipedia](https://en.wikipedia.org/wiki/Polymorphism_(computer_science))
 - [Ad hoc polymorphism / Wikipedia](https://en.wikipedia.org/wiki/Ad_hoc_polymorphism)
 - [Parametric polymorphism / Wikipedia](https://en.wikipedia.org/wiki/Parametric_polymorphism)
 - [Subtyping / Wikipedia](https://en.wikipedia.org/wiki/Subtyping)
 - [ポリモーフィズム / Wikipedia](https://ja.wikipedia.org/wiki/%E3%83%9D%E3%83%AA%E3%83%A2%E3%83%BC%E3%83%95%E3%82%A3%E3%82%BA%E3%83%A0)
 - [ポリモーフィズムをもっと理解する / 騒音のない世界 BLOG](http://noiselessworld.hatenablog.jp/entry/2017/01/30/002252)
 - [Swiftとオブジェクト間の通知のパターン / Speaker Deck](https://speakerdeck.com/shtnkgm/swifttoohusiekutojian-falsetong-zhi-falsehatan)

