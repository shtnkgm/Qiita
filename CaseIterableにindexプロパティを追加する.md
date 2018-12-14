# CaseIterableにindexプロパティを追加する
CaseIterableを拡張し、indexプロパティを追加する実装です。

### 実装コード
```swift
extension CaseIterable where Self: Equatable {
    var index: Int {
        guard let index = Self.allCases.firstIndex(of: self) as? Int else { fatalError() }
        return index
    }
}
```

### 利用例

```swift
enum Season: CaseIterable {
    case spring
    case summer
    case fall
    case winter
}

let season: Season = .fall
print(season.index) // 2
```

