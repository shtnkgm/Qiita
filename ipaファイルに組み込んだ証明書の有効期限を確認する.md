# ipaファイルに組み込んだ証明書の有効期限を確認する
## 概要
iOSアプリのipaファイルに組み込んだプロビジョニングプロファイル（証明書）の有効期限を確認する手順を記載します。

## 手順
1. ipaファイルの拡張子を.ipaから.zipに変更
2. .zipファイルを解凍する
3. Payloadフォルダを開く
4. Windowsの場合、"アプリ名.app"フォルダを開く  
MacOSの場合、"アプリ名.app"を右クリックし、"パッケージの内容を表示"をクリック
5. バイナリファイルを確認できるエディタ等で"embedded.mobileprovision"ファイルの内容を確認する  
`cat embedded.mobileprovision`でも可
6. 以下のように、"ExpirationDate"の部分に有効期限が記載されているので確認する

    ```xml:embedded.mobileprovision
	<key>ExpirationDate</key>
	<date>2017-12-17T15:11:36Z</date>
    ```




