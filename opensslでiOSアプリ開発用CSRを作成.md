# opensslでiOSアプリ開発用CSRを作成
iOSアプリ開発時に開発/配布用証明書を作成する際に必要となる、証明書署名要求(CSR)を作成する方法です。

 - macのキーチェーンアクセスを利用せずに、コマンドラインでopensslを用います
 - opensslがインストールされている環境であればWindows/Linuxでも作成が可能です

# 秘密鍵の作成

```
# RSA暗号（鍵長2048ビット）を用いて秘密鍵を作成
openssl genrsa -out private.key 2048
```
 - 出力ファイル名はprivate.key（任意）としています。

# CSRの作成

```
# 作成した秘密鍵をもとにCSRを作成
openssl req -new -key private.key -out CertificateSigningRequest.certSigningRequest -subj "/emailAddress=[メールアドレス], CN=[コモンネーム], C=JP"
```
 - メールアドレスは任意の値です。（デベロッパー登録の有無等は無関係なはず）
 - コモンネームは任意の値です。（キーチェーンアクセスに秘密鍵を登録した際にコモンネームが表示されます。）
 - C=Country（国名）はJP（日本）としています。


# 参考
 -  [Adobe Flash Platform-証明書署名要求の生成](http://help.adobe.com/ja_JP/as3/iphone/WS144092a96ffef7cc-371badff126abc17b1f-8000.html)
 - [SSL証明書 秘密鍵(private-key)と証明書(certificate)がペアとなっている確認](http://qiita.com/magnet-ii/items/86204801d5f87e2da2fb)
 - [プライベート証明書作成](http://qiita.com/saito400/items/f73ee897ab142a428167)
 - [OpenSSL で証明書確認とか設定とか](http://qiita.com/a_yasui/items/2e81b0fe77e1a62f2272)

