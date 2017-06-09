# ChromeブラウザのGoogle Analytics表示遅すぎ問題を解決
Chromeでブラウジングしている際、Google Analyticsなど、一部のGoogleサービスで表示が異常に遅く、その都度別ブラウザで開いていました。

ブラウザ設定を一部変更したら解決したのでメモ。

## 設定変更方法
1. 以下のURLをクリックする（もしくはブラウザのアドレスバーに入力）
[chrome://flags/#enable-quic](chrome://flags/#enable-quic)

2. 以下の項目を"無効"にする
![スクリーンショット 2016-10-24 0.02.53.png](https://qiita-image-store.s3.amazonaws.com/0/113553/edab7a97-6c90-3908-1b08-fca8ee29a9a0.png)

3. 画面下部の"今すぐ再起動"をクリックして、ブラウザを再起動する。
![スクリーンショット 2016-10-24 0.03.44.png](https://qiita-image-store.s3.amazonaws.com/0/113553/0dc5fcb0-33b1-8f39-2e5b-8fd533370fb4.png)

## 参考
[Chrome上のGoogleサービスの読み込みが遅すぎます。](https://productforums.google.com/forum/#!msg/chrome-ja/mLjFNOAfQTk/51jVyILvCgAJ)


