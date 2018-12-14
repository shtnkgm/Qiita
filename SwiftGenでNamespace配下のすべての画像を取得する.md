# SwiftGenでNamespace配下のすべての画像を取得する
# 概要

[SwiftGen](https://github.com/SwiftGen/SwiftGen)で特定のNamespace配下の全画像を配列として取得したいケースが発生したので、その対応方法をまとめます。

例えば、以下の画像のように、「animal」や「number」というNamespace配下の全画像を取得します。

![image.png](https://qiita-image-store.s3.amazonaws.com/0/113553/5a9b46f1-7fd9-3f4c-6225-fea002c8ab05.png)

# 取得方法

## swiftgen.ymlの修正
Namespaceを考慮せずに全画像を取得するためのパラメータ「allValues」を以下のように指定します。

```yaml
xcassets:
  inputs:
    - SwiftGenSample/Assets.xcassets
  outputs:
    - templateName: swift4
      params:
        allValues: true
      output: SwiftGenSample/SwiftGen-Assets.swift
```

上記のように設定することで、以下のようにNamespaceを考慮しない全画像を取得することができます。

```swift
Asset.allImages
```

## Namespace毎の全画像を取得する

Namespaceを指定した場合の画像のパス（name）は以下のようになっています。

```
animal/animal_mark01_buta
animal/animal_mark02_kuma
animal/animal_mark03_inu
```

また、SwiftGenは以下のように**Namespaceの最初の文字を大文字にした列挙型**を自動生成します。

```swift
  internal enum Number {

    internal static let numberDigtal0 = ImageAsset(name: "number/number_digtal0")
    internal static let numberDigtal1 = ImageAsset(name: "number/number_digtal1")
    internal static let numberDigtal2 = ImageAsset(name: "number/number_digtal2")
    internal static let numberDigtal3 = ImageAsset(name: "number/number_digtal3")
    internal static let numberDigtal4 = ImageAsset(name: "number/number_digtal4")
    internal static let numberDigtal5 = ImageAsset(name: "number/number_digtal5")
    internal static let numberDigtal6 = ImageAsset(name: "number/number_digtal6")
    internal static let numberDigtal7 = ImageAsset(name: "number/number_digtal7")
    internal static let numberDigtal8 = ImageAsset(name: "number/number_digtal8")
    internal static let numberDigtal9 = ImageAsset(name: "number/number_digtal9")
  }
```

上記の仕様から、画像のパス（name）と自動生成された列挙型を比較し、Namespaceが等しいか確認するメソッドを作成してみました。

```swift
extension String {
    /// 引数に指定した型のNamespaceを持つ文字列か判定する
    func hasNamespacePath(of assetType: Any) -> Bool {
        guard let namespace = self.split(separator: "/").first else { return false }
        return namespace.capitalized == String(describing: assetType.self)
    }
}
```

上記のメソッドを利用することで、以下のようにNamespace毎の全画像を取得することができます。

```swift
// 数字のImageAsset配列
let numberImages = Asset.allImages.filter { $0.name.hasNamespacePath(of: Asset.Number.self) }

// 動物のImageAsset配列
let animalImages = Asset.allImages.filter { $0.name.hasNamespacePath(of: Asset.Animal.self) }
```

## サンプルコード
https://github.com/shtnkgm/SwiftGenSample

## 補足
stencilテンプレートをカスタマイズし、enumをCaseIterableに準拠させるなどの方法も考えられますが、今回はテンプレートのパラメータを利用する方法で実装してみました。何か他に良い方法などございましたらコメントなどで教えていただけると幸いです。




