# Swiftの型のMock化パターンまとめ
# 概要
Swiftにおいて、ユニットテストがしやすいよう、テスタブルな設計にする方法の一部として、依存する**型をMock化するパターン**をまとめます。

# パターン一覧
本記事で説明するパターンは以下の4パターンです。

 - パターン①：具象クラスに依存、Mock用のサブクラスを作成
 - パターン②：抽象クラスに依存、Mock用のサブクラスを作成
 - パターン③：ラッパークラスに依存、Mock用のサブクラスを作成
 - パターン④：プロトコルに依存、プロトコルに準拠したMock用の具象型を作成

**補足**

 - 下記のコード例では**DIの方法**や**Mockでの振る舞いの変化のさせ方**については本旨から逸れるため、特にパターン分けには考慮していません。
 - 型のMock化のまとめのため、動的に振る舞いのみを差し替える**Method Swizzling**などのパターンも含めていません。

## パターン①：具象クラスに依存、Mock用のサブクラスを作成

以下のようにUserDefaultsなど、具象クラスに実装が依存している場合のパターンです。**具象クラスを継承したサブクラスを作成**することにより、依存クラスをMockに差し替えます。

```swift
// 具象クラスに依存、Mock用のサブクラスを作成
struct Pattern1 {
    let userDefaults: UserDefaults
    init(_ userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
}
 
class MockUserDefaults: UserDefaults { }
let pattern1 = Pattern1(MockUserDefaults())
```

## パターン②：抽象クラスに依存、Mock用のサブクラスを作成

実装的にはパターン①とは大きく変わりませんが、依存クラスが抽象クラス（スーパークラス）の場合のパターンです。**抽象クラスを継承したサブクラスを作成**することにより、依存クラスをMockに差し替えます。

```swift
// 抽象クラスに依存、Mock用のサブクラスを作成
struct Pattern2 {
    let apiClient: AbstructAPIClient
    init(apiClient: AbstructAPIClient = APIClient()) {
        self.apiClient = apiClient
    }
}
 
class AbstructAPIClient { }
class APIClient: AbstructAPIClient { }
class MockAPIClient: AbstructAPIClient { }
 
let pattern2 = Pattern2(apiClient: MockAPIClient())
```

## パターン③：ラッパークラスに依存、Mock用のサブクラスを作成 

以下のようにDateなどの構造体に依存している場合のパターンです。**構造体には継承機能がなく、そのままではサブクラスの作成によるMock化はできない**ため、以下のようなラッパークラスを作成し、ラッパークラスを継承したサブクラスを作成することにより、依存クラスをMockに差し替えます。

```swift
// ラッパークラスに依存、Mock用のサブクラスを作成
struct Pattern3 {
    let dateWrapper: DateWrapper
    init(_ dateWrapper: DateWrapper = DateWrapper()) {
        self.dateWrapper = dateWrapper
    }
}
 
class DateWrapper {
    var currentDate: Date { return Date() }
}
 
class MockDateWrapper: DateWrapper {
    override var currentDate: Date {
        return Date(timeIntervalSince1970: 0)
    }
}
 
let pattern3 = Pattern3(MockDateWrapper())
```

## パターン④：プロトコルに依存、プロトコルに準拠したMock用の具象型を作成

以下のように、プロトコルに実装が依存している場合のパターンです。プロトコルに準拠したMock用の具象型を作成することにより依存型をMockに差し替えます。
※プロトコル、構造体の命名は適当です。

```swift
// プロトコルに依存、プロトコルに準拠したMock用の具象型を作成
struct Pattern4 {
    let dateWrapper: DateWrapperType
    init(dateWrapper: DateWrapperType = DateWrapperImpl()) {
        self.dateWrapper = dateWrapper
    }
}
 
protocol DateWrapperType {
    var currentDate: Date { get }
}
 
struct DateWrapperImpl: DateWrapperType {
    var currentDate: Date {
        return Date()
    }
}
 
struct MockDateWrapperImpl: DateWrapperType {
    var currentDate: Date {
        return Date(timeIntervalSince1970: 0)
    }
}
 
let pattern4 = Pattern4(dateWrapper: MockDateWrapperImpl())
```

## 備考: クラスエクステンションのMock化について
パターン①〜③のようにオーバーライドの機能により振る舞いを変更する場合において、以下のようなextensionに実装されたメソッドの場合は少し工夫が必要です。

```swift
class Hoge {
    
}

extension Hoge {
    func fuga() {
        print("not mock")
    }
}

class HogeMock: Hoge {
    // コンパイルエラー
    // Overriding non-@objc declarations from extensions is not supported
    override func fuga() {
        print("mock")
    }
}
```

このままビルドすると、override部分で以下のコンパイルエラーとなります。

> Overriding non-@objc declarations from extensions is not supported

少し対応がわかりにくいエラーですが、継承元のメソッドに`@objc`属性を付与することで、オーバーライドできるようになります。

```swift
extension Hoge {
    @objc func fuga() {
        print("not mock")
    }
}
```

