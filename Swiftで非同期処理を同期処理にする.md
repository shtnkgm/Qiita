# Swiftで非同期処理を同期処理にする
# 概要
Swiftで非同期処理を同期処理にするtipsです。
例えば画像処理を行うこんな**非同期処理を行うメソッドを同期処理で実行**できるようにします。

```swift
extension UIImage {
    // 非同期処理
    func processAsync(completion: @escaping (_ result: UIImage) -> Void) { }
    
    // 同期処理
    func processSync() -> UIImage { }
}
```

## 非同期処理によるコールバック地獄で可読性が悪くなる

メインスレッドをブロックしないように、別スレッドで処理を実行したりするのに非同期処理は有効です。しかし、複数の非同期処理を実行する場合、ネストが深くなるコールバック地獄になったりして可読性が悪くなります。

```swift
// コールバック地獄の例
image.processAsyncA { resultA in
    processAsyncB(resultA) { resultB in
        processAsyncC(resultB) { resultC in
            processAsyncD(resultC) { resultD in
                processAsyncE(resultD) { resultE in

                }     
            }           
        }
    } 
}

// 同期処理だったらよりシンプルに書ける
image.processSyncA()
    .processSyncB()
    .processSyncC()
    .processSyncD()
    .processSyncE()
```

# DispatchSemaphoreを利用して非同期処理の完了を待つ

[DispatchSemaphore](https://developer.apple.com/documentation/dispatch/dispatchsemaphore)は共有リソースを排他制御するための仕組み（セマフォ）を抽象化したクラスです。セマフォは**共有リソースの残り利用可能数**を値として持ちます。さらに`signal（）`で利用可能数を+1、`wait()`で-1します。つまり、`signal（）`は共有リソースの解放、`wait()`は共有リソースの利用を意味します。`wait()`の実行時にセマフォが0、つまり利用可能な共有リソースがない場合は共有リソースの解放（`signal（）`)の実行を待ちます。

 - [signal()](https://developer.apple.com/documentation/dispatch/dispatchsemaphore/1452919-signal) 
 - [wait()](https://developer.apple.com/documentation/dispatch/dispatchsemaphore/2016071-wait)

[DispatchSemaphore](https://developer.apple.com/documentation/dispatch/dispatchsemaphore)を利用し、非同期処理の実行完了を待つことで、以下のように非同期処理を同期的に実行することができます。

```swift
// 非同期処理
func processAsync(completion: @escaping (_ image: UIImage?) -> Void) { }

// 同期処理
func processSync() -> UIImage? {
    var result: UIImage?
    // セマフォを0で初期化
    let semaphore = DispatchSemaphore(value: 0)
    processAsync() { (image: UIImage?) in
        result = image
        // セマフォをインクリメント（+1）
        semaphore.signal()
    }
    // セマフォをデクリメント（-1）、ただしセマフォが0の場合はsignal()の実行を待つ
    semaphore.wait()
    return result
}
```

# 注意事項
非同期処理を同期処理にすることで、複数の処理が扱いやすくなりました。しかし、冒頭で説明したように重たい処理はメインスレッドをブロックしてしまうので、以下の例のように**複数の同期処理をまとめて非同期にサブスレッドで実行する**ようにします。

```swift
DispatchQueue(label: "hoge", qos: .default).async {
    let result = image.processSyncA().processSyncB().processSyncC()
    completion(result)
}
```

