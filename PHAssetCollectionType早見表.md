# PHAssetCollectionType早見表
# はじめに

iOS8から追加されたPhotos Frameworkについて、PHAssetCollectionType、PHAssetCollectionSubtypeの早見表をまとめます。

# 概要
 - Photos FrameworkではPHAssetCollectionType、さらにPHAssetCollectionSubtypeを指定して写真・動画のコレクションを取得します。
 - 例えば、カメラロール内の写真・動画を取得する場合、 以下のように指定します。
   1. PHAssetCollectionTypeに**PHAssetCollectionTypeSmartAlbum**を指定
   2. PHAssetCollectionSubtypeに**PHAssetCollectionSubtypeSmartAlbumUserLibrary**を指定

**カメラロールのコレクションを取得するサンプル**

```objc:Objective-C
 PHFetchResult *result = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum
                                                                   subtype:PHAssetCollectionSubtypeSmartAlbumUserLibrary
                                                                   options:nil];
```

```swift:Swift
let result = PHAssetCollection.fetchAssetCollections(with: .smartAlbum,
                                                     subtype: .any,
                                                     options: nil)
````

# PHAssetCollectionType

| PHAssetCollectionType           | 説明 | 対応OS |
|:--------------------------------|:------------------------------------------------------|:----------------|
| PHAssetCollectionTypeAlbum      | ユーザーが作成したアルバムとiTunes同期したアルバム（SubTypeでフィルタ）| iOS8以降 |   
| PHAssetCollectionTypeSmartAlbum | システムが作成したアルバム（SubTypeでフィルタ） | iOS8以降 |
| PHAssetCollectionTypeMoment     | 写真アプリ内のモーメント(日付と場所でフィルタ) | iOS8以降　|

# PHAssetCollectionSubtype

|PHAssetCollectionSubtype|説明|対応OS|
|:--|:--|:--|
|PHAssetCollectionSubtypeAlbumRegular |ユーザーが作成したアルバム| iOS8以降|
|PHAssetCollectionSubtypeAlbumSyncedEvent |iPhotoで同期したイベント|iOS8以降|
|PHAssetCollectionSubtypeAlbumSyncedFaces |iPhotoで同期した顔認識グループ|iOS8以降|
|PHAssetCollectionSubtypeAlbumSyncedAlbum  |iPhotoで同期したアルバム|  iOS8以降|
|PHAssetCollectionSubtypeAlbumImported |カメラや外部ストレージからインポートしたアルバム|  iOS8以降|     
|PHAssetCollectionSubtypeAlbumMyPhotoStream   |個人のiCloudフォトストリーム|iOS8以降|    
|PHAssetCollectionSubtypeAlbumCloudShared   |共有のiCloudフォトストリーム|iOS8以降|    
|PHAssetCollectionSubtypeSmartAlbumGeneric  |iPhotoから同期されたスマートアルバム| iOS8以降|   
|PHAssetCollectionSubtypeSmartAlbumPanoramas  | パノラマ写真|iOS8以降|  
|PHAssetCollectionSubtypeSmartAlbumVideos   | ビデオ | iOS8以降|
|PHAssetCollectionSubtypeSmartAlbumFavorites    | お気に入り|iOS8以降|
|PHAssetCollectionSubtypeSmartAlbumTimelapses  | タイムラプス |iOS8以降|
|PHAssetCollectionSubtypeSmartAlbumAllHidden  | 非表示にされた写真 |iOS8以降|
|PHAssetCollectionSubtypeSmartAlbumRecentlyAdded  |最近追加した項目 |iOS8以降|
|PHAssetCollectionSubtypeSmartAlbumBursts    | バースト写真 |iOS8以降|
|PHAssetCollectionSubtypeSmartAlbumSlomoVideos  | スローモーション動画|iOS8以降|
|PHAssetCollectionSubtypeSmartAlbumUserLibrary  | カメラロール |iOS8以降|
|PHAssetCollectionSubtypeSmartAlbumSelfPortraits  |セルフィー（自分撮り） |**iOS9以降**|
|PHAssetCollectionSubtypeSmartAlbumScreenshots  | スクリーンショット |**iOS9以降**|
|PHAssetCollectionSubtypeAny | すべて|iOS8以降|

# 公式ドキュメント
 - [Photos Framework Reference - PHAssetCollection Class Reference](https://developer.apple.com/library/ios/documentation/Photos/Reference/PHAssetCollection_Class/#//apple_ref/c/tdef/PHAssetCollectionType)

