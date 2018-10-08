# Swiftのstatic、classキーワードの違いについて
# 概要
Swiftのスタティック、クラスプロパティの違いについてまとめました。
※スタティック、クラスメソッドについても違いは基本的に同じです。

# Swiftのスタティック、クラスプロパティの違い
## 名称
 - スタティックプロパティ（別名：静的プロパティ）
 - クラスプロパティ

上記両方をタイププロパティ（型プロパティ）と呼ぶ場合や、
スタティックプロパティのみを指してタイププロパティと呼ぶ場合あり

## 用途
 - 後述の特徴の違いはあるが、**全インスタンスから共通で利用されるという点では同様**
 - インスタンスに依存しないユーティリティ的な用途やシングルトンパターンで利用

```swift:シングルトンパターンの例
class Singleton {
    class var sharedInstance : Singleton {
        struct Static {
            static let instance : Singleton = Singleton()
        }
        return Static.instance
    }
}
```

## 定義方法
 - static、classキーワードを宣言の前に付与する
 - インスタンスのように初期化されないため、宣言時に初期値が必要
 - クラスプロパティは構造体（struct）、列挙型では定義不可、クラスでのみ定義可

```swift
// スタティックプロパティ
static let id: Int = 2017
static var name: String = "Qiita"

// クラスプロパティ
class let id: Int = 2017
class var name: String = "Qiita"
```

## 利用方法
 - 型名.プロパティ名で同じようにアクセスできる
 - スタティック、クラスメソッドの内部では型名.は省略可（もしくはself.プロパティ名）

```swift
// スタティック、クラスプロパティで同様
func instanceMethod() {
    print(StructName.propertyName)
    print(EnumName.propertyName)
    print(ClassName.propertyName)
}

static func staticMethod(name: String) {
    print(self.name) // 引数と区別する時はself.
}

class func classMethod(name: String) {
    print(self.name) // 引数と区別する時はself.
}
```

## 特徴
 - サブクラスでオーバーライド（上書き）したい場合はクラスプロパティ一択
 - ストアドプロパティとして定義したい場合はスタティックプロパティ一択

| 比較項目                         | スタティック<br>プロパティ | クラス<br>プロパティ |
|----------------------------------|------------------------|------------------|
| オーバーライド                   | NG                     | OK               |
| ストアドプロパティの定義         | OK                     | NG               |
| コンピューテッド<br>プロパティの定義 | OK                     | OK               |

# 参考

 - [【Swift】classとstaticの挙動の違いを整理する](http://qiita.com/shimesaba/items/dc976b3974cfb41bec0c)
 - [Swiftでクラスメソッド](http://qiita.com/econa77/items/5f9f079953e331207886)
 - [nerd0geek1's iOS Blog / Swiftのclass/static修飾子](http://nerd0geek1.hatenablog.com/entry/2016/01/30/200000)

