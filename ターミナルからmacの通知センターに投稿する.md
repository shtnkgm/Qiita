# ターミナルからmacの通知センターに投稿する
ターミナルやシェルスクリプトで何か時間のかかる処理をする際に、完了時やエラー時の通知ができないかなあと思っていた所、[terminal-notifier](https://github.com/julienXX/terminal-notifier)が便利そうだったのでメモ。

## terminal-notifierについて
 - macOSのユーザー通知を送るためのコマンドラインツール
 - macOS 10.8以上で利用可能
 - https://github.com/julienXX/terminal-notifier

## terminal-notifierのインストール
homebrew経由で簡単にインストールできます。

```sh
$ brew install terminal-notifier
```

## 使い方
オプションで表示メッセージや通知音を指定します。
こちら以外にも、アイコン画像やURLも指定できるようです。

```sh
$ terminal-notifier -title "タイトル" -subtitle "サブタイトル" -message "メッセージ" -sound default
```

こんな風に通知されます。\\\ ティロリン！ //
![スクリーンショット 2016-10-23 23.10.47.png](https://qiita-image-store.s3.amazonaws.com/0/113553/deb1789b-077d-3497-f84c-a7713e2f166f.png)

デフォルトの音を変えても楽しいですね。

``` sh
# 例)Blow,Bottle,Frog,Funk,Glass,Hero,Morse,Ping,Pop,Purr,Sosumi,Tink
$ terminal-notifier -message "ポッ" -sound Pop
```



