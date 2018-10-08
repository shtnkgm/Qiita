# Xcode10でCarthageビルドが失敗する場合の対処方法
# 概要
Xcode10でCarthageビルドが失敗したので、その対処方法のメモです。

# エラー内容
以下のように`carthage bootstrap`コマンドを実行したところ、ビルドに失敗しました。

```bash
$ carthage bootstrap platform --ios
*** Checking out ActionClosurable at "1.2.0"
*** Checking out Toast-Swift at "3.0.1"
*** Checking out SVProgressHUD at "2.2.5"
*** xcodebuild output can be found in /var/folders/62/nrp34pc96t550_hhml86hmwrr_q2rc/T/carthage-xcodebuild.r9noDR.log
*** Building scheme "ActionClosurable" in ActionClosurable.xcodeproj
*** Building scheme "Chameleon" in Chameleon.xcodeproj
Build Failed
	Task failed with exit code 65:
	/usr/bin/xcrun xcodebuild -project /Users/shtnkgm/Desktop/MyLibrary/Carthage/Checkouts/Chameleon/Chameleon.xcodeproj -scheme Chameleon -configuration Release -derivedDataPath /Users/shtnkgm/Library/Caches/org.carthage.CarthageKit/DerivedData/10.0_10L176w/Chameleon/2.2.0 -sdk iphonesimulator -destination platform=iOS\ Simulator,id=565ABA1F-07F4-40B8-A4F3-8588120D4CD7 -destination-timeout 3 ONLY_ACTIVE_ARCH=NO CODE_SIGNING_REQUIRED=NO CODE_SIGN_IDENTITY= CARTHAGE=YES build (launched in /Users/shtnkgm/Desktop/MyLibrary/Carthage/Checkouts/Chameleon)
```

詳細を確認するためcarthageビルドの実行ログを表示します。

```bash
$ cat /var/folders/62/nrp34pc96t550_hhml86hmwrr_q2rc/T/carthage-xcodebuild.OLoaQO.log

〜中略〜

note: Using new build system
note: Planning build
note: Using build description from disk
Build system information
error: Cycle inside Chameleon; building could produce unreliable results.
Cycle details:
→ Target 'Chameleon' : CodeSign /Users/shtnkgm/Library/Caches/org.carthage.CarthageKit/DerivedData/10.0_10L176w/Chameleon/2.2.0/Build/Products/Release-iphonesimulator/Chameleon.framework
○ Target 'Chameleon' has a command with output '/Users/shtnkgm/Library/Caches/org.carthage.CarthageKit/DerivedData/10.0_10L176w/Chameleon/2.2.0/Build/Products/Release-iphonesimulator/Chameleon.framework/Chameleon'
○ Target 'Chameleon' has link command with output '/Users/shtnkgm/Library/Caches/org.carthage.CarthageKit/DerivedData/10.0_10L176w/Chameleon/2.2.0/Build/Intermediates.noindex/Chameleon.build/Release-iphonesimulator/Chameleon.build/Objects-normal/x86_64/Chameleon'
○ Target 'Chameleon' has a command with output '/Users/shtnkgm/Library/Caches/org.carthage.CarthageKit/DerivedData/10.0_10L176w/Chameleon/2.2.0/Build/Products/Release-iphonesimulator/Chameleon.framework/Chameleon'

** BUILD FAILED **
```

# 原因
Xcode10の新機能である循環依存の検知でエラーとなっているようです。
なぜ循環依存となっていたのかまでは分かりませんでした。

# 解決した方法
Carthage側のキャッシュを消してみます。

```bash
rm -rf ~/Library/Caches/org.carthage.CarthageKit 
rm -rf ~/Library/Caches/carthage
```

これで正常にcarthageビルドできるようになりました。

# 参考
 - [iOSアプリ開発でのキャッシュ削除方法まとめ](https://qiita.com/shtnkgm/items/c96a58579ec406194fa8)

