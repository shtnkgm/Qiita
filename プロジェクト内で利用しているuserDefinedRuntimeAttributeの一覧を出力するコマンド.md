# プロジェクト内で利用しているuserDefinedRuntimeAttributeの一覧を出力するコマンド
## 概要
Xcodeプロジェクト内で利用しているuserDefinedRuntimeAttributeの一覧を取得する方法です。

![スクリーンショット 2017-05-11 23.04.31.png](https://qiita-image-store.s3.amazonaws.com/0/113553/f18200a0-01c3-c54e-2292-1206d4b21f42.png)

## コマンド

以下のコマンドをコピペしてターミナルで実行することで取得できます。

```bash:プロジェクトのディレクトリで実行
$ find . -name "*.xib" -o -name "*.storyboard" \
| xargs grep "<userDefinedRuntimeAttribute type" \
| grep "keyPath"  \
| sed -e "s/.*keyPath=\"//g" \
| sed -e "s/\".*>//g" \
| sort \
| uniq
```
## 実行結果(例)
userDefinedRuntimeAttributeの一覧がソートされ、出力されます。

```bash:
borderColor
borderWidth
bottomBorderWidth
clipsToBounds
cornerRadius
〜略〜
```
## コマンド解説


```bash:実行フォルダ配下の拡張子がxibもしくはstoryboardのファイルを検索
$ find . -name "*.xib" -o -name "*.storyboard" \
```
```bash:userDefinedRuntimeAttributeタグを含む行を抽出
| xargs grep "<userDefinedRuntimeAttribute type" \
```
```bash:keyPath属性を含む行を抽出
| grep "keyPath"  \
```
```bash:keyPath属性の値のみを置換で抽出
| sed -e "s/.*keyPath=\"//g" \
| sed -e "s/\".*>//g" \
```
```bash:属性値をソート
| sort \
```
```bash:重複した行を削除
| uniq
```

