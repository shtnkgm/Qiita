# Photos Frameworkで写真アルバムのタイトル、写真枚数を取得するサンプル
iOSのPhotos Frameworkで写真アルバムの情報を取得するサンプルです。
今回はスマートアルバムの情報を取得します。
スマートアルバム：パノラマ写真、ビデオなど、iOSが自動で作成するアルバム

# 取得する情報
 - 写真アルバムのタイトル
 - 写真の枚数（動画含む）

# サンプルコード
**PHAssetCollectionTypeSmartAlbum**でスマートアルバムを指定、
**PHAssetCollectionSubtypeAny**でスマートアルバムに該当するもの全てを指定しています。
タイトルの取得はPHAssetCollectionクラスの**localizedTitle**プロパティから行います。

```objc:写真アルバムの情報を取得するサンプル(Objective-C)
    PHFetchResult *assetCollections = [PHAssetCollection fetchAssetCollectionsWithType: PHAssetCollectionTypeSmartAlbum
                                                                               subtype: PHAssetCollectionSubtypeAny
                                                                               options: nil];
    for (PHAssetCollection *assetCollection in assetCollections) {
        PHFetchResult *assets = [PHAsset fetchAssetsInAssetCollection:assetCollection options: nil];
        NSLog(@"%@:%d", assetCollection.localizedTitle, (int)assets.count);
    }
```

# 実行結果
```
2016-05-30 00:36:29.013 PhotoApp[8460:2390078] Panoramas:0
2016-05-30 00:36:29.015 PhotoApp[8460:2390078] Videos:14
2016-05-30 00:36:29.016 PhotoApp[8460:2390078] Slo-mo:0
2016-05-30 00:36:29.017 PhotoApp[8460:2390078] Time-lapse:0
2016-05-30 00:36:29.019 PhotoApp[8460:2390078] Favorites:0
2016-05-30 00:36:29.025 PhotoApp[8460:2390078] Camera Roll:1174
2016-05-30 00:36:29.026 PhotoApp[8460:2390078] Hidden:0
2016-05-30 00:36:29.027 PhotoApp[8460:2390078] Bursts:0
2016-05-30 00:36:29.029 PhotoApp[8460:2390078] Recently Added:301
2016-05-30 00:36:29.031 PhotoApp[8460:2390078] Selfies:0
2016-05-30 00:36:29.032 PhotoApp[8460:2390078] Screenshots:5
```
例えば、スクリーンショットが5枚あることが分かります。

# 関連記事
PHAssetCollectionType,Subtypeの種類は以下を参照。
[PHAssetCollectionType早見表](http://qiita.com/shtnkgm/items/5b14d41685226f5c5e4b)

