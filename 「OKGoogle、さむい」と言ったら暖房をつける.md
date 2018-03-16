# 「OK Google、さむい」と言ったら暖房をつける
# 実現したいこと
今年もあと残りわずか、昼でもとても冷え込みますね。Google Homeでエアコンの暖房を付けたい！

「OK Google、さむい」
→**「では、暖房をつけますね」**

`イメージ図`
<img src="https://qiita-image-store.s3.amazonaws.com/0/113553/4d6ce74a-1189-f80f-dede-e14694fba64e.png" width=70%>

# 実現方法
先に概要図を記載すると以下のようになります。

`概要図`
<img src="https://qiita-image-store.s3.amazonaws.com/0/113553/e7d92e66-0c2c-8d87-760f-16903cc42036.png" width=80%>

## エアコンをつけるため、IRKitを利用
自宅にあるエアコンはスマートエアコンでもなんでもない普通のエアコンなので、普段は**赤外線**リモコンで操作します。赤外線のインタフェースに対応するため、**[IRKit](http://getirkit.com/)**を採用しました。
IRKitはHTTPサーバーを内蔵しており、**HTTPのPOSTリクエスト**を受け付けることができます。

`IRKit`
![68747470733a2f2f71696974612d696d6167652d73746f72652e73332e616d617a6f6e6177732e636f6d2f302f3131333535332f31643135333635662d396561322d306537642d643339652d6335323237326537633466392e706e67.png](https://qiita-image-store.s3.amazonaws.com/0/113553/cb6a1c94-e005-6ebf-115d-da710fd44daa.png)


> [IRKit｜opensource infrared remote controller](http://getirkit.com/)
IRKitは、WiFi機能の付いたオープンソースな赤外線リモコンデバイス。 家庭のエアコンやテレビ、ライトなど、赤外線で操作できる家電を、 WiFiをとおして、iPhoneやiPad,Androidスマートフォンなどから操作できるようにするものです。

## Google HomeとIRKitを連携させるためIFTTTを利用
Google Homeの音声認識結果を元に、IRKitへHTTPリクエストを投げるため、IFTTTを採用しました。Google HomeはIFTTTに対応しており、事前にアプレットを作成しておくことで、**音声認識結果からアプレットを実行**することができます。

<img src="https://qiita-image-store.s3.amazonaws.com/0/113553/579cff6c-0524-9f5b-a375-a06cad63c29c.png" width=20%>

# 設定手順

ここからはIRKitとIFTTTの設定手順を説明します。

## エアコンをつけるための赤外線信号を確認

IRKitの端末名を確認します。

```bash:IRKitの端末名を確認
$ dns-sd -B _irkit._tcp

# Browsing for _irkit._tcp
# DATE: ---Sun 24 Dec 2017---
# 16:16:48.357  ...STARTING...
# Timestamp     A/R    Flags  if Domain               Service Type         Instance Name
# 16:16:48.576  Add        2   4 local.               _irkit._tcp.         iRKit****
```

出力されたiRKit****の結果から、IPアドレスを確認します。

```bash:IRKitのIPアドレスを確認
$ dns-sd -G v4 IRKit****.local

# DATE: ---Sun 24 Dec 2017---
# 16:19:59.060  ...STARTING...
# Timestamp     A/R Flags if Hostname                               Address                                      TTL
# 16:19:59.195  Add     2  4 irkit806d.local.                       192.168.***.***                                  10
```

確認したIPアドレスを元に、ClientTokenを確認します。下記のコマンドを実行する度に出力されるClientTokenが変更され、**過去に出力したものは無効になる**ので注意してください。

```bash:ClientTokenを確認
$ curl "http://192.168.***.***/keys" -d '' -H "X-Requested-With: curl"
# {"clienttoken":"***ClientToken***"}
```

ClientTokenから、ClientKeyとDeviceIdを確認します。
このClientKeyとDeviceIdはIFTTTのアプレット設定時にも利用するのでコピペ等でメモしておきます。

```bash:ClientKeyとDeviceIdを確認
$ curl -d "clienttoken=***ClientToken***" "https://api.getirkit.com/1/keys"
# {"deviceid":"**DeviceId**","clientkey":"**ClientKey**"}
```

以下コマンドを入力すると、赤外線信号の待機状態になります。

```bash:赤外線信号を確認
$ curl "https://api.getirkit.com/1/messages?clientkey=**ClientKey**&clear=1"
# {"message":{"format":"raw","freq":38,"data":[6881,3341,968,761,968,2451,968,761,
# 〜中略〜,904]},"hostname":"IRKit***","deviceid":"**DeviceId**"}
```

IRKitに向けてリモコンを向けて暖房ボタンを押します。
そうすると、上記のようにJSON形式の赤外線信号の情報が取得できるのでこちらもコピペ等でメモしておきます。

## IFTTTにアプレットを作成

事前にIFTTTでアカウント準備をしておき、以下リンクから、IFTTTでアプレットを作成します。
https://ifttt.com/create/

### トリガーの設定

「this」の部分をクリックして、トリガーを作成していきます。
Google Homeの音声認識をトリガーにするので、**Google Assistant**を選択し、「Say a simple phrase」を選択します。

<img src="https://qiita-image-store.s3.amazonaws.com/0/113553/f5b3b0cb-afb8-3592-c55c-c0028ea7fdba.png" width=60%>

トリガーの設定をする画面になるので、各項目を記載します。
音声認識させる言葉は複数登録できます。
<img src="https://qiita-image-store.s3.amazonaws.com/0/113553/3ed0db15-7fac-bec6-c8be-8db3ee1c5951.png" width=60%>

|設定項目|設定内容|
|:----|:---|
|What do you want to say?|さむい|
|What's another way to say it? (optional)|暖かくして|
|And another way? (optional)|絶対暖房つけるマン|
|What do you want the Assistant to say in response?|では、暖房をつけますね|
|Language|Japanese|

※ここで設定した**「絶対暖房つけるマン」**が後々効果を発揮します

### アクションの設定

次に、「that」の部分をクリックしてアクションを設定していきます。
HTTPでPOSTするアクションを行うので**webhook**を選択し、**「Make a web request」**を選択します。

<img src="https://qiita-image-store.s3.amazonaws.com/0/113553/c3249d9b-cc71-2b96-9d3b-cdc159712234.png" width=40%>

アクションを設定する画面になるので、各項目を記載します。

<img src="https://qiita-image-store.s3.amazonaws.com/0/113553/64a4dcff-69e6-7d92-005f-d5693fe4310d.png" width=40%>

|設定項目|設定内容|
|:----|:---|
|URL|https://api.getirkit.com/1/messages|
|Method|POST|
|Content Type|application/x-www-form-urlencoded|
|Body|※下記に抜粋|

以下のように、Bodyの部分には、IRKitのClientKey/DeviceIdと取得した赤外線情報の**format部分**をコピペします。

```:Bodyに設定する内容
clientkey=**ClientKey**&deviceid=**DeviceId**&message={"format":"raw","freq":38,"data":[6881,3341,968,761,968,2451,968,761,
# 〜中略〜,904]}
```

## テストしてみる
ここで、テストしてみます。

**「OK Google、さむい」**
**「寒い季節は、お風呂がいちばんですね」**

...コレジャナイ！

じつはここまでの設定だけでは「OK Google、さむい」と話しかけても、既に予約済みの「さむい」というワードに反応してしまいます。
登録済みの予約語を回避するには、Google HomeのiOSアプリで、**ショートカットを設定**します。

1. Google Homeアプリを起動
2. 左上のメニューボタンをタップ
3. 「その他の設定」をタップ
4. 右下の「+」ボタンをタップ

ショートカットを以下のように設定し、「さむい」と話しかけても**「絶対暖房つけるマン」**と認識させるようにします。

`Google Home iOSアプリ`
<img src="https://qiita-image-store.s3.amazonaws.com/0/113553/991fac57-734d-ca9a-a04d-c0943fce3268.png" width=40%>

# 完成！
これで、Google Homeが暖房をつけてくれるようになりました。

「OK Google、さむい」
**「では、暖房をつけますね」**

今回はエアコンの操作をやってみましたが、赤外線リモコンに対応した家電であれば操作できるのでこんなこともできそうです。

<img src="https://qiita-image-store.s3.amazonaws.com/0/113553/6c4b2186-c7fb-7a90-a58e-2d134c9e965d.png" width=60%>


「OK Google、ねます」
**「おやすみなさい」**（音楽、シーリングライトを消す）

「OK Google、おはよう」
**「おはようございます」**（シーリングライト点灯、テレビのニュース番組をつける）

「OK Google、掃除して」
**「はい、部屋の掃除をします」**（ルンバをCLEANモードで起動）

映画「マイノリティ・リポート」ではトム・クルーズ演じる主人公が自宅に帰った際、**「I'm Home.」**の一言だけで部屋の電気がつき、音楽が流れ始めます。そんな未来にだいぶ近づいたような気がします。

# 参考にさせていただいた記事
実現方法は多少異なりますが、以下の記事を参考にさせて頂きました。

 - [GoogleHome→IFTTT→HomeAssistantで部屋の電気を付けてみる](https://qiita.com/azipinsyan/items/e5395e5b1dc7254bbbbd)
 - [IRKitを使ってターミナルで家電を操作する](https://qiita.com/kazuqqfp/items/079cdbd1e1997dedc512)
 - [Google Homeに話しかけてエアコンを操作してみる](https://qiita.com/miso_develop/items/204b2e16b1e58e52dc07)
 - [GoogleHome×IFTTT できることまとめてみた](https://qiita.com/valitoh/items/af06eabbd90740e694f0)
 - [Google Home ヘルプ｜ショートカット コマンドの作成と管理](https://support.google.com/googlehome/answer/7382893?hl=ja)
 - [Google home + IRKit で既存の家電を操作するアプリを作ってみた #dialogflow](https://qiita.com/flatfisher/items/8e2da20b054674a23021)


