# Swiftで画像を保存する時の実行時エラー
# 概要
Swift4環境で**UIImageを写真アプリのアルバムに保存するクラス**を作成しようとして少しハマったのでメモします。

UIImageを保存するにはUIImagePicker.hに以下のように定義されている`UIImageWriteToSavedPhotosAlbum`メソッドを利用します。

# UIKit側の仕様

```objc:UIImagePicker.hより抜粋
// Adds a photo to the saved photos album.  The optional completionSelector should have the form:
//  - (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
UIKIT_EXTERN void UIImageWriteToSavedPhotosAlbum(UIImage *image, __nullable id completionTarget, __nullable SEL completionSelector, void * __nullable contextInfo) __TVOS_PROHIBITED;
```

公式ドキュメントには以下のように記載されています。

```swift
func UIImageWriteToSavedPhotosAlbum(_ image: UIImage, 
                                  _ completionTarget: Any?, 
                                  _ completionSelector: Selector?, 
                                  _ contextInfo: UnsafeMutableRawPointer?)
```

引数に指定したimageの保存処理が完了した場合に引数のセレクタで指定したメソッドが呼ばれます。メソッドは次のシグネチャに従っている必要があります。

> The method selector of the completionTarget object to call. This optional method should conform to the following signature:

```objc:シグネチャ（Objective-Cでの記載のみ）
- (void)image:(UIImage *)image
    didFinishSavingWithError:(NSError *)error
                 contextInfo:(void *)contextInfo;
```

# 作成したクラス
以下のようなクラスを作成しました。

```swift:作成したクラス
final class PhotoSaver {
    private var completion: (_ error: Error?) -> Void = { _ in }

    func save(image: UIImage, completion: @escaping (_ error: Error?) -> Void) {
        self.completion = completion
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }

    @objc
    private func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        completion(error)
    }
}
```

PhotoSaverはUIImageWriteToSavedPhotosAlbumメソッドを扱いやすくするためのラッパークラスです。セレクタ指定でなく、**コールバック用のcompletionプロパティを持たせることにより、完了時の処理をクロージャーで記載**できます。

# ハマったポイント
実際に上記のコードを実行してみると、**SIGABRTでクラッシュ**してしまいます。コンソール上には以下のログが出力されます。

> class 'Sample.PhotoSaver' does not implement methodSignatureForSelector: -- trouble ahead
Unrecognized selector -[Sample.PhotoSaver methodSignatureForSelector:]

`Unrecognized selector`と出ているのでどうやらセレクタのシグネチャが正しくなくセレクタが動的に実行できていないようです。**はじめは作成した以下メソッドのシグネチャがおかしいのかと思っていました。**Web上の記事を探すと、メソッド名が違ったり、Error?でなくError!にっていたり、様々なシグネチャが見つかります。

```swift
    @objc
    private func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        completion(error)
    }
```

# 解説

もう一度よくエラーログを見てみます。

> Unrecognized selector -[Sample.PhotoSaver methodSignatureForSelector:]

作成したメソッドのシグネチャがおかしいのでなく、作成したクラスが**methodSignatureForSelectorを実行できない**というエラーです。

methodSignatureForSelectorのドキュメントを調べると、このメソッドは**NSObject**で実装されているメソッドのようです。
[Apple - methodSignatureForSelector](https://developer.apple.com/documentation/objectivec/nsobject/1571960-methodsignatureforselector)

つまり、methodSignatureForSelectorを実行できるようにするには、**NSObjectを継承してあげれば良い**ということになります。

```swift
final class PhotoSaver: NSObject {
    private var completion: (_ error: Error?) -> Void = { _ in }

    func save(image: UIImage, completion: @escaping (_ error: Error?) -> Void) {
        self.completion = completion
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }

    @objc
    private func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        completion(error)
    }
}
```

これで正常に完了時の処理が実行されるようになります。

