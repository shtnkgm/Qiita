# 無限再帰呼び出しでEXC_BAD_ACCESS
Swiftで再帰呼び出しをし続けると、**EXC_BAD_ACCESS**でプログラムが強制終了します。

```swift:サンプルコード
import UIKit

class ViewController: UIViewController {

    /// メソッドが呼ばれた回数
    var numberOfCalls: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recursiveCall()
    }

    /// 再帰呼び出しを行うメソッド
    func recursiveCall() {
        numberOfCalls += 1
        print(numberOfCalls)
        recursiveCall()
    }
}
```

シミュレータで実行した場合には**約40000回**程度、実機のiPhone7で実行した場合には**約4000回**程度の再帰呼び出しでプログラムが強制終了しました。CPU/メモリに負荷を与える処理のため、実行環境によって最大呼び出し回数が変化しそうです。

オーバーライドしたメソッドでsuperのメソッドを実行するところをselfのメソッドを呼び出してしまった場合や、コンピューテッドプロパティ内で自身のプロパティを参照してしまった場合に意図せず無限再帰呼び出しとなってしまう場合もあります。

```swift:オーバーライドしたメソッド内で自身のメソッドを呼び出してしまった場合
override func viewDidLoad() {
    self.viewDidLoad()
}
```

```swift:コンピューテッドプロパティ内で自身のプロパティを参照してしまった場合
var computedProperty: Int {
    let some = computedProperty + 1
    return some
}
```

なお、コンピューテッドプロパティ内で自身のプロパティを参照してしまった場合は以下のようにワーニングが表示されます。
`Attempting to access 'computedProperty' within its own getter`
![image.png](https://qiita-image-store.s3.amazonaws.com/0/113553/843190c8-25f5-6a8e-6032-3318e626a151.png)


