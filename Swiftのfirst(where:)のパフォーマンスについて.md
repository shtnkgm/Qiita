# Swiftのfirst(where:)のパフォーマンスについて
Array操作におけるfirst(where:)のパフォーマンスについてです。
Arrayを操作して、条件に合致する一番最初の要素を取得したいとします。

# 例題
例題として以下のようなArrayの**最初に出現する2**を取得することを考えます。

1, **2**, 3, 1, 2, 3, 1, 2, 3, ...

## filterとfirstを使う

単純に記述すると以下のようなコードになるのではないでしょうか。

```swift:filterとfirst
// 0, 1, 2, 0, 1, 2, ...と繰り返すArray
let array = (0..<100000).map { $0 % 3 }

// filterとfirst
let result = array.filter { $0 == 2 }.first!
```

上記のコードは問題なく動作しますが、**実際は10万回Arrayの各要素をチェックしている**ため、パフォーマンスの悪いコードとなります。

## first(where:)を使う

この場合、`first(where:)`を利用するとパフォーマンスが改善されます。`first(where:)`を利用した場合、**条件に一致する最初の要素を取得した後は、それ以降の要素をチェックしません**。

```swift:first(where:)
// 0, 1, 2, 0, 1, 2, ...と繰り返すArray
let array = (0..<100000).map { $0 % 3 }

// first(where:)
let result = array.first(where: { $0 == 2 })!
```

## lazyを使う

また遅延評価を行う`lazy`プロパティを利用しても`first(where:)`と同様のパフォーマンスが得られます。

```swift:lazy
// 0, 1, 2, 0, 1, 2, ...と繰り返すArray
let array = (0..<100000).map { $0 % 3 }

// lazy
let result = array.lazy.filter { $0 == 2 }.first!
```

# まとめ

 - filterとfirstの場合はArrayの全要素を評価するため、パフォーマンスに注意が必要
 - first(where:)もしくはlazyを利用すると良い







