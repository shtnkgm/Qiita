# Swiftで端末の通信キャリアを判定する
🎄この記事は[iOS Advent Calendar 2017 その2](https://qiita.com/advent-calendar/2017/ios2)の13日目の記事です🎄

# 概要
CoreTelephony.frameworkを利用し、**iOS端末の通信キャリアを判定をするTips**です。Web上であまりまとまった記事がないので、自分なりに整理してみました。

以下の内容をまとめています。

 - CoreTelephony.frameworkの概要
 - MCCとMNCってなに？
 - キャリア情報を取得するサンプルコード
 - MVNOだとどうなる？
 - SIMカードを抜いているとどうなる？
 - キャリア判定を行うUtilクラス
 - 別のSIMカードに変えた場合の検知

# CoreTelephony.frameworkとは
**ユーザー端末の通話機能や通信キャリア（通信プロバイダ）に関する情報を取得するためのフレームワーク**です。
主な用途としては、通信キャリアが自サービスの加入者のみにサービス提供する場合に利用されます。

CoreTelephony.frameworkを利用すると、以下のような情報が取得できます。

 - 通話状態（発信中、着信、接続、切断）
 - VoIP通話を行えるかどうか
 - 通信キャリア名
 - 通信キャリアのISO国名コード
 - 通信キャリアの**Mobile Country Code（MCC）**
 - 通信キャリアの**Mobile Network Code（MNC）**
 
# MCCとMNC
MCCとMNC、あまり耳慣れないキーワードがでてきました。
先にこの**MCCとMNCについて**簡単に説明します。

ざっくりいうと、**通信キャリアの識別用に割り当てられた番号**です。

## Mobile Country Code（MCC）
通信キャリアの**運用地域を示す3桁の番号**のこと。
日本の場合は**440もしくは441**が割り当てられています。
後述するMNCと合わせることで、通信キャリアの識別が可能です。

```:MCCの例
日本  ： 440, 441
中国  ： 460
アメリカ： 544, 310, 311
```

各国のMCCの割当はこちらのWikiから確認できます
https://en.wikipedia.org/wiki/Mobile_country_code

## Mobile Network Code（MNC）
**通信キャリアを識別するための2桁の番号**のこと。
各国の通信キャリアのMNCと区別するため、**MCCと合わせて表記**されます。

※MCCとMNCの組み合わせは**PLMN**（公衆陸上移動体ネットワーク番号｜Public Land Mobile Network Number）とも呼ばれます。

```:MCCとの併記例（後半の2桁がMNC）
Y!Mobile: 44000, 44110
UQ WiMAX: 44001
IIJmio  : 44003
NTTドコモ : 44010
Softbank: 44020, 44021, 44101
au      : 44050〜44054, 44070〜44076, 44078
```

MNCは通信キャリアで1つでなく、auやソフトバンクは**複数のMNCが割り当てられている**ようです。
MNCが複数あるキャリアの場合、考慮漏れや今後エリア拡大することを想定すると、**MNCからキャリア判定を行うのはあまり現実的でなさそう**です。

# キャリア情報を取得してみる
キャリア情報を取得するサンプルコードは以下のようになります。
ユーザーの通信キャリア情報を取得するには`CTTelephonyNetworkInfo`クラスの`subscriberCellularProvider`プロパティ（`CTCarrier`クラス）を利用します。
`CTCarrier`クラスの`carrierName`プロパティもしくは`mobileCountryCode`と`mobileNetworkCode`の組み合わせでキャリア判定ができます。

```swift:キャリア情報を取得するサンプルコード
import UIKit
import CoreTelephony

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // subscriberCellularProvideから通信キャリア情報（CTCareerクラス）が取得できる
        guard let provider = CTTelephonyNetworkInfo().subscriberCellularProvider else { return }

        // キャリア名
        print("carrierName: ", provider.carrierName ?? "")

        // MCC
        print("mobileCountryCode: ", provider.mobileCountryCode ?? "")

        // MNC
        print("mobileNetworkCode: ", provider.mobileNetworkCode ?? "")

        // ISO国名コード
        print("isoCountryCode: ", provider.isoCountryCode ?? "")

        // VoIP通話を行えるかどうか
        print("allowsVOIP: ", provider.allowsVOIP)
    }
}
```

## 実行結果

SoftbankのSIMカードを入れたiPhoneで実行すると以下のようになりました。キャリア名が日本語で取得できるのはちょっと意外です。

```:コンソール出力｜iPhone（Softbank）の場合
carrierName:  ソフトバンク
mobileCountryCode:  440
mobileNetworkCode:  20
isoCountryCode:  jp
allowsVOIP:  true
```

**MVNO（仮想移動通信業者）**の場合や、**音声通話できないiPad**だとどうなるのでしょうか？
次に、MVNOのmineo（ドコモプラン）のSIMカードを入れたiPadでも実行してみます。

```:コンソール出力｜iPad（mineo/ドコモプラン）の場合
carrierName:  ドコモ
mobileCountryCode:  440
mobileNetworkCode:  10
isoCountryCode:  jp
allowsVOIP:  true
```
carrierNameやMCC/MNCはNTTドコモのものが表示されています。またiPadでは音声通話はできませんが、VoIP契約済みSIMカードの場合、allowsVOIPはtrueとなるようです。

## carrierNameで取得できる文字列の例
Web上の記事等で確認すると、carrierNameで取得できる文字列は以下のようなものになるようです。これ以外にもあればコメントに書いて頂ければ随時更新します。

```swift:carrierNameで取得できる文字列の例
// ソフトバンク
"ソフトバンク"

// ソフトバンクモバイル
"ソフトバンクモバイル"

// NTTドコモ
"ドコモ"

// au
"KDDI"

// Y!mobile
"ワイモバイル"
```

おそらく出力される文字列は**設定アプリのキャリア情報（一般 > 情報 > キャリア）に表示されているものと同じ**になりそうです。
![IMG_0035.PNG](https://qiita-image-store.s3.amazonaws.com/0/113553/d0d83de3-5260-5729-fd21-1899bb2d9fcb.png)

## SIMカードを抜いているとどうなる？
SIMカードを抜いて実行した場合、最後に読み取ったSIMカードの情報が一部残るようです。**mobileCountryCode、mobileNetworkCode、isoCountryCodeプロパティはnil**が返ってきました。これらのプロパティがnilかどうかをチェックすることで、現在SIMカードが挿入されているかもチェックできそうです。

```:SIMカードを抜いた場合
carrierName:  ドコモ
mobileCountryCode:  
mobileNetworkCode:  
isoCountryCode:  
allowsVOIP:  true
```

公式ドキュメントにも以下の記載がありました。端末が**機内モード、SIMカード未挿入、端末が圏外の場合はnil**が取得できるようです。

> The value for this property is nil if any of the following apply:
 - The device is in Airplane mode.
 - There is no SIM card in the device.
 - The device is outside of cellular service range.

## キャリア判定を行うUtilクラス
carrierNameからキャリア判定を行うUtilクラスを実装してみました。

```swift:キャリア判定を行うUtilクラス
import CoreTelephony

final class NetworkInfo {
    enum Career: String {
        case softbank       = "ソフトバンク"
        case softbankMobile = "ソフトバンクモバイル"
        case docomo         = "ドコモ"
        case au             = "KDDI"
        case yMobile        = "ワイモバイル"
    }
    
    private static var provider: CTCarrier? {
        return CTTelephonyNetworkInfo().subscriberCellularProvider
    }
    
    /// 最後にアクティベートしたキャリア（判定不可な場合はnilを返す）
    static var latestActivatedCareer: Career? {
        return Career(rawValue: provider?.carrierName ?? "")
    }
    
    /// 現在のキャリア名（判定不可、もしくはSIMカードが挿入されていない場合はnilを返す）
    static var currentCareer: Career? {
        guard hasSIMCard else { return nil }
        return latestActivatedCareer
    }
    
    /// SIMカードが挿入されているか（機内モード、圏外の場合はfalse）
    static var hasSIMCard: Bool {
        return provider?.isoCountryCode != nil
    }
}
```

以下のようにSwitchやifで分岐が可能です。

```swift:利用イメージ
// キャリアによって処理を分岐する
guard let currentCareer = NetworkInfo.currentCareer else { return }
switch currentCareer {
case .softbank:         break
case .softbankMobile:   break
case .docomo:           break
case .au:               break
case .yMobile:          break
}

// auかY!mobileの場合のみ
if currentCareer == .au || currentCareer == .yMobile {
    // 何か
}
```

## 別のSIMカードに変えた場合の検知方法
`CTTelephonyNetworkInfo`クラスの以下のクロージャを設定することで、ユーザーが別のSIMカードに変更したことを検知できます。

```swift:subscriberCellularProviderDidUpdateNotifierの定義
var subscriberCellularProviderDidUpdateNotifier: ((CTCarrier) -> Void)? { get set }
```

```swift:subscriberCellularProviderDidUpdateNotifierの実装例
import UIKit
import CoreTelephony

class ViewController: UIViewController {
    private let networkInfo = CTTelephonyNetworkInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkInfo.subscriberCellularProviderDidUpdateNotifier = {
            (career: CTCarrier) in
            print("キャリア情報が変更されました: \(career)")
        }
    }
}
```
以下のように、SIMカードを別のSIMカードに入れ替えるとクロージャが実行されました。
なお、同じ通信キャリアのSIMカードを抜き差ししてもクロージャは実行されないようです。

```:実行結果
キャリア情報が変更されました: CTCarrier (0x1c4258810) {
	Carrier name: [ソフトバンク]
	Mobile Country Code: [440]
	Mobile Network Code:[20]
	ISO Country Code:[jp]
	Allows VOIP? [YES]
}
```

# まとめ

 - iOS端末の通信キャリア情報はCoreTelephony.frameworkで簡単に取得できる
 - MMC+MNCよりも、シンプルにキャリア名（carrierName）を取得したほうが扱いやすい
 - SIMカードを抜いた状態だと、最後に読み取ったキャリア名が取得される
 - SIMカードが挿入されていないことも判定できる（isoCountryCodeがnil）
 - 別キャリアのSIMカードに変更されたことも検知できる（subscriberCellularProviderDidUpdateNotifier）

# 参考
 - [Apple - CoreTelephony Frameworkリファレンス](https://developer.apple.com/documentation/coretelephony)
 - [Wiki - ISO国名コード](https://ja.wikipedia.org/wiki/ISO_3166-1)
 - [Wiki - MobileCountryCode](https://en.wikipedia.org/wiki/Mobile_country_code#Japan_-_JP)
 - [Wiki - MobileNetworkCode](https://ja.wikipedia.org/wiki/Mobile_Network_Code)
 - [株式会社Minatoの技術メモ - iPhoneのキャリア情報を取得する方法](http://tech.minato.jp.net/?p=49)
 - [blog of mobile - ITUが日本におけるPLMN番号の割当リストを更新](http://blogofmobile.com/article/57054)

