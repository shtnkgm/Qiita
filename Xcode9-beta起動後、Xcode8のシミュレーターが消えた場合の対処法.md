# Xcode9-beta起動後、Xcode8のシミュレーターが消えた場合の対処法
Xcode9-betaをインストールして起動後、共存させていたXcode8のシミュレーターが消え、デバッグできずハマったのでメモします。

# 事象

Xcode9-betaを起動後、Xcode8を起動すると、シミュレーターが全て表示されくなり、シミュレーターのでのデバッグができない状態となる。

<img width="302" alt="スクリーンショット 2017-06-15 23.18.45.png" src="https://qiita-image-store.s3.amazonaws.com/0/113553/5a9eda29-4183-e224-6d15-e3b8a6c3a197.png">

<img width="279" alt="スクリーンショット 2017-06-15 23.18.53.png" src="https://qiita-image-store.s3.amazonaws.com/0/113553/a59bcc0b-e040-7056-66cc-435ee07325a6.png">

# 対処方法

(1) Xcode、シミュレーターアプリをすべて終了する。
(2) 手順(1)をやっても直らない場合は、ターミナルアプリを起動し、以下のコマンドを入力する。

```bash
# Xcodeのビルド中間生成ファイルを全て削除する
$ rm -rf ~/Library/Developer/Xcode/DerivedData/*

# Xcode8のDeveloperディレクトリを再指定する。パスは適宜変更してください。
# （自分の場合はXcode8をXcode8.appに名称変更していたため、以下のパスでした）
$ sudo xcode-select --switch /Applications/Xcode8.app/Contents/Developer
```

(3) Xcode8を起動

シミュレーターが正常に表示され、選択できるようになります。
<img width="269" alt="スクリーンショット 2017-06-15 23.35.23.png" src="https://qiita-image-store.s3.amazonaws.com/0/113553/2918a718-013a-6dfd-c2b5-bfd7a32f26fa.png">


