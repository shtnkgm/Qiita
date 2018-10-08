# iOSアプリ開発用の.gitignoreの管理方法
# 概要
git管理したくないファイルは.gitignoreで管理しているかと思いますが、プロジェクトを作成するたびに生成するのは手間になります。

.gitignoreを自動生成し、さらにカスタマイズしたものをテンプレートとしてgistで管理する方法をまとめます。

1. giboで.gitignoreを自動生成
2. .gitignoreをカスタマイズ
3. .gitignoreをgistにアップロード
4. gistでrawデータのURLを取得
5. wgetでgistから.gitignoreをダウンロード

## giboで.gitignoreを自動生成
[gibo]((https://github.com/simonwhitaker/gibo))という.gitignoreを自動生成するツールを利用します。

```bash
# giboのインストール
brew install gibo

# iOSアプリ開発用の.gitignoreを生成
gibo dump Swift Xcode >> .gitignore
```

## .gitignoreをカスタマイズ
そのままでも十分ですが、自分用に.gitignoreをカスタマイズします。
カスタマイズが不要な場合は、giboだけで十分なのでこの後の手順は不要です。

## .gitignoreをgistにアップロード
カスタマイズした.gitignoreを[gist](https://gist.github.com/)にアップロードします。

自分の場合は以下gistにアップロードしました。
https://gist.github.com/shtnkgm/dfe0a0478a15de11ce93ca6f39223cd5

## gistでrawデータのURLを取得
gistでrawボタンをクリックすると、ファイルのrawデータにアクセスできるので、このURLからwgetで取得します。

<img src="https://qiita-image-store.s3.amazonaws.com/0/113553/770f0872-e0cc-6715-72c2-9fbbf945a8e1.png" width="500px">

ここで注意点としては、gistのrawデータのURLはハッシュ値で管理されており、gistを更新するとURLが変わります。ファイルを更新しても最新のgistを取得するよう、ハッシュ値は取り除いておくと良いです。

```bash
# ハッシュ値あり
https://gist.githubusercontent.com/[user_id]/[gist_id]/raw/[hash_id]/.gitignore
↓↓↓
# ハッシュ値なし（最新のgistを取得）
https://gist.githubusercontent.com/[user_id]/[gist_id]/raw/.gitignore
```

## wgetでgistから.gitignoreをダウンロード

```bash
# wgetで.gitignoreを取得する
wget https://gist.githubusercontent.com/[user_id]/[gist_id]/raw/.gitignore -O .gitignore

# 長いのでbitlyなどで短縮URLにしておくと使い勝手が良いです
wget https://bit.ly/shtnkgmgi2 -O .gitignore
```

# 参考
 - [rcmdnk's blog - GitHubのGistの古いraw urlが無効になっていたので対応してみた](https://rcmdnk.com/blog/2016/04/22/blog-octopress-github-ruby/)

