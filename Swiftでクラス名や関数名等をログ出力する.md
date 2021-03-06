# Swiftでクラス名や関数名等をログ出力する
## 概要
リテラル等を利用して、デバッグ時にクラス名や関数名等をログ出力する方法をまとめます。
(Swift3)

## NSStringFromClassを利用する

#### プロジェクト名
```swift
// 出力例： SampleProject
print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[0])
```

#### クラス名    
```swift
// 出力例： ViewController
print(NSStringFromClass(type(of:self)).components(separatedBy: ".")[1])

// こんな書き方もあります
print(String(describing: self))
```        

## リテラル表現を利用する

#### ファイルパス
```swift
// 出力例： /Users/[username]/Desktop/Sample/Sample/ViewController.swift
print(#file)
```

#### 関数名        
```swift
// 出力例： viewDidLoad()
print(#function)
```
        
#### ファイル内の行番号
```swift
// 出力例：　34
print(#line)
```
        
#### ファイル内の列番号
```swift
// 出力例： 15
print(#column)
```

参考：[The Swift Programming Language (Swift 4) / Literal Expression](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Expressions.html)

