# pythonからslackに投稿する
pythonからslackに投稿するまでの手順をまとめます。
時間のかかる処理の完了通知や実行途中の情報（エラー等）を通知するのに便利です。

## おおまかな流れ
 - slackでIncoming Webhookの設定をする
 - pythonからIncoming WebhookのURLへpostする

## slackでIncoming Webhookの設定をする

[Incoming Webhookの設定ページ](https://my.slack.com/services/new/incoming-webhook/)へアクセスする
投稿先のチャンネルを選択して、「Add Incoming WebHooks Integration」をクリック

![スクリーンショット_2016-09-21_23_44_40.png](https://qiita-image-store.s3.amazonaws.com/0/113553/f29952c8-69dd-8bbc-f7dd-6614f5f18619.png)

Webhook URLをコピーする

![スクリーンショット_2016-09-21_23_47_46.png](https://qiita-image-store.s3.amazonaws.com/0/113553/5ed1d35a-7de2-9e76-a22b-0852974d492c.png)

「Save Settingsをクリック」

![スクリーンショット_2016-09-21_23_52_59.png](https://qiita-image-store.s3.amazonaws.com/0/113553/fe7b7cda-1fa4-d158-3109-ce6b745526ba.png)

## pythonからIncoming WebhookのURLへpostする

POSTを簡単に実装するため、slackwebをインストールする

``` sh
# pipがインストールされていない場合はインストール
$ easy_install pip

# slackwebをインストール
$ sudo pip install slackweb
```

``` python:postToSlack.py
#coding: UTF-8

import slackweb

slack = slackweb.Slack(url="コピーしたWebhookのURL")
slack.notify(text="pythonからslackさんへ")

```

pythonスクリプトを実行する

``` sh
$ python postToSlack.py
```

投稿結果を確認する

![スクリーンショット 2016-09-22 0.01.21.png](https://qiita-image-store.s3.amazonaws.com/0/113553/f13a99a9-3810-d73b-442b-4ea4532c00fe.png)


## 参考
 - [PythonでSlackに投稿する](http://qiita.com/polikeiji/items/f8fa08331bd4a12f66df])
 - [slack API - Incoming Webhooks](https://api.slack.com/incoming-webhooks)
 - [Slackにincoming webhook経由でpythonからメッセージをPOSTする](http://qiita.com/satoshi03/items/14495bf431b1932cb90b)

