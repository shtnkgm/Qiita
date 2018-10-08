# iOSでDark Modeを実装する
# 概要
MacOS MojaveではDark Modeがサポートされていますが、まだiOSはDark Modeがサポートされていません。しかし、TwitterやYouTubeなどのiOSアプリではDark Modeへの切り替え機能が提供されています。本記事では、DarkModeをiOSアプリで提供するための色管理の方法を説明します。

<img src="https://qiita-image-store.s3.amazonaws.com/0/113553/66652d8e-8b08-f690-3f49-8895cbc4a37a.png" width=600px>

# Dark Modeとは
Dark Modek（ダークモード）は夜間モードやダークテーマとも呼ばれ、通常のUIが明るい配色だとすると、それとは逆に**暗い配色を用いたUI**になっています。

DarkMode対応アプリのUIが確認できるサイト
[iOS DARK MODE LIST](https://darkmodelist.com/ios/)

MacOSについてのドキュメントですが、Human Interface GuidelinesにもDark Modeについて説明されている章があります。

[Human Interface Guidelines｜Dark Mode](https://developer.apple.com/design/human-interface-guidelines/macos/visual-design/dark-mode/)

実際にどのような配色にするのかはプロダクトによるかと思いますが、Googleのマテリアルデザインガイドもとても参考になります。

[Google Material Design](https://material.io/design/color/the-color-system.html#)

# 配色例

基本的なUI部品の配色例です。HIGにもある通り、Dark Modeは**単純に通常時の配色の明度を逆にするだけでは不十分**です。個々の部品の色をDark Mode時に見やすいように調整する必要があります。

|UI|DarkMode|通常|
|:--|:--|:--|
|メインテキスト|ホワイト（α=100%）|ブラック（α=87%）|
|サブテキスト|ホワイト（α=70%）|ブラック（α=54%）|
|Disabledテキスト|ホワイト（α=50%）|ブラック（α=38%）|
|アクティブアイコン|ホワイト（α=100%）|ブラック（α=54%）|
|非アクティブアイコン|ホワイト（α=38%）|ブラック（α=50%）|
|ディバイダー|グレー（#303030）|ブラック（α=12%）|
|ツールバー|グレー（#212121）|グレー（#F5F5F5）|
|カード|グレー（#424242）|ホワイト（α=100%）|
|背景|グレー（#303030）|グレー（#FAFAFA）|

# 実装Tips

## UIColorを拡張してモードに応じて色を変更

以下のように、UIColorを拡張して、モード設定（isDarkTheme）の値に応じて指定色を返すようにします。

```swift
public extension UIColor {
    static var activeIcon: UIColor { return isDarkTheme ? .white100 : .black054 }
    static var inactiveIcon: UIColor { return isDarkTheme ? .white038 : .black050 }
    static var primaryText: UIColor { return isDarkTheme ? .white100 : .black087 }
    static var secondaryText: UIColor { return isDarkTheme ? .white070 : .black054 }
    static var disabledText: UIColor { return isDarkTheme ? .white050 : .black038 }
    static var dividers: UIColor { return isDarkTheme ? .gray850 : .black012 }
    static var statusBar: UIColor { return isDarkTheme ? .black100 : .gray300 }
    static var appBar: UIColor { return isDarkTheme ? .gray900 : .gray100 }
    static var highlightedAppBar: UIColor { return isDarkTheme ? .gray800 : .gray200 }
    static var background: UIColor { return isDarkTheme ? .gray850 : .gray050 }
    static var card: UIColor { return isDarkTheme ? .gray800 : .white100 }
    static var highlightedCard: UIColor { return isDarkTheme ? .gray850 : .gray100 }
}
```

指定色は外部から直接指定されることのないよう、private extensionで定義します。

```swift
private extension UIColor {
    static var black012: UIColor { return .init(white: 1.00 - 0.12, alpha: 1) }
    static var black038: UIColor { return .init(white: 1.00 - 0.38, alpha: 1) }
    static var black050: UIColor { return .init(white: 1.00 - 0.50, alpha: 1) }
    static var black054: UIColor { return .init(white: 1.00 - 0.54, alpha: 1) }
    static var black070: UIColor { return .init(white: 1.00 - 0.70, alpha: 1) }
    static var black087: UIColor { return .init(white: 1.00 - 0.87, alpha: 1) }
    static var black100: UIColor { return .init(white: 1.00 - 1.00, alpha: 1) }

    static var white012: UIColor { return .init(white: 0.12, alpha: 1) }
    static var white038: UIColor { return .init(white: 0.38, alpha: 1) }
    static var white050: UIColor { return .init(white: 0.50, alpha: 1) }
    static var white054: UIColor { return .init(white: 0.54, alpha: 1) }
    static var white070: UIColor { return .init(white: 0.70, alpha: 1) }
    static var white087: UIColor { return .init(white: 0.87, alpha: 1) }
    static var white100: UIColor { return .init(white: 1.00, alpha: 1) }
}
```

上記のようにすることで、UIColorを利用する各ViewからはDark Modeかどうかを意識せずに色をセットすることができます。

```swift
backgroundColor = .card
mainLabel.textColor = .primaryText
settingSwitch.onTintColor = .primary
```

## アイコン画像の色指定

アイコン画像はUIImageをUIColorで塗れるようにします。以下はその実装例です。

```swift
public extension UIImage {
    public func image(withTint color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)

        guard let context: CGContext = UIGraphicsGetCurrentContext(), let cgImage = cgImage else {
            return UIImage()
        }

        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: 0, y: -self.size.height)
        context.clip(to: rect, mask: cgImage)
        context.setFillColor(color.cgColor)
        context.fill(rect)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
        UIGraphicsEndImageContext()
        return image
    }
}
```

上記のメソッドを利用することで、UIImageを利用したアイコンもシンプルなものであれば以下のように色を指定できます。

```swift
let iconImage = UIImage(named: "icon").image(withTint: .activeIcon)
```

## モード切り替え時に色の変更を行う

モード変更時に各Viewの配色をセットし直す必要があります。モード変更後、新規に生成するViewであればそのままで問題ありませんが、すでにインスタンスが生成され、色をセットしているViewの場合は、Dark Modeの色で更新をする必要があります。

モードの変更を通知する仕組みとして、NotificationCenterを利用します。

（流れ）

 1. 各Viewで通知を購読しておく
 2. モードの変更時にNotificationCenterで通知
 3. 各Viewで通知を受け取る
 4. 各Viewで色を更新

各Viewでの通知の購読処理を簡略化するために、以下のようなStyleUpdatableプロトコルを作成します。

```swift
public protocol StyleUpdatable: class {
    /// 通知を解除する場合はObserverを保持する必要あり
    var updateStyleObserver: NSObjectProtocol? { get set }

    /// 色の更新処理は必ずupdateStyleという名前のメソッドで行う
    func updateStyle()
}

public extension StyleUpdatable {
    /// updateStyleObserverを任意実装とするためのデフォルト実装
    var updateStyleObserver: NSObjectProtocol? {
        get { return nil }
        set { }
    }

    /// 購読 & updateStyle()を実行
    func observeAndUpdateStyle() {
        updateStyle()
        let center = NotificationCenter.default
        updateStyleObserver = center.addObserver(forName: .styleUpdated,
                                                 object: nil,
                                                 queue: nil) { [weak self] _ in
                                                    self?.updateStyle()
        }
    }
}

public extension Notification.Name {
    static let styleUpdated = Notification.Name("styleUpdated")
}
```

StyleUpdatableプロトコルのエクステンションで処理を共通化することにより、各Viewは以下のようにテーマ変更の購読処理、色の更新処理を記述することができます。

```swift
class HogeView: StyleUpdatable {
    init() {
        observeAndUpdateStyle()
    }
   
    // StyleUpdatableにより実装が強制される
    // モードが変更された際にupdateStyleが実行される
    // 色の更新処理はこのメソッド内に集約する
    func updateStyle() {
        backgroundColor = .card
    }
}
```

後はDark Modeかどうかの設定をUserDefaultsなどで永続化し、その設定変更時にNotificationCenterで変更を通知します。

# まとめ

DarkModeをiOSアプリで提供するためのカラーマネジメント方法のまとめです。

 - DarkModeと通常時の配色を考える
 - UIColorを拡張して、DarkModeかどうかで分岐
   (各ViewはDarkModeかどうかを考慮しなくて良い)
 - アイコンはUIImageをUIColorで塗れるようにする
 - StyleUpdatableプロトコルで色の更新処理を共通化

