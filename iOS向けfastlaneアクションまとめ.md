# iOS向けfastlaneアクションまとめ
# 概要
iOS向けのfastlaneアクション（fastlaneで簡単に利用できる機能群）についてざっと知りたい方向けに、公式ドキュメントと概要をまとめてみました。以下のカテゴリに分類してあります。

 - ビルド
 - コード署名
 - Push通知
 - テスト
 - スクリーンショット
 - リリース

fastlane v2.68.0よりアクション名が新しくなっていますので、以下の形式で併記します。
[Fastlane core action rename & aliases #10939](https://github.com/fastlane/fastlane/pull/10939)
**v2.68.0以降の新アクション名｜旧アクション名**

# ビルド

## build_ios_app, build_app｜gym
 - [公式ドキュメント](https://github.com/fastlane/fastlane/tree/master/gym)
 - ビルドとiOSパッケージ（ipaファイル）の作成を自動化
 - xcodebuildの代わり
 - 例）`gym(scheme: "MyApp")`

## cocoapods
 - [公式ドキュメント](https://github.com/CocoaPods/CocoaPods)
 - pod installの実行を自動化
 - 例）`cocoapods`

## carthage
 - [公式ドキュメント](https://github.com/Carthage/Carthage)
 - carthageの実行を自動化
 - 例）`carthage`

## badge
- [公式ドキュメント](https://github.com/HazAT/badge)
- アプリアイコンにバッジをつける（色やバージョンなどの文言を指定可能）
- 例）`badge --dark`

# コード署名

## get_provisioning_profile｜sigh
 - [公式ドキュメント](https://github.com/fastlane/fastlane/tree/master/sigh)
 - ローカルマシンにCertificateに紐づく有効なProvisioningProfileをセットアップ
 - 例）`sigh(adhoc: true, force: true, filename: "myFile.mobileprovision")`

## sync_code_signing｜match
 - [公式ドキュメント](https://github.com/fastlane/fastlane/tree/master/match)
 - gitリポジトリでCertificateとProvisioningProfileを管理
 - 既存のCertificateはrevoke
 - 例）`match(type: "appstore", app_identifier: "tools.fastlane.app")`

## get_certificates｜cert
 - [公式ドキュメント](https://github.com/fastlane/fastlane/tree/master/cert)
 - ローカルマシンに有効なCertificateと秘密鍵をセットアップ
 - 新規作成や既存の有効なCertificatをローカルに保存など
 - 例）`cert(development: true, username: "user@email.com")`

# Push通知

## get_push_certificate｜pem
 - [公式ドキュメント](https://github.com/fastlane/fastlane/tree/master/pem)
 - プッシュ証明書の生成、更新を自動化
 - 例）`pem`

# テスト

## run_tests｜scan
 - [公式ドキュメント](https://github.com/fastlane/fastlane/tree/master/scan)
 - テストを実行
 - テスト結果を見やすく整形してコマンドライン出力
 - 例）`scan`

## slather
 - [公式ドキュメント](https://github.com/SlatherOrg/slather)
 - コードカバレッジレポート生成を自動化
 - 例）`slather(
  build_directory: "foo",
  input_format: "bah",
  scheme: "MyScheme",
  proj: "MyProject.xcodeproj"
)`

## swiftlint
 - [公式ドキュメント](https://github.com/realm/SwiftLint)
 - ルールに従ったswiftコードのバリデーション処理を自動化
 - 例）`swiftlint(mode: :autocorrect)`

## upload_to_testflight｜pilot
 - [公式ドキュメント](https://github.com/fastlane/fastlane/tree/master/pilot)
 - TestFlightの管理の自動化
 - アプリのアップロードと配布、テスター管理、テスターと端末の情報取得
 - testflightアクションのエイリアス
 - 例）`pilot`

# スクリーンショット

## capture_ios_screenshots, capture_screenshots｜snapshot
 - [公式ドキュメント](https://github.com/fastlane/fastlane/tree/master/snapshot)
 - 言語別、端末別のスクリーンショットを作成
 - deliverと連携してiTunesConnectへアップロード
 - 例）`snapshot(
  skip_open_summary: true,
  clean: true
)`

## frame_screenshots｜frameit
 - [公式ドキュメント](https://github.com/fastlane/fastlane/tree/master/frameit)
 - スクリーンショットをiPhoneやmacなど端末写真の画面内にはめ込む
 - キャッチコピー用の文字も挿入可能（色、フォントも指定可能）
 - 例）`frameit(rose_gold: true)`

# リリース

## upload_to_app_store｜deliver
 - [公式ドキュメント](https://github.com/fastlane/fastlane/tree/master/deliver)
 - スクリーンショット、メタデータ、アプリバイナリをiTunesConnectへアップロード
 - 例）`deliver(
  submit_for_review: true,
  force: true,
  metadata_path: "./metadata"
)`

## create_app_online｜produce
 - [公式ドキュメント](https://github.com/fastlane/fastlane/tree/master/produce)
 - iTunesConnectやApple Developer Portalで新規アプリ作成時に必要な手続きを自動化
 - AppIDやアプリ名、デフォルト言語などの指定
 - アプリの利用サービス（ApplePay、GameCenter、IAPなど）の有効化
 - 例）

```
produce(
  username: "felix@krausefx.com",
  app_identifier: "com.krausefx.app",
  app_name: "MyApp",
  language: "English",
  app_version: "1.0",
  sku: "123",
  team_name: "SunApps GmbH"
)
```

## check_app_store_metadata｜precheck
 - [公式ドキュメント](https://github.com/fastlane/fastlane/tree/master/precheck)
 - AppStore審査の前にアプリを事前チェックしてリジェクトリスクを減らす
 - メタデータの文言チェックやアプリのスキャンを実行
 - 例）
 - 
```
precheck(
  negative_apple_sentiment(level: :skip),
  curse_words(level: :warn)
)
```

# 参考
なるべくメジャーなものを記載しましたが、上記以外にもアクションはたくさんあります。その他のアクションはこちらのドキュメントから確認できます。

 - [fastlane actions](https://docs.fastlane.tools/actions/)

