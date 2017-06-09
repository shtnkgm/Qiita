# iOSのプロモコードをQRコードで読み取れるようにするサイトをつくってみた
iOSのプロモコードをQRコードで読み取れるようにするサイトを
つくってみたのでメモ。

# アウトプット
できたサイトがこちら
[Promo2QR / プロモーションコード簡単入力](https://shtnkgm.github.io/Promo2QR/)

![スクリーンショット 2017-04-02 0.37.57.png](https://qiita-image-store.s3.amazonaws.com/0/113553/f1a80f6f-e4f1-0ace-a08e-a2baacd1596c.png)


**BEFORE**
AppStore開いて、プロモコード入力の画面に移動して、ポチポチ入力して...
**AFTER**
QRコード読み取り⇒数タップで秒速インストール

# なぜ作ったか
 - iOSアプリの最終動作確認にプロモーションコードを使うことがあるが、　　
コードを間違えたり毎回入力するのが面倒だったから

 - JQueryのプチ勉強
 - マテリアルデザインのCSSフレームワークを使ってみたかった

# 技術的なメモ
 - [github pages](https://pages.github.com/)で公開しているので費用は0円
 - CSSフレームワークは[Material Design Lite](https://getmdl.io/)を利用、最低限おしゃれな感じにした
 - QRコードの生成は[Google Chart API](https://developers.google.com/chart/)を利用
 - プロモコードを読み取れるようにするにはリンクを以下の形式にする  
https://phobos.apple.com/WebObjects/MZFinance.woa/wa/freeProductCodeWizard?code=[プロモコード]

# 参考にしたサイト
 - [2016年新機能! GitHubのmasterブランチをWebページとして公開する手順](http://qiita.com/tonkotsuboy_com/items/f98667b89228b98bc096)
 - [マテリアルデザインをWEBで再現できるコンポーネント「Material Design Lite」を試してみる](https://creatorclip.info/2015/07/material-design-lite/)
 - [Google Chart APIを使ってQRコードを作る](http://www.atmarkit.co.jp/ait/articles/1602/26/news037.html)
 - [URL for redeeming Mac App Store promo codes](http://stackoverflow.com/questions/8623275/url-for-redeeming-mac-app-store-promo-codes)

# その他メモ
 - プロモーションコードの有効性チェックまでやりたかったが、実現方法が不明  
fastlaneのcodeサービスで昔はできてたが今はできなくなったっぽい
 - iPhoneでプロモコードのコピペが難なくデキる人はそんなに恩恵がないかも


 

