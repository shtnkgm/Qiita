# iOSアプリ開発でのキャッシュ削除方法まとめ
# はじめに
以下のキャッシュ情報を削除する方法をまとめました。チートシート的にコピペして使って頂ければと思います。

様々なキャッシュの削除方法を知っておくことで、リンクがうまくできない、画像などのリソースファイルが更新されない、Xcodeのコード補完がでない、エラーが解消できない、など問題が起こった際の手助けになります。

 - Xcode
 - llvm/clang
 - Homebrew
 - SwiftLint
 - CocoaPods
 - Carthage
 - Fastlane

**Note:** キャッシュファイルの削除は自己責任でお願いいたします。

# Xcodeのキャッシュ削除

## Xcode.appのキャッシュ削除

```bash
rm -rf ~/Library/Caches/com.apple.dt.Xcode/
```

**Tip:** Xcodeがフリーズする場合などに解決策として使われるコマンドのようです。 

## クリーンビルド

```bash
xcodebuild clean
xcodebuild -alltargets clean
```

xcodebuildのヘルプには以下のように記載されています。

> Remove build products and intermediate files from the build root (SYMROOT).

## DerivedData（中間生成ファイル）の削除

後述するDerivedDataディレクトリ配下を削除します。

```bash
rm -rf ~/Library/Developer/Xcode/DerivedData/
```

**Tip:** 個人的に開発中にもっとも使うことの多いコマンドです。
~/.bashrcファイルにエイリアスを定義して`clean`だけで簡単に実行できるようにしています。

```bash:~/.bashrc
alias clean='rm -rf ~/Library/Developer/Xcode/DerivedData'
```

## Xcode Toolsによるキャッシュ削除

```bash
xcrun --kill-cache
# もしくは
xcrun -k
```

xcrunの[ドキュメント](https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/xcrun.1.html)には以下のように記載されています。
> Removes the cache. Causes all values to be re-cached.

## iOS DeviceSupportのキャッシュ削除

```bash
rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport/*/Symbols/System/Library/Caches    
```

## llvm/clangのキャッシュ削除

```bash
rm -rf "$(getconf DARWIN_USER_CACHE_DIR)/org.llvm.clang/ModuleCache"
rm -rf "$(getconf DARWIN_USER_CACHE_DIR)/org.llvm.clang.$(whoami)/ModuleCache"
```

**Tip:** `getconf DARWIN_USER_CACHE_DIR`コマンドにより、`/var`配下の動的なキャッシュ領域の場所を出力しています。

```bash:出力例
$ getconf DARWIN_USER_CACHE_DIR
/var/folders/62/nrp34pc96t560_hhml86hmwrr_q2rc/C/
```

# その他OSSライブラリのキャッシュ削除

## Homebrewのキャッシュ削除

```bash
rm -rf ~/Library/Caches/Homebrew
brew cleanup -s
rm -rf $(brew --cache)
```

## SwiftLintのキャッシュ削除

```bash
rm -rf ~/Library/Caches/SwiftLint
```

## CocoaPodsのキャッシュ削除

```bash
pod cache clean --all
```

## Carthageのキャッシュ削除

```bash
rm -rf ~/Library/Caches/org.carthage.CarthageKit 
rm -rf ~/Library/Caches/carthage
```

## Fastlaneのキャッシュ削除
spaceshipで利用されるクッキーファイルを削除します。

```bash
rm ~/.fastlane/spaceship/[your_email]/cookie
```


# 補足：DerivedDataとは
DerivedDataとはXcodeで生成される中間生成ファイルが保存されるディレクトリの名前です。デフォルトの設定では以下の場所に保存されます。

```
~/Library/Developer/Xcode/DerivedData/
```

ビルド時の中間生成ファイルとして以下のようなものが保存されます。

 - ビルド時に生成されるバイナリファイルやデータファイル
 - インデックス情報
 - ビルドやテストなどのログ
 - ソースコードのシンボル情報

以下の順に削除範囲が広くなっていきます。

 - Product > Cleanコマンド
（DerivedData内の現在のターゲットのBuildフォルダ配下の全てのファイルを削除）

 - Product > Clean Build Folderコマンド
（DerivedData内の各ターゲットのBuildフォルダを削除）

 - rm -rf ~/Library/Developer/Xcode/DerivedData/
（DerivedDataディレクトリ配下を全て削除）

# 参考
 - [Xcode で Derived Data を簡単に削除する方法](https://ez-net.jp/article/C9/qUKZiJ9B/vI-nxInyf79k/)
 - [This manual page is part of Xcode Tools version 5.0](https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/xcrun.1.html)
 - [homebrewのcacheを削除する](http://rochefort.hatenablog.com/entry/remove_homebrew_cache)
 - [How to clear Carthage cache?
](https://stackoverflow.com/questions/45504896/how-to-clear-carthage-cache)
 - [XCode 4 “Clean” vs. “Clean Build Folder”
Ask](https://stackoverflow.com/questions/8087065/xcode-4-clean-vs-clean-build-folder)
 - [What is xcrun cache directory?
](https://stackoverflow.com/questions/24482402/what-is-xcrun-cache-directory)
 - [Xcode users can free up space on your Mac](http://ajithrnayak.com/post/95441624221/xcode-users-can-free-up-space-on-your-mac)
 - [Can I delete data from iOS DeviceSupport?
](https://stackoverflow.com/questions/29930198/can-i-delete-data-from-ios-devicesupport)
 - [プレビューでフォントの表示がおかしい（1）--Snow Leopardでキャッシュ領域を探す](https://builder.japan.zdnet.com/os-admin/sp_snow-leopard-09/20401334/)

