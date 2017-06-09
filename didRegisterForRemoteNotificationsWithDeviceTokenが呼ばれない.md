# didRegisterForRemoteNotificationsWithDeviceTokenが呼ばれない
iOSでPush通知を行うアプリを開発した際、
デバイストークンが渡される以下メソッドが呼ばれない場合の確認事項

```objc:Objective-C
- (void)application:(UIApplication *)application 
    didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    //デバイストークン取得後の処理
}
```
```swift:Swift
func application( application: UIApplication, 
    didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData ) {
    //デバイストークン取得後の処理
}
```

# 確認事項

1. target設定のCapabilities > Push NotificationsがONになっていることを確認する。
<img width="658" alt="スクリーンショット 2017-03-01 23.25.20.png" src="https://qiita-image-store.s3.amazonaws.com/0/113553/53143ef9-216e-bce5-c312-f2b1624c615a.png">

2. iOS8以降の場合、registerForRemoteNotificationsをコールしているか確認する。

```objc:Objective-C
- (BOOL)application:(UIApplication *)application 
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIUserNotificationType types =
                        UIUserNotificationTypeBadge|
                        UIUserNotificationTypeSound|
                        UIUserNotificationTypeAlert;

    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [application registerUserNotificationSettings:settings];
    return YES;
}

- (void)application:(UIApplication *)application 
    didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    [application registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application 
    didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    //デバイストークン取得後の処理
}

- (void)application:(UIApplication *)application
    didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    // エラー処理
}
```

```swift:Swift
func application( application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary? ) -> Bool {
    let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
    application.registerUserNotificationSettings(settings)
    return true
}

func application( application: UIApplication,
     didRegisterUserNotificationSettings notificationSettings:UIUserNotificationSettings) {     
     application.registerForRemoteNotifications()
}

func application( application: UIApplication,
     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
    //デバイストークン取得後の処理
}

func application( application: UIApplication!, 
    didFailToRegisterForRemoteNotificationsWithError error: NSError! ) {
    // エラー処理
}
```

# 参考
 - [Xcode6でiOS8へPush通知が送れない場合の解決方法](http://qiita.com/peromasamune/items/90970e9f9d5c34d21cfd)
 - [SwiftでPush通知](http://qiita.com/sawapi/items/feba100851de47fbe412)
 - [【iOS8とiOS7対応】SwiftでPush](http://qiita.com/fuji_syan/items/be4d0a26923200b201cc)


