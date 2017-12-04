# Swift 4で@objcに関するwarningが出たときの対処
# warningの内容
Swift3プロジェクトをSwift4へマイグレーションさせた際に、以下のようなwarningが出る場合があります。

![image.png](https://qiita-image-store.s3.amazonaws.com/0/113553/886130cc-7b8a-803c-5f2c-923505dbc370.png)

> The use of Swift 3 @objc inference in Swift 4 mode is deprecated. Please address deprecated @objc inference warnings, test your code with “Use of deprecated Swift 3 @objc inference” logging enabled, and then disable inference by changing the "Swift 3 @objc Inference" build setting to "Default" for the "ターゲット名" target.

# warningの説明

まず、Swift４の`@objc`についてはこちらの記事で説明しています。
[Qiita | attributeまとめ[Swift4対応]](https://qiita.com/shtnkgm/items/a793f26445f2b8390bee)

Swift3では`@objc`が明示的に付与されてない定義にも`@objc`が暗黙的に推論され、付与されていました。Swift4では**Swift3での`@objc`推論が非推奨となったため、設定を見直したほうが良い**という警告です。この警告がでている際は、Swift3の`@objc`互換モードでビルドされるため、非推奨の`@objc`推論は有効になっています。

# 対応方法
TargetのBuild Settings設定の中に、`Swift3 @objc Infence`という項目があるので、これを**Defaultに変更**します。

| `Swift3 @objc Infence`の設定値 | 説明 | 
|:------------|:--------|
|Default|Swift4でのデフォルト値（`@objc`推論が無効）|
|On|Swift3での`@objc`推論を有効にする（非推奨）|
|Off|Swift3での`@objc`推論を無効にする|
（DefaultとOffは何が違うのだろう...🤔）

![image.png](https://qiita-image-store.s3.amazonaws.com/0/113553/79387676-843d-0686-cebb-375fef941bd8.png)

なお、`@objc`推論が利用されているエントリポイントをログ出力により調べる場合には、以下の記事が参考となります。
[The use of Swift 3 @objc inference in Swift 4 mode is deprecated?](https://stackoverflow.com/questions/44379348/the-use-of-swift-3-objc-inference-in-swift-4-mode-is-deprecated)

> SWIFT_DEBUG_IMPLICIT_OBJC_ENTRYPOINT environmental variable to values from 1 to 3 to see the usages of the Objective-C entry points in the logs.



