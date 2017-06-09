# UITextViewにタップ可能なリンクを挿入する
# 概要
 - UITextViewにタップ可能なリンクを挿入したい
 - 実装方法はNSMutableAttributedStringのNSLinkAttributeを利用する
 - TapGestureRecognizerを利用する実装方法もあるが、結構手間

# 完成イメージ
<img width="320" alt="screenshot_01.png" src="https://qiita-image-store.s3.amazonaws.com/0/113553/5a8c91a3-49d1-88d0-7b27-ff881fe866f2.png">

# サンプルコード

```swift:ViewController.swift
import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseString = "これは設定アプリへのリンクを含む文章です。\n\nこちらのリンクはGoogle検索です"
        
        let attributedString = NSMutableAttributedString(string: baseString)
        
        attributedString.addAttribute(NSLinkAttributeName,
                                      value: UIApplicationOpenSettingsURLString,
                                      range: NSString(string: baseString).range(of: "設定アプリへのリンク"))
        
        attributedString.addAttribute(NSLinkAttributeName,
                                      value: "https://www.google.co.jp/",
                                      range: NSString(string: baseString).range(of: "こちら"))
        
        textView.attributedText = attributedString
        textView.isSelectable = true
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Text View Delegate
    
    func textView(_ textView: UITextView,
                  shouldInteractWith URL: URL,
                  in characterRange: NSRange,
                  interaction: UITextItemInteraction) -> Bool {
        
        UIApplication.shared.open(URL)
        
        return false
    }
}
```

# ポイント
 - `addAttribute`メソッドの引数rangeは`NSRange`型
 - Stringの`range(of:String)`メソッドでなく、NSStingのrange(of:String)メソッドを利用
 - Stringの場合、戻り値は`Range<String.Index>`型、NSStringの場合、戻り値は`NSRange`型のため

```swift:一部抜粋
attributedString.addAttribute(NSLinkAttributeName,
                                      value: "https://www.google.co.jp/",
                                      range: NSString(string: baseString).range(of: "こちら"))
```

# Github
Githubでソースコードを公開しています。
https://github.com/shtnkgm/LinkTextViewSample

# 参考
 - [HACKING WITH SWIFT / How to make tappable links in NSAttributedString](https://www.hackingwithswift.com/example-code/system/how-to-make-tappable-links-in-nsattributedstring)

