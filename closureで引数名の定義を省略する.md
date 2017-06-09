# closureで引数名の定義を省略する
 - Swiftのclosureでは、内部引数名を省略することができる
（外部引数名は元々指定できない、_で省略されている状態と同様）

 - 省略した引数は内部で\$0（第1引数）、\$1（第2引数）のようにアクセスする

```swift
// 内部引数名あり
let distance1 = { (a: Int, b: Int) -> Int in
    return abs(a - b)
}

// 内部引数名なし 
let distance2: (Int, Int) -> Int = {
    return abs($0 - $1)
}

distance1(2, 3) //1
distance2(2, 3) //1
```

内部引数名を省略し、型推論ができない場合はコンパイルエラーとなる

```swift
let plus = {
    return $0 + $1
}

plus(2, 3) //コンパイルエラー
```

（応用例）mapやfilterメソッド

```swift
// 3の倍数
let array = [1,2,3,4,5,6,7,8,9,10]
let newArray = array.filter { $0 % 3 == 0 }
newArray // [3,6,9]

// 120円以上の果物の名前（$0.0はkey、$0.1はvalueを示す）
let price = ["りんご":100, "ばなな":150, "みかん":200]
let fruits = price.filter { $0.1 > 120 }.map { $0.0 }
fruits // ["ばなな","みかん"]
```


