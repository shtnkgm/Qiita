# Embedded FrameworkでCarthageライブラリを利用する際の注意点（CFBundleIdentifier Collision）
# 概要
Embedded Frameworkを組み込んだアプリをAppStoreの審査に提出しようとしたところ、アーカイブの検証の際に下記のエラーが表示され、つまづいたので記事にまとめます。

# エラー内容
> CFBundleIdentifier Collision. There is more than one bundle with the CFBundleIdentifier value <Carthageライブラリ名> under the iOS application <アプリ名>.

エラー文言によると、導入したCarthageライブラリのバンドルIDが複数同じものが存在し、衝突したようです。

![image.png](https://qiita-image-store.s3.amazonaws.com/0/113553/92f5a00d-e07f-3c41-dddc-51c090677870.png)

# アプリ構成
アプリの構成は下記のように、OSSライブラリに依存するEmbedded Frameworkを作成し、さらにそのFrameworkをアプリから利用していました。依存関係はCarthageによって解消しています。

```
Application
↓
Embedded Framework（Carthageで導入）
↓
OSS Libraries（Carthageで導入）
```

# 原因と対処方法
iOSアプリではFrameworkのネストが許されておらず、Frameworkがネストしている場合はAppStoreの審査に提出することができないようです。
今回のケースでは、Embedded FrameworkおよびApplicationの両方でBuild Phasesにてframeworkのcopyを行ってしまっていました。
![image.png](https://qiita-image-store.s3.amazonaws.com/0/113553/094a7863-4fa8-d85a-f4e5-2ac5833b7d3d.png)

copyをEmbedded Frameworkでは行わず、全てアプリケーション側でcopyすることで解決します。

# まとめ
 - iOSアプリではFrameworkのネストが許可されていない
 - Embedded FrameworkではCarthageライブラリのcopyは行わないようにする


