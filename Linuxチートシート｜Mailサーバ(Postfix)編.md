# Linuxチートシート｜Mailサーバ(Postfix)編
## メモ
 - PostfixはSendmail互換のメール転送エージェント

## チートシート

``` sh
# メール送信
$ mail MAILADDRESS

# Postfixサービスの起動/再起動/終了
$ systemctl start postfix
$ systemctl restart postfix
$ systemctl stop postfix

# Postfixサービスの自動起動の有効化/無効化
$ systemctl enable postfix
$ systemctl disable postfix

# Postfixの設定値を確認
$ postconf

# Postfixの設定値を確認（デフォルト設定からの変更分のみ）
$ postconf -n

# /etc/postfix/accessファイルをバイナリ化
$ postmap /etc/postfix/access

```

## 設定ファイル

``` bash
# Postfixの設定ファイル
/etc/postfix/main.cf

# アクセス制御
/etc/postfix/access

# ログ
/var/log/maillog

```

## 各種設定の参考
 - [Postfix設定パラメータ](http://www.postfix-jp.info/trans-2.3/jhtml/postconf.5.html)
 - [/etc/postfix/accessで迷惑メール対策](http://qiita.com/tukiyo3/items/902b3c859346f6c00168)

