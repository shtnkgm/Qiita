# Generated Headerで定義が見つからないエラーの回避方法
割と限定的な条件で起こる問題ですが、いつか誰かの役に立つかもしれないので記事にしておきます。

## 問題
Generated Headerでモジュールがimportされているのに、クラスやプロトコルが見つからない旨のエラーが出る。

**Generated Headerとは**

 - SwiftコードのインタフェースをObjCに公開するためのファイル
 - ビルド時に自動的に生成される（クリーンしたら消えます）
 - デフォルトの命名では[プロジェクト名]-Swift.hとなっている

```objc:HogeProject-Swift.h
@import HogeModule;
```

```:エラー文言
Cannot find protocol declaration for 'HogeDelegate'
```

## 原因
Generated HeaderがObjective-C++（.mm）ファイルで読み込まれていると、Generated Headerに記載された`@import`は無効化されるようです。

Objective-C++（.mm）ファイルでSwiftコードを実行したい場合は、Generated Headerをインポートするための別クラス（別ファイル）を作成し、そのクラスを介してSwiftコードを実行すると回避できます。

## 学び
 - Objective-C++（.mm）ファイル　では直接Generated Headerをインポートしてはいけない
 - 別クラス（別ファイル）を作成し、そのクラスを介してSwiftコードを実行する

