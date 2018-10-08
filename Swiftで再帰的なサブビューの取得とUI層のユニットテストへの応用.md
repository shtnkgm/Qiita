# Swiftで再帰的なサブビューの取得とUI層のユニットテストへの応用
# 概要
本記事では以下の内容を説明します。

 - 特定のUIViewの持つサブビューを再帰的に取得する
    （サブビューのサブビューなど子階層全てのサブビューを取得する）

 - 再帰的なサブビューをユニットテストへ応用する
   - UIViewの特定サブクラスのビューを取得
   - 指定したテキストのUILabelを取得
   - 指定したタイトルのUIButtonを取得
   - 指定した画像を持つUIImageViewを取得

※ソースコードはSwift4.2で記述します。

# 再帰的なサブビューの取得方法
以下の**recursiveSubviews**プロパティをUIViewのExtensionとして実装します。
subviewsのsubviewsを再帰的に取得するため、実装自体も再帰的にrecursiveSubviewsを実行しています。

```swift:recursiveSubviewsをUIViewのExtensionとして実装する
extension UIView {
    var recursiveSubviews: [UIView] {
        return subviews + subviews.flatMap { $0.recursiveSubviews }
    }
}
```

recursiveSubviewsの実装が正しいことは以下のテストにより検証できます。

```swift:recursiveSubviewsをユニットテストで検証する
class UIView_Tests: XCTestCase {
    func test_recursiveSubviews_subviewsが再帰的に取得できること() {
        let view = UIView()
        let view1_1 = UIView()
        let view1_2 = UIView()
        let view1_1_1 = UIView()
        let view1_1_2 = UIView()
        let view1_1_1_1 = UIView()
        let view1_1_1_2 = UIView()

        view.addSubview(view1_1)
        view.addSubview(view1_2)
        view1_1.addSubview(view1_1_1)
        view1_1.addSubview(view1_1_2)
        view1_1_1.addSubview(view1_1_1_1)
        view1_1_1.addSubview(view1_1_1_2)

        XCTAssertTrue(view.recursiveSubviews.contains(view1_1))
        XCTAssertTrue(view.recursiveSubviews.contains(view1_2))
        XCTAssertTrue(view.recursiveSubviews.contains(view1_1_1))
        XCTAssertTrue(view.recursiveSubviews.contains(view1_1_2))
        XCTAssertTrue(view.recursiveSubviews.contains(view1_1_1_1))
        XCTAssertTrue(view.recursiveSubviews.contains(view1_1_1_2))
        
        XCTAssertEqual(view.recursiveSubviews.count, 6)
    }
}
```

# ユニットテストへの応用

recursiveSubviewsの実装により、特定のUIViewの持つサブビューを再帰的に取得できるようになりました。これをUI層のユニットテストに応用します。

以下の応用例のようにViewプロパティを直接指定せず、サブビューから間接的に取得することで、**Viewの階層やViewプロパティのアクセスレベルに依存しない**ユニットテストが記述可能です。

Viewプロパティが間接的に取得できれば正しく表示されていることやタップ時の挙動など、UI層のテストに利用できます。

## UIViewの特定サブクラスのビューを取得する

UIViewをさらに以下のように**findViews**関数を拡張することで再帰的なサブビュー内からUIViewの特定サブクラスのビューを取得することができます。型パラメータのTは**UIViewのサブクラス**です。この関数は再帰的なサブビュー全てに対してcompactMapでT型でキャストできるもののみ返します。

```swift
extension UIView {
    func findViews<T: UIView>(subclassOf: T.Type) -> [T] {
        return recursiveSubviews.compactMap { $0 as? T }
    }
}
```

ここで、引数のsubclassOfは利用していませんが、利用時にTの型を明示するために引数を記述しています。

## 指定したテキストに一致するUILabelを取得する

UIViewをさらに以下のように**findLabels**関数を拡張することで再帰的なサブビュー内から指定したテキストに一致するUILabelを取得することができます。

```swift
extension UIView {
    func findLabels(with text: String) -> [UILabel] {
        return findViews(subclassOf: UILabel.self).filter { $0.text == text }
    }
}
```

## 指定したタイトルに一致するUIButtonを取得する

UIViewをさらに以下のように**findButtons**関数を拡張することで再帰的なサブビュー内から指定したタイトルに一致するUIButtonを取得することができます。

```swift
extension UIView {
    func findButtons(with title: String) -> [UIButton] {
        return findViews(subclassOf: UIButton.self).filter { $0.titleLabel?.text == title }
    }
}
```

## 指定した画像を持つUIImageViewを取得する

UIViewをさらに以下のように**findImageViews**関数を拡張することで再帰的なサブビュー内から指定した画像を持つUIImageViewを取得することができます。

```swift
extension UIView {
    func findImageViews(with image: UIImage) -> [UIImageView] {
        return findViews(subclassOf: UIImageView.self).filter { $0.image == image }
    }
}
```

