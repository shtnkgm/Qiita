# UIKitのView表示ライフサイクルを理解する
UIKitにおけるViewの表示ライフサイクルを調べたのでまとめます。

 - いつ、どのようにViewが表示されるのか
 - Viewのframeはいつ決定するのか
 - ViewのConstraintはどのように変更され、反映されるのか

etc...

# UI実装時のよくある課題

 - なんかスクロールがカクカクする、引っかかる
 - AutoLayoutが効かない
 - Viewの表示位置がおかしい、表示されない
 - 画面表示までが遅い

このような課題は、Viewの表示ライフサイクルを理解せずに開発していることが原因かもしれません。

# よくあるUI実装でのデバッグ

**UI更新の処理をサブスレッドで実行していたため、反映されていなかった。**
⇒メインスレッドで実行するように変更する。
こちらはXcode9の新機能、Main Thread Checkerでワーニング表示できるようになるようです。
[Main Thread Checker | Apple Developer Documentation](https://developer.apple.com/documentation/code_diagnostics/main_thread_checker)

**何かよくわからないけど、layoutIfNeededを書いたら直る**

```swift
cell.contentView.frame.size.width = width
cell.contentView.setNeedsLayout()
cell.contentView.layoutIfNeeded()
```
# View表示のための大まかな流れ

1. Viewの読み込み
2. 制約の追加（AutoLayout）
3. 制約を元にViewのframeを計算（レイアウト）
4. frameの位置に描画（レンダリング）

# サンプルプロジェクトをつくって処理を追ってみる
試しに、以下のような3枚のビューを持つプロジェクトをつくって、表示処理をログ出力してみます。
<img width="200" alt="スクリーンショット 2017-06-12 3.30.34.png" src="https://qiita-image-store.s3.amazonaws.com/0/113553/bf849626-d97a-a292-c263-ab99e51f96cd.png">

サンプルプロジェクトはこちら
https://github.com/shtnkgm/ViewLifecycleSample

ビューは下から順に、以下のカスタムクラスを実装しています。

 - WhiteView （self.view）
 - RedView （WhiteViewのsubview）
 - BlueView （RedViewのsubview）

## ログの出力方法
以下のようにクラス名とメソッド名を各メソッド呼び出し時にログ出力します。
ログの出力方法についてはこちらに詳細を記載しています。
[クラス名や関数名等をログ出力する方法](http://qiita.com/shtnkgm/items/de9cf3d85ccd0cef0a81)

<img width="713" alt="スクリーンショット 2017-06-13 8.03.31.png" src="https://qiita-image-store.s3.amazonaws.com/0/113553/79d307e1-ec24-5ba8-a41c-9b6ada397e16.png">

## View表示までのログの出力結果
サンプルプロジェクトを実行し、起動からViewの表示までのログを表示すると以下のようになります。
<img width="286" alt="スクリーンショット 2017-06-12 4.42.01.png" src="https://qiita-image-store.s3.amazonaws.com/0/113553/46869d62-7472-d094-c6a6-aa1579bce5b7.png">

さっくりと、先ほど説明した大まかな流れになっていることが、各メソッド名から予想できます。
<img width="350" alt="スクリーンショット 2017-06-16 0.00.13.png" src="https://qiita-image-store.s3.amazonaws.com/0/113553/79665f22-96ac-35bf-58ad-0acde850f39c.png">

# 各メソッド名の説明
Viewの表示ライフサイクルにおける、各メソッドの説明を順にします。

## UIView編

### 制約の更新に関するメソッド

#### updateConstraints()
 - 制約の更新を実行 
 - 開発者が直接呼び出すのはNG

#### setNeedsUpdateConstraints() 
 - 制約更新の実行要否のフラグを立てる 
 - 計算実行タイミングはシステム任せ

#### updateConstraintsIfNeeded() 
 - 制約更新を即座に実行（更新フラグあれば）

### パフォーマンスの良い順
 - overrideしたupdateConstraints()内で制約更新   
（レイアウトエンジンのバッチ処理に含まれ、メインスレッドをブロックしない）
 - 制約更新後にsetNeedsUpdateConstraints()   
（エンジンがまとめて更新処理を実施）
 - 制約更新後にupdateConstraintsIfNeeded()   
（即時実行のため、バッチ処理に含まれない）

### レイアウトに関するメソッド

#### layoutSubviews() 
 - frameの更新を実行 
 - 開発者が直接呼び出すのはNG
 
#### setNeedsLayout() 
 - frame更新要否のフラグを立てる 
 - 計算実行タイミングはシステム任せ

#### layoutIfNeeded() 
 - frame更新を即座に実行（更新フラグあれば）

### パフォーマンスの良い順
 - overrideしたlayoutSubviews()内でframe更新  
 （レイアウトエンジンのバッチ処理に含まれ、メインスレッドをブロックしない）
 - frame更新後にsetNeedsLayout()   
（エンジンがまとめて更新処理を実施）
 - frame更新後にlayoutIfNeeded()  
 （即時実行のため、バッチ処理に含まれない）

### 描画に関するメソッド

#### draw()
 - 開発者が直接呼び出してはいけない
 - CoreGraphicsを使って画面に描画する

#### setNeedsDisplay() 
 - 描画更新の実行要否のフラグを立てる
 - 制約やレイアウト更新のように、 即時実行用のメソッドはなし

### ビュー階層と実行順序
以下の通り、制約とレイアウトの更新メソッドはビューの階層構造に関して実行順序が異なります。
<img width="500" alt="スクリーンショット 2017-06-16 0.13.06.png" src="https://qiita-image-store.s3.amazonaws.com/0/113553/aac92c94-3aa2-38db-4d3b-c86dd8b000e7.png">


## UIViewController編

#### loadView()
 - 管理するViewを読み込む（self.view）
 - StoryBoardで実装する場合はoverride不要
 - Viewの追加、制約の追加など、StoryBoardで行う操作をコードで実装するのに適する

<img width="813" alt="スクリーンショット 2017-06-12 5.01.33.png" src="https://qiita-image-store.s3.amazonaws.com/0/113553/7206fec3-4445-a9b5-30f8-0c537b72bc7f.png">

#### viewDidLoad()
 - loadView()が完了した際に呼ばれる
 - VCの表示サイクルで一度だけ呼ばれるため、 クラス内で利用するオブジェクトの初期化などに適する

#### viewWillAppear()
 - ビューが表示される直前に呼ばれる
 - 初回表示以外にもバックグラウンド復帰、タブ切り替えなど
 - まだビューが表示されていないため、計算コストの高い処理は避ける

<img width="710" alt="スクリーンショット 2017-06-12 5.02.29.png" src="https://qiita-image-store.s3.amazonaws.com/0/113553/2a73a0ce-128f-52ee-8d78-54274d9867da.png">

#### updateViewConstraints()
 - サブビューの制約更新後、self.viewの制約更新が必要な際に呼ばれる
 - self.viewのupdateConstraints()が呼ばれる
 - overrideでの利用用途はあまりないのかもしれません

#### viewWillLayoutSubviews()
 - ビューのレイアウトを開始する直前に呼ばれる （初期表示時や画面回転時など）
 - ビューのlayoutSubview()が実行される

#### viewDidLayoutSubviews()
 - ビューのレイアウトが完了した際に呼ばれる （複数回呼ばれるので、オブジェクトの初期化などには向かない）
 - self.view.frameはこのメソッドよりも前だと確定していない
 - viewDidLoad()などでself.view.frameを用いてレイアウトすると意図するレイアウトとならない可能性あり

#### viewDidAppear()
 - ビューが表示された直後に呼ばれる
 - viewWillAppear()同様、バックグラウンド復帰時やタブ切り替え時など複数回呼ばれる
 - 既にUI表示が完了しているので、UI表示に関係のない処理を実行するのに適する（ログ送信など）

## 制約を更新したらどうなる

サンプルプロジェクトの赤いビューと青いビューの制約を更新してみました。
<img width="406" alt="スクリーンショット 2017-06-16 0.23.39.png" src="https://qiita-image-store.s3.amazonaws.com/0/113553/68ceaf0c-73c4-9794-34b1-54f71a658aab.png">

関連する親ビューのsetNeedsLayoutが呼ばれることがわかります。
更新フラグが立つことで、layoutSubviews()が呼ばれます。（レイアウトエンジンの更新タイミング）

# UI実装におけるデバッグ例
今回の内容に関連して、UI実装におけるデバッグ例のQAをご紹介します。

## AutoLayoutでの アニメーションが動かない
 - frameでのアニメーションと違い、 ブロック外に更新処理を書く
 - アニメーションブロック内で、layoutIfNeeded()を実行することで、frameが決定します。

<img width="346" alt="スクリーンショット 2017-06-12 5.05.33.png" src="https://qiita-image-store.s3.amazonaws.com/0/113553/fa5b1748-6ec3-1be4-35d3-6377b25d8cac.png">

<img width="284" alt="スクリーンショット 2017-06-12 5.05.23.png" src="https://qiita-image-store.s3.amazonaws.com/0/113553/00a9f8be-9c11-7d28-d363-a13b3e54ed30.png">

## コードで制約を追加したら、 コンフリクトした
 - AutoResizingMask由来の 制約が混在している状態
<img width="985" alt="スクリーンショット 2017-06-12 5.59.16.png" src="https://qiita-image-store.s3.amazonaws.com/0/113553/b2d4da1b-ce3c-a0f1-5515-7d401e656f1b.png">

 - デフォルトで設定されるAutoresizingを AutoLayoutの制約に変換しない設定をします  
 - translatesAutoresizingMaskIntoConstraintsを無効化
 - <img width="417" alt="スクリーンショット 2017-06-12 5.06.24.png" src="https://qiita-image-store.s3.amazonaws.com/0/113553/3abea620-ace0-a81a-7083-13ff1f75fa10.png">

## UIScrollViewやUICollectionViewなどのスクロールがカクつく
 - scrollViewDidScroll()などでレイアウト更新を即時実行してないかチェック
 - ビューのレイアウト調整がメインスレッドをブロックしてしまい、スクロールのためのレイアウト調整が止まっている可能性あり
 - layoutSubviews()をoverrideすると良いかも



