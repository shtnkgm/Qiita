# 【iOS】オープンソースSwiftライブラリのつくり方
# はじめに
[iOS Advent Calendar 2018](https://qiita.com/advent-calendar/2018/ios)、3日目担当の@shtnkgmです！先日以下のOSSライブラリをはじめてリリースしました🎉
> [shtnkgm/ImageTransition](https://github.com/shtnkgm/ImageTransition)
> library for smooth animation of images during transitions

そのノウハウとして**iOS向けのSwiftオープンソースライブラリのつくり方**をまとめます。

 - ライブラリをつくる（Embedded Frameworkとして作成、デモ用ターゲットの追加）
 - 設定しておくと良いもの(.gitignore、swiftlint、Travis CI、CODEBEAT）
 - パッケージ管理ツールのサポート（Carthage、CocoaPods）
 - ライブラリの説明を書く（LICENSE、README.md）
 - ライブラリの宣伝

例題として、初代の半透明iMacのカラーリングにも使われた**「Bondi Blue」の色をUIColorとして提供するだけ**のライブラリを作成します。
<img width="600px" src="https://qiita-image-store.s3.amazonaws.com/0/113553/117ea640-b392-b0aa-47fa-d9a5d3aa3eb0.png">

## ライブラリを実装する

### Embedded Frameworkとして作成

**「Cocoa Touch Framework」**テンプレートを選択し、新規にXcodeプロジェクトを作成します。ライブラリ本体のコードとして、UIColorのエクステンションを実装しました。
<img width="600px" alt="スクリーンショット 2018-12-02 19.37.05.png" src="https://qiita-image-store.s3.amazonaws.com/0/113553/783fe8fd-f394-7e95-8e64-88abb9472e82.png">
アプリ側から利用したいAPIは**アクセス修飾子をpublicもしくはopen**にしておく必要があります。特に、構造体のメンバーワイズイニシャライザやクラスのデフォルトイニシャライザなど**暗黙的に実装されるものはデフォルトでinternal**となっているため、注意が必要です。（過去記事：[Swiftとイニシャライザ](https://qiita.com/shtnkgm/items/8b7979fc84a3cc065238))

```swift
// publicもしくはopenにしておかないと、アプリ側（別モジュール）から利用できない
public extension UIColor {
    static var bondiBlue: UIColor = .init(hex: "0095b6")
}
```

### デモ用ターゲットの追加
`File > New > Target...`からライブラリのお試し用のDemoターゲットを追加します。
<img width="300px" src="https://qiita-image-store.s3.amazonaws.com/0/113553/2af95232-3586-afb5-258f-dafa102a5406.png">
Demoターゲットで`Link Binary With Libraries`にBondiBlue.frameworkを追加します。
<img width="500px" src="https://qiita-image-store.s3.amazonaws.com/0/113553/87c53012-b3a1-82f9-506c-0962b055b21d.png">
サンプルコードは以下のようになりました。

```swift
import UIKit
import BondiBlue

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .bondiBlue
    }
}
```

### 設定しておくと良いもの
その他以下についても設定しておくと良いかと思います。

 - .gitignore（git管理しないファイルの設定、過去記事→[iOSアプリ開発用の.gitignoreの管理方法](https://qiita.com/shtnkgm/items/86fdd1d8ccfcfb3ac0c9)）
 - [SwiftLint](https://github.com/realm/SwiftLint)（Lintツール、過去記事→[SwiftLintの運用ノウハウ](https://qiita.com/shtnkgm/items/6dd756aa14926736c6f5)）
 - [Travis CI](https://travis-ci.org/)の連携（publicリポジトリであれば無料で使えるCIツール）
 - [CODEBEAT](https://codebeat.co/)の連携（コードの品質をチェックしてくれるGitHub連携アプリ）

## パッケージ管理ツールのサポート

### Carthage

Carthageでの配布を行うためには、TargetがShared Schemeになっている必要があります。
`Product > Scheme > Manage Schemes...`から作成したframeworkのSharedにチェックが入っていることを確認します。（Xcode10では既にチェックが入っていました）
<img width="500px" src="https://qiita-image-store.s3.amazonaws.com/0/113553/05a2e7ae-a017-2ede-37bf-5f51bc8cf144.png">

以下のコマンドをターミナルで実行することで、正しくframeworkが作成されるか確認することもできます。（任意）

```bash
# frameworkをビルド
$ carthage build --no-skip-current

# frameworkが生成されていることを確認
$ ls Carthage/Build/iOS/
4705D7A0-13ED-35A6-B5F4-BBA78FEA34A3.bcsymbolmap
BondiBlue.framework
BondiBlue.framework.dSYM
```

あとはGitHub側でバージョンを切ってリリースするだけです。
`Githubリポジトリトップ画面 > releaseタブ > create a new release`
<img width="400px" src="https://qiita-image-store.s3.amazonaws.com/0/113553/c51708e4-5949-b32e-8c7f-66b70e7463f6.png">

### CocoaPods

CocoaPodsで配布を行うためにはまずはpodspecファイルを作成します。
プロジェクトのルートディレクトリで`pod spec create [ライブラリ名]`を実行することで.podspecが作成されます。

```bash
# podspecを作成
$ pod spec create BondiBlue
```

ライブラリの内容に合わせて[ライブラリ名].podspecを編集します。サンプルでは以下のようにしました。

```ruby
Pod::Spec.new do |spec|
  spec.name           = "BondiBlue"
  spec.version        = "1.0.5"
  spec.summary        = "UIColor Extension of BondiBlue Color"
  spec.homepage       = "https://github.com/shtnkgm/BondiBlue"
  spec.license        = { :type => 'MIT', :file => 'LICENSE' }
  spec.author         = "shtnkgm"
  spec.platform       = :ios, "10.0"
  spec.swift_version  = "4.2"
  spec.source         = { :git => "https://github.com/shtnkgm/BondiBlue.git", :tag => "#{spec.version}" }
  spec.source_files   = "BondiBlue/**/*.swift"
end
```

書き方のチェックは以下のコマンドで行えます。

```bash
# podspecファイルをチェック
$ pod lib lint
```

lintを行い、以下のような点を指摘されました。

 - ○○行目で形式がおかしい
 - swiftバージョンは`.swift-version`が非推奨になったので、swift_version属性に書く
 - プラッフォーム情報を書く（iOSとサポートバージョン）
 - 後述するLICENSEがないので設定する

次にCocoaPodsでの配布を行うための[CocoaPods Trunk](https://guides.cocoapods.org/making/getting-setup-with-trunk.html)というAPIサービスへアカウントの登録を行います。以下のコマンドを実行すると、メールが届くので中のリンクをクリックして登録を完了します。

```bash
# CocoaPods Trunkへのアカウント登録
$ pod trunk register メールアドレス '名前'
```
あとは最後にバージョン管理用のtagをつけ、ライブラリを公開します。

```bash
# バージョンを設定
$ git tag 1.0.5
$ git push origin 1.0.5

# ライブラリを公開（警告を無視したい場合は--allow-warningsをつける）
$ pod trunk push BondiBlue.podspec
```

## ライブラリの説明を書く

### LICENSEの追加
LICENSEはGitHub上でテンプレートを選択するだけで簡単に作成できます。

 - `GitHubリポジトリトップ画面 > Create new file`をクリック
 - LICENSEと入力する
 - 右側に「Choose a license template」が出てくるのでクリック

<img width="500px" src="https://qiita-image-store.s3.amazonaws.com/0/113553/90b63b45-ee17-7bd2-b7ea-b2d3d97ec27f.png">

サンプルではMITライセンスのテンプレートを選択しました。

### README.mdの追加
README.mdにライブラリの説明を記述します。世界中の方が見るので、文章は英語で書きます。

**バッジの追加**
よくあるこんなバッジは[shields.io](https://shields.io/#/)というサービスでつくることができます。Markdown形式で貼っておくだけで自動で情報を更新してくれたりするので便利です。
<img width="300px" src="https://qiita-image-store.s3.amazonaws.com/0/113553/ec2d7fbc-52a6-590c-2aa0-8015d2b52e4a.png">

**READMEに書くこと**

 - ライブラリのタイトル（可能ならばかっこいいバナー画像にする）
 - バッジ（サポート環境やCIのステータスなど）
 - ライブラリの使い方
 - インストール方法（Carthage/CocoaPodsなど）
 - サポート環境
 - コントリビューションの方法（プルリクやissueのつくり方）
 - 著者とライセンス情報

[サンプル: BondiBlueのREADME](https://github.com/shtnkgm/BondiBlue/tree/master)

## ライブラリの宣伝
作ったライブラリは自分で使うのもいいですが、OSSなのでできてば他の人にも使ってもらいたいかと思います。
以下の方法で宣伝すると良さそうです。

 - 自分のブログやQiitaで紹介
 - 関連する勉強会で紹介
 - 便利なiOSライブラリを集めているリポジトリにプルリクを送って掲載してもらう
   - [vsouza/awesome-ios](https://github.com/vsouza/awesome-ios)
   - [Wolg/awesome-swift](https://github.com/Wolg/awesome-swift)
   - [matteocrippa/awesome-swift](https://github.com/matteocrippa/awesome-swift)　※15star必要

## 最後に
ライブラリをOSSとして公開すると、海外の方々から意外とstarが貰えて、とてもモチベーションに繋がります🎉もしもOSSへのコントリビューション活動をまだしていないのであればissueや簡単なプルリクなどからでもオススメします！

以上、iOS Advent Calendar 2018 3日目の記事でした！

