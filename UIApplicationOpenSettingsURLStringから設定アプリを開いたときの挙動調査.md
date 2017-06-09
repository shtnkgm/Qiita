# UIApplicationOpenSettingsURLStringから設定アプリを開いたときの挙動調査
UIApplicationOpenSettingsURLStringから設定アプリを開いたときの挙動を調べました。
(iOS10.2.1で検証)

```swift:Swift
@IBAction func openSettingsButtonTapped(_ sender: Any) {
        guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl)
        }
}
```

##「設定アプリ」内にアプリ固有の設定項目がない場合

 - 「設定アプリ」を起動済みでない場合、「設定アプリ」のTOP画面に遷移
 - 「設定アプリ」を起動済みの場合、「設定アプリ」内の開いていた画面に遷移

例)
1. 設定アプリのWiFi設定を開く
2. UIApplicationOpenSettingsURLStringで遷移
3. WiFi設定画面が開く


##「設定アプリ」内にアプリ固有の設定項目がある場合
カメラや写真、マイク、位置情報等を利用するアプリやSettings.bundleでアプリ固有の設定項目（プリファレンス）を作成したアプリの場合

 - 「設定アプリ」の起動有無に関わらず、アプリ固有の設定画面へ遷移



