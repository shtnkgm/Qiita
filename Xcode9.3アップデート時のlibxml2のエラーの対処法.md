# Xcode9.3アップデート時のlibxml2のエラーの対処法
2018/3/29にリリースされたXcode9.3（9E145）でアップデートした際にエラーが発生してビルドできなくなったのでその対処法のメモです。

# エラー内容
Objective-CコードのXMLパース処理で以下のエラーが発生していました。

![image.png](https://qiita-image-store.s3.amazonaws.com/0/113553/dadeb531-9e12-406f-0c8c-9e9d50fb7eb3.png)

> Use of undeclared identifier 'XML_SAX2_MAGIC'
> Definition of '_xmlSAXHandler' must be imported from module 'libxml2.parser' before it is required

# 対処方法
以下のようにlibxmlの必要なファイルをインポートするとビルドできるようになります。

```objc
#import <libxml/parser.h>
```

