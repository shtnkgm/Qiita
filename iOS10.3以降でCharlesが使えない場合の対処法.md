# iOS10.3以降でCharlesが使えない場合の対処法
iOS10.3以降でCharlesを使ってSSL通信内容をデバッグ確認しようとしましたが、
以前はうまく使えていたのに今回はキャプチャできずハマったのでメモします。

# 事象
以下のエラーが表示され、SSL通信が確認できない

```
SSLHandshake: Received fatal alert: certificate_unknown
```
<img width="834" alt="スクリーンショット 2017-04-29 4.47.33.png" src="https://qiita-image-store.s3.amazonaws.com/0/113553/63050c71-2f4e-3087-a92e-4bd0c29bbbb5.png">

# 原因
**iOS10.3からルート証明書の信頼をする設定が必要になった**ため。

# 設定方法
**設定アプリ > 一般 > 情報 > 証明書信頼設定**　からCharlesのルート証明書をオンにする。
![IMG_0063.png](https://qiita-image-store.s3.amazonaws.com/0/113553/1609d981-ec57-033c-4da1-43acbdee5bf4.png)
ダイアログが表示されるので、「続ける」をタップ。
![IMG_0064.png](https://qiita-image-store.s3.amazonaws.com/0/113553/d04e1392-bf87-3af7-5d28-340bd73ebc62.png)

# その他チェックリスト
上記の証明書の信頼設定以外での確認項目です。
基本的な設定方法はこちらの公式サイトから確認できます。
https://www.charlesproxy.com/

 - **PCとiOS端末が同じネットワークに接続しているか**
（iOS端末が4GでPCが社内Wifiになっていないか、VPN環境でないか）

 - **iOS端末のネットワーク設定で、HTTPプロキシ設定をしているか**
（PCのIPアドレスとCharlesで設定したポート番号を指定）

 - **iOS端末にCharlesのルート証明書をインストールしているか**
 http://www.charlesproxy.com/getssl

 - **Charlesの設定でEnable SSL Proxingにチェックを入れているか**
（Proxy > SSL Proxings Settings）

 - **Charlesの設定でSSLプロキシを有効にするホスト名を追加しているか**
（Proxy > SSL Proxings Settings、addから*を指定）

