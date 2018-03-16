# SwiftLintがmallocエラーで終了する場合の対処方法
# 概要
以下のように、Run Scriptでビルドする度に[SwiftLint](https://github.com/realm/SwiftLint)を実行していましたが、**mallocエラーで終了**するようになってしまったのでその対処方法をメモとして残します。

> swiftlint(1664,0x7000093d4000) malloc: *** error for object 0x7000093d1180: pointer being reallocated was not allocated

## Run Script

```bash
if which swiftlint >/dev/null; then
    swiftlint autocorrect
    swiftlint
else
    echo "SwiftLint does not exist, download from https://github.com/realm/SwiftLint"
fi
```

## 実行環境

```
MacOS: 10.13.3（17D47）
Xcode: 9.2 (9C40b)
SwiftLint: 0.25.0
```

# エラー内容詳細

> Done linting! Found 0 violations, 0 serious in 62 files.
swiftlint(1664,0x7000093d4000) malloc: *** error for object 0x7000093d1180: pointer being reallocated was not allocated
*** set a breakpoint in malloc_error_break to debug
/Users/[USER_NAME]/Library/Developer/Xcode/DerivedData/[PROJECT_NAME]-bshwakahiifqrnahsabchzdjyilu/Build/Intermediates.noindex/[PROJECT_NAME].build/Debug-iphonesimulator/MyLibrary.build/Script-163CEC159927D1238880A119.sh: line 7:  1664 Abort trap: 6           swiftlint

# 対処方法
SwiftLintのキャッシュファイルを削除することで正常にSwiftLintが実行できるようになりました。

```
$ rm -rf ~/Library/Caches/SwiftLint
```

# 参考
 - [malloc: *** error for object 0x700002a96090 #2032](https://github.com/realm/SwiftLint/issues/2032)
 - [0.25.0 makes path case sensitive - breaks with malloc error #2091](https://github.com/realm/SwiftLint/issues/2091)

