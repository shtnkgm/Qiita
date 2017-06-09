# 定期実行するwatchコマンドの使い方まとめ
watchコマンドを使うことで、指定したコマンドを定期的に実行することができます。
その使い方をまとめます。

### watchコマンドのインストール

``` sh
# Homebrewを導入していない場合はインストール
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# watchコマンドをインストール
$ brew install watch
```

### 基本的な使い方

``` sh
# COMMANDを2秒ごとに定期実行する
$ watch COMMAND
```

### オプション（一部抜粋）
実行環境によっては動作しないオプションもあるので注意。

``` sh
# 実行間隔を秒単位で変更する(-n, --interval)
$ watch -n 60 COMMAND

# 実行コマンドの結果がエラーとなった場合にビープ音を鳴らす  (-b, --beep)            
$ watch -b COMMAND

# 出力結果にカラー情報を付与する(-c, --color)
$ watch -c COMMAND

# 実行コマンドの結果に変化があった場合に変化点をハイライトする(-d, --differences)
$ watch -d COMMAND

# 実行コマンドの結果に変化があった場合に終了する(-g, --chgexit)
$ watch -g COMMAND

# 実行コマンドの結果がエラーとなった場合に終了する（-e, --errexit）
$ watch -e COMMAND

# 実行結果のヘッダーを非表示にする（-t, --no-title ）
$ watch -t COMMAND
```



