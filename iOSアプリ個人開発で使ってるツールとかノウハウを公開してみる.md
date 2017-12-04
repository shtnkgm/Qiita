# iOSアプリ個人開発で使ってるツールとかノウハウを公開してみる
個人でアプリを開発していると結構ガラパゴス化するのではないかと思い、
開発環境やツールなどを公開してみます。少しでもご参考になればと思います。

# リリース実績
 - 2011年から、現在までで計11個のiPhoneアプリをリリース
 - うち写真アプリ×10、便利ツール×1

# 開発環境

![IMG_2263.jpg](https://qiita-image-store.s3.amazonaws.com/0/113553/e9eaf519-4eb2-1814-f889-59f4b30d3451.jpeg)

## ハードウェア
 - 開発機（MacBook Pro Retina, 15-inch, Mid 2015）
 - 外部モニタ×1（三菱RDT235WLM-D）
 - キーボード（[Apple Wireless Keyboard MC184J/A](http://www.apple.com/jp/shop/product/MLA22J/A/magic-keyboard-jis)）
 - マウス([logicool M720 TRIATHLON](https://www.logicool.co.jp/ja-jp/product/m720-triathlon))


```
2017/3/25追記：
※皆様ご指摘の通り、Swiftコンパイルに時間がかかるため、開発機を変更しました！
```

## ソフトウェア
Sketchは操作がわかりやすく、iOSのテンプレがあるので使い始めました。
個人開発だからバージョン管理ソフトはいらないと思っていましたが、
アプリの種類や、バージョンが増えてきてぐちゃぐちゃになってきたのでGitを導入しました。

 - macOS Sierra 10.12
 - Xcode 9
 - [Coda](https://panic.com/jp/coda/)（HTML/CSS/Pythonコーディング用）
 - [Sketch](https://www.sketchapp.com/)（アプリアイコン/UIパーツ作成用）
 - [Cocoapods](https://cocoapods.org/)（パッケージ管理）
 - [Carthage](https://github.com/Carthage/Carthage)（パッケージ管理）
 - [Git](https://git-scm.com/)（バージョン管理）
 - [Slack](https://slack.com/)（チャットでの通知）
 - [Evernote](https://evernote.com/intl/jp/)（アプリの企画メモ、開発手順の記録など）
 - [Fastlane](https://github.com/fastlane/fastlane)（AppStoreへの申請の自動化）
 - [Charles](https://www.charlesproxy.com/)(通信パケットキャプチャ)
 - [Deckset](https://www.decksetapp.com/)(資料作成)

# 開発言語
Objective-C大好きだったのですが、Swiftはもっと好きになりました。

 - Swift / Objective-C（古い機能はObjective-Cで書いてあるので移行中）
 - HTML/CSS（アプリサポート用サイトのコーディング）
 - Python（画像のリサイズなどで自動化スクリプトをつくるとき）
 - Bash（Info.plistの設定変更やxcodebuildの自動化バッチをつくるとき）

# 利用しているWebサービス
定番のサイトも多いですが、カテゴリ分けして整理してみました。

## リファレンス系
以下に書いてあるサイト以外にも個人の技術ブログなどにもとてもお世話になっています。

 - [Qiita](http://qiita.com/)（情報収集/アウトプット）
 - [Developers.IO](http://dev.classmethod.jp/category/smartphone/iphone/)（情報収集）
 - [Stack Overflow](http://stackoverflow.com/)（トラブルシュート）
 - [ドットインストール](http://dotinstall.com)（プログラミング学習）
 - [Apple公式ドキュメント](https://developer.apple.com/jp/documentation/)（コーディングリファレンス）

## UIデザイン
デザインも自分でやらないといけないので、素材を活用してます。
最近はフラットデザインに合うアイコン素材を提供しているicons8を主に活用中。

 - [icons8](https://icons8.com/)（ボタンUI等のアイコン画像）
 - [iconmonstr](http://iconmonstr.com/)（アイコン素材）
 - [ICOOON MONO](http://icooon-mono.com)（アイコン素材）
 - [Subtle Patterns](http://subtlepatterns.com/)（背景パターン素材）
 - [MakeAppIcon](https://makeappicon.com/)（アプリアイコンの複数サイズ切り出し）
 - [pttrns](http://pttrns.com/)（UIデザインの参考）
 - [Dribbble](https://dribbble.com/)（UIデザインの参考）

## ライブラリ管理
似たようなアプリをいくつか作っているので、
よく使うmethodやclassを部品化して、再利用しています。

 - [Bitbucket](https://bitbucket.org/)（プライベートリポジトリで自作ライブラリのバージョン管理、Todo管理）
 - [COCOAPODS SEARCH](http://cocoapods.wantedly.com/)（オープンソースライブラリの検索、ランキング）
 - [cocoa CONTROLS](https://www.cocoacontrols.com/)（オープンソースライブラリの検索）

## 運用
問い合わせはGoogleフォームで受けて、投稿があったらSlackに通知させています。
サポートサイトもGithub Pagesで作成しているので無料です。

 - [Googleフォーム](https://docs.google.com)（問い合わせ受付、ユーザーからの不具合受付）
 - [Google Analytics](https://analytics.google.com)（アクセス解析）
 - [bit.ly](https://app.bitly.com)（URL短縮、アクセス解析）
 - [App Annie](https://www.appannie.com)（アプリ分析、収益確認）
 - [GitHub](https://github.com)（Github Pagesでサイト公開）
 - [MFクラウド会計](https://biz.moneyforward.com/)（会計/確定申告）

## AppStore用写真素材
AppStoreに載せるスクリーンショットの素材はここから良さげなものをDLしてます。

 - [ぱくたそ](https://www.pakutaso.com/)
 - [Morguefile](http://morguefile.com/ )
 - [写真AC](http://www.photo-ac.com/)
 - [写真素材 足成](http://www.ashinari.com/)
 - [re:splashed](http://www.resplashed.com/)
 - [LIFE OF PIX](http://www.lifeofpix.com/)

# 書籍
あまり初心者向け書籍で触れられない、設計やコーディングスタイル、UIKitの勉強に役立った本など。

 - [iOS開発におけるパターンによるオートマティズム](http://hmdt.jp/hmdtbooks/pg329.html)
 - [Effective Objective-C 2.0](http://www.shoeisha.co.jp/book/detail/9784798134192)
 - [Swift実践入門](http://gihyo.jp/book/2017/978-4-7741-8730-3)
 - [詳解Swift 第3版](http://www.sbcr.jp/products/4797390537.html)
 - [本気ではじめるiPhoneアプリ作り（ヤフー黒帯シリーズ）](http://www.sbcr.jp/products/4797384512.html)
 - [よくわかるAuto Layout](http://www.ric.co.jp/book/contents/book_1032.html)

# 利用しているオープンソースライブラリ
デファクトスタンダードになっているものをよく使ってます。

 - [SVProgressHUD](https://github.com/SVProgressHUD/SVProgressHUD)（ローディング表示）
 - [ChameleonFramework](https://github.com/ViccAlexander/Chameleon)（フラットデザインな配色にする）
 - [GPUImage](https://github.com/BradLarson/GPUImage)（画像処理）
 - [AFNetworking](https://github.com/AFNetworking/AFNetworking)（通信処理）
 - [LLSimpleCamera](https://github.com/omergul123/LLSimpleCamera)（カメラ機能）
 - [EAIntroView](https://github.com/ealeksandrov/EAIntroView)（初回起動時のマニュアル）
 - [UCKDeviceInfo](https://cocoapods.org/pods/UCKDeviceInfo)（端末情報取得）
 - [SwiftLint](https://github.com/realm/SwiftLint)（Lintツール）
 - [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)（JSONパーサー）

