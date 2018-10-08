# SwiftでUITextViewにリンクを挿入する
# はじめに
以下のような、複数のタップ可能なリンクを持つUITextViewの作成方法のメモです。
リンクタップした際に、ログ送信など別の処理も行いたいものと想定します。

![image.png](https://qiita-image-store.s3.amazonaws.com/0/113553/92f48b93-0ce2-3f26-48a6-eb94fd6351ab.png)

# 実現方法
UITextViewへリンクを追加する方法はNSMutableAttributedString（.link）を追加することで実現できます。また、リンクタップ時の処理は、**何かリンクを識別する文字列をURLとして与えておき、UItextViewのデリゲートメソッド内で判別してハンドリングします。**

```swift:UITextViewがリンクをタップされた際に実行されるデリゲートメソッド
public func textView(_ textView: UITextView, 
                     shouldInteractWith URL: URL, 
                     in characterRange: NSRange, 
                     interaction: UITextItemInteraction) -> Bool { }
```

以下のソースコードでは、利用規約およびプライバシーポリシーのリンクを識別する文字列として、`TermOfUseLink`と`PrivacyPolicyLink`を設定しています。
※識別する文字列に**マルチバイト文字を設定するとクラッシュする**ので注意

```swift:利用規約およびプライバシーポリシーのリンクを識別する文字列の設定
        attributedString.addAttribute(.link,
                                      value: "TermOfUseLink",
                                      range: NSString(string: baseString).range(of: "利用規約"))
        
        attributedString.addAttribute(.link,
                                      value: "PrivacyPolicyLink",
                                      range: NSString(string: baseString).range(of: "プライバシーポリシー"))
```

# ソースコード
```swift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseString = "利用規約、プライバシーポリシーに同意する。"
        let attributedString = NSMutableAttributedString(string: baseString)
        
        attributedString.addAttribute(.link,
                                      value: "TermOfUseLink",
                                      range: NSString(string: baseString).range(of: "利用規約"))
        
        attributedString.addAttribute(.link,
                                      value: "PrivacyPolicyLink",
                                      range: NSString(string: baseString).range(of: "プライバシーポリシー"))
        
        let textView = UITextView()
        textView.attributedText = attributedString
        textView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        textView.center = view.center
        textView.isSelectable = true
        textView.isEditable = false
        textView.delegate = self
        view.addSubview(textView)
    }
}

extension UIViewController: UITextViewDelegate {
    public func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        let urlString = URL.absoluteString
        if urlString == "TermOfUseLink" {
            print("利用規約のリンクがタップされました")
            // ログ送信処理
            // 利用規約画面を開く処理
        }
        
        if urlString == "PrivacyPolicyLink" {
            print("プライバシーポリシーのリンクがタップされました")
            // ログ送信処理
            // プライバシーポリシー画面を開く処理
        }
        
        return false
    }
}
```

# 参考

- [UITextView内の特定文字を文字装飾してタップイベントを追加する](https://qiita.com/wrbss/items/7a88e4c18578315977fc)
- [UITextViewにタップ可能なリンクを挿入する](https://qiita.com/shtnkgm/items/3c8b6b794219fbf087ba)

