# 自作ライブラリのpod updateの時間を短縮する
Objective-Cの自作ライブラリをBitbucket/Cocoapodsで管理していたのですが、
ライブラリ更新時のpod updateに5〜10分くらいかかるので、短縮方法を調べました。

# なぜ遅いか
途中ログを出力するように、pod update --verboseを実行したら、
どうもそれぞれのライブラリのダウンロードに時間がかかっているっぽい。
どうやら何でもかんでもgit addして不要なファイルまでコミットしてた様。

# 対応方法
 不要なファイルは**.gitignoreファイルで指定**してあげるといいらしい。
 （git初心者すぎて名前ぐらいしか聞いたことなかった。。。）
しかもXcode用など、IDEに応じてテンプレがいろいろあるみたい。
今回はたまたま見つけた**gemignore**を使います。

# .gitignoreをファインダー上で表示できるようにする
すでにファインダー上で表示できてる場合は不要。

```
defaults write com.apple.finder AppleShowAllFiles true
killall Finder
```
# gemignoreをインストール
gemignoreでObjective-C用のいい感じのテンプレートを作成するので、インストールする。
インストール先（/usr/local/bin/）を指定しないとパーミッションがないと怒られた。

```
sudo gem install gemignore -n /usr/local/bin/
```

# .gitignoreファイルをテンプレートから作成
Objective-C用のテンプレートを使います。

```
touch .gitignore
gemignore a Objective-C
```

# 無視したいファイルをリポジトリから削除
.gitignoreに該当するファイルをまとめて削除

```
git rm --cached `git ls-files --full-name -i --exclude-from=.gitignore`
```

Argument list too longと出る場合は、以下コマンドをたたく。

```
git ls-files --full-name -i --exclude-from=.gitignore | xargs git rm --cached
```

# 容量削除版をコミット

```
git add .
git commit -m "不要なファイルを削除"
git push origin master
```

#結果
**だいぶ早くなりました。**
1ライブラリにつき数秒〜数十秒でおわる。

# 参考
 - [XcodeでiOSアプリ開発をする時の.gitignore](http://qiita.com/ikuwow/items/4fae81a099bf82f44749)
 - [Finderで隠しファイル・フォルダを表示 - Mac](http://pc-karuma.net/mac-finder-show-all-files/)
 - [いい感じの.gitignoreファイルをらくらく作成する](http://qiita.com/yuuAn/items/b1d1df2e810fd6b92574)
 - [あとからまとめて.gitignoreする方法](http://qiita.com/yuuAn/items/b1d1df2e810fd6b92574)
 - [Git rm をしようとすると「Argument list too long」と出る時の対処法](http://qiita.com/SShayashi/items/1fef1bb11439891a5e2c)

