# pythonから簡単にtwitterに投稿する
## はじめに
pythonからtwitterへの自動投稿をしたかったので、
twitterAPIとAPI連携ライブラリを利用した投稿方法を調べました。
pythonは3.x系を利用しています。

## APIキーとアクセストークンの取得

以下のアプリ開発者向けのサイトでアプリの新規登録をします。
[Twitter Application Management](https://apps.twitter.com/)

必要なキーとアクセストークンを取得し、メモします。
 - Consumer Key (API Key)
 - Consumer Secret (API Secret)
 - Access Token
 - Access Token Secret

## ライブラリのインストール

python向けのtwitterAPI連携ライブラリがあります。今回はシンプルな以下のライブラリを利用しました。
[sixohsix/twitter](https://github.com/sixohsix/twitter)

``` sh

# pipのインストール（pipがない場合）
easy_install pip

# pipを利用してライブラリをインストール
pip install twitter

```

## pythonでの投稿プログラムサンプル

``` python:twitter_post_sample.py
#coding: UTF-8

import twitter

# 取得したキーとアクセストークンを設定する
auth = twitter.OAuth(consumer_key="XXX",
                     consumer_secret="XXX",
                     token="XXX",
                     token_secret="XXX")

t = twitter.Twitter(auth=auth)

# twitterへメッセージを投稿する 
t.statuses.update(status="pythonからtwitterへの投稿テストです！")

```

