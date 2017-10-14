# クラス定義にfinalをつける理由
# 概要
**class定義の前に"final"ってついているけど、どうしてこういう風に書いてるの？**って聞かれたので、自分でも少し曖昧だった部分を調べてまとめました。

# finalってなに
 - クラスにfinal修飾子をつけると、**継承されるのを禁止**できます
 - メソッド、プロパティ、サブスクリプトにfinal修飾子をつけると、**サブクラスでオーバーライド（上書き）されるのを禁止**できます

finalの意味の通り、クラスであれば、**このクラス以降、継承されることがない最後のクラス**というのを示します。

```swift:final修飾子の例
class Animal { }
final class Dog: Animal { }
class Chihuahua: Dog { } // Dogのサブクラスは作成できない
```

# finalをオーバーライドしようとするとどうなるか
サブクラスでfinalのついたメソッド、プロパティ、サブスクリプトをオーバライドしようとすると、**コンパイルエラー**になります。

```swift
// プロパティ、メソッド、サブスクリプトにfinalがついているクラス
class SomeClass {
    final var someProperty: Int = 0
    
    final func someMethod() {
        
    }
    
    final subscript(index: Int) -> Int {
        return index * 2
    }
}

// SomeClassを継承したサブクラス
class SomeSubClass: SomeClass {
    // プロパティがオーバーライドできないのでコンパイルエラー 
    // error: var overrides a 'final' var
    override var someProperty: Int {
        get {
            return super.someProperty + 1
        }
        set {
            super.someProperty = newValue
        }
    }
    
    // メソッドがオーバーライドできないのでコンパイルエラー
    // error: instance method overrides a 'final' instance method
    override func someMethod() {
        
    }
    
    // サブスクリプトがオーバーライドできないのでコンパ入りエラー
    // error: subscript overrides a 'final' subscript
    override subscript(index: Int) -> Int {
        return super[index] + 1
    }
}
```

また同様に、finalのついたクラスを継承したサブクラスを作ろうとすると、継承自体ができなくなり、**コンパイルエラー**となります。

```swift:finalがついたclassを継承しようとした場合
final class SomeClass {
    
}

// SomeClassを継承したサブクラス
class SomeSubClass: SomeClass {
    // コンパイルエラー error: inheritance from a final class
}
```

# どういうときにfinalをつけるか
**継承の必要性がないとき**にはfinalをつけるのが良いと思います。
逆にサブクラスを作成する必要がでてきたらfinalを外します。

# finalをつけるメリット
 - 動的ディスパッチ（後述）の可能性を減らし、プログラムの実行時のパフォーマンスが改善できる
 - サブクラスを経由してセキュリティ対策等必ず実行したい処理を回避されることを防ぐ
 - サブクラスを作成することにより、設計が崩れることを防ぐ
 - 継承・オーバーライドされることがないものとしてプログラムの理解に役立つ

## 動的ディスパッチとは
動的ディスパッチ（Dynamic Dispatch）は**動的結合**や**遅延結合**とも呼ばれ、プログラムの実行時に利用するプロパティやインスタンスを決定することを意味します。

動的ディスパッチが行われるサンプルコードがこちらです。

```swift:動的ディスパッチの例
// キャラクターはattack（攻撃）メソッドを持つ
protocol Character {
    func attack()
}

// ゴクウ
class Goku: Character {
    func attack() {
        print("かめはめは!")
    }
}

// ゴハン（ゴクウの子クラス）
class Gohan: Goku {
    override func attack() {
        print("ませんこう!")
    }
}

//isGokuはランダムでtrueもしくはfalseになる
let isGoku: Bool = arc4random_uniform(2) == 0

let character = isGoku ? Goku() : Gohan()
character.attack()
```

このプログラムでは、`isGoku`の値がtrueかどうかによって、キャラクターが決定し、その攻撃メソッド（attack）が変わります。

また、`isGoku`の値は実行時にランダムで決定するため、`character.attack()`で`Goku`クラスの`attack()`が実行されるのか`Gohan`クラスの`attack()`が実行されるのかはコンパイラは判断できません。
実行時にオブジェクトによって振る舞いが決定する、**ポリモーフィズム（Polymorphism: 多態性）**の例にもなっています。 

動的ディスパッチはパフォーマンスを犠牲にするため、実行速度が求められるようなプログラムでは適しません。**`final`でサブクラスがないことを明示し、`private`などでアクセスレベルを限定する**ことで、コンパイル時に参照するメソッドやプロパティを限定し、動的ディスパッチの可能性を減らすことでよりパフォーマンスの良いプログラムを作成できます。

# 参考
 - [The Swift Programming Language (Swift 4) - Inheritance](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Inheritance.html)
 - [[Swift]動的ディスパッチを減らすことでパフォーマンスを改善](http://blog.andgenie.jp/articles/843)
 - [オブジェクト指向わかった気になっている?[ポリモーフィズム] java](http://qiita.com/lrf141/items/a2f764c8d87de26b6f45)
 - [Swiftを書く時に気をつける小さな違い](http://qiita.com/kitasuke/items/3cc194542ee45a92bef2)
 - [iOS コーディングガイドライン](http://qiita.com/tokuda109/items/3e331c77f13cbefa8d18)
 - [recruit-lifestyle/swift-style-guide](https://github.com/recruit-lifestyle/swift-style-guide)
 - [SmartTechVentures/swift-style-guide](https://github.com/SmartTechVentures/swift-style-guide)
 - [Increasing Performance by Reducing Dynamic Dispatch](https://developer.apple.com/swift/blog/?id=27)

