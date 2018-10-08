# よく使うcurlコマンドのオプションまとめ（13個）
個人的によく使うcurlコマンドのオプションをまとめました


#### 認証情報の付与
``` sh
# basic認証のかかったサイトにアクセス（-uもしくは--user）
$ curl -user USER_ID:PASSWORD http://www.example.com/

# NTLM認証もしくはDigest認証のかかったサイトにアクセス（--anyauth）
$ curl --anyauth --user USERID:PASSWORD http://www.example.com/
```

#### データの付与
``` sh
# フォームの送信（-dもしくは--data）
$ curl --data FORM_ID=VALUE http://www.example.com/

# フォームからファイルのアップロード（-Fもしくは--form）
$ curl --form FORM_ID=@example.png http://www.example.com/

# User-Agentを付与（-A）
$ curl -A "USER_AGENT" http://www.example.com

# クッキーの送信（-b）、保存（-c）
$ curl -b cookie.txt -c cookie.txt http://www.example.com/

# HTTPヘッダーの指定（-Hもしくは--head）
$ curl -head "KEY: VALUE" http://www.example.com/
```

#### 動作の指定

``` sh
# HTTPメソッドの指定（-X）
$ curl -X PUT http://www.example.com/

# SSLのエラーを無視して処理を継続（-k）
# （サーバー側証明書が不正、クライアント側のルート証明書が不正など）
$ curl -k http://www.example.com/

# リダイレクトさせる（-L）
$ curl -L http://www.example.com/
```
#### 情報確認（デバッグ系）

``` sh
# HTTPレスポンスヘッダーの取得（-I）
$ curl -I http://www.example.com/

# 詳細をログ出力（-vもしくは--verbose）
$ curl -v http://www.example.com/

# 進捗やエラーを表示しない（-sもしくは--silent）
# （curlの結果をパイプで次のコマンドに渡す際に、通信時間のデータなどが邪魔にならないようにする）
$ curl -s http://www.example.com/
```


#### 参考
 - [curlコマンドから HTTP POST する方法](http://qiita.com/letsspeak/items/8c7266742371699ab45e)
 - [Cocoaはやっぱり!
インターネットにアクセスしよう
番外編 : curlの使い方](http://sitearo.com/cocoa/0800_internet/curl/)
 - [curl(1) で POST する際の --data と --form の違いについて](http://d.hatena.ne.jp/a666666/20110427/1303838381)

