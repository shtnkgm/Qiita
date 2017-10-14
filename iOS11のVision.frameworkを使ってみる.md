# iOS11のVision.frameworkを使ってみる
iOS11から追加された、Vision.frameworkを使ってみた時に調べた内容のメモです。
機械学習の簡単な概要にも触れつつ、Visionを用いたカメラ画像を判別するサンプルアプリを作成します。

# サンプルアプリ
Visionの「機械学習による画像分析」機能を利用して、以下のサンプルアプリをつくります。
このサンプルアプリは、カメラで映した画像を判別し、モノの名前を表示します。

**デモ動画**
![VisionDemo.gif](https://qiita-image-store.s3.amazonaws.com/0/113553/7173a5bf-2f30-b1cd-f5b9-3c65cfbf8f02.gif)

# Vision.frameworkとは
- iOS11から追加された**画像認識API**を提供するフレームワーク
- 同じくiOS11から追加された機械学習フレームワークの**Core MLを抽象化**

# 機械学習スタック
iOSの機械学習フレームワークを利用したアプリケーションスタックは以下のような図になります。

![スクリーンショット 2017-08-27 22.03.26.png](https://qiita-image-store.s3.amazonaws.com/0/113553/e011e86d-327f-1cb0-5e79-cd5bf098eb5a.png)

**補足：ニューラルネットワークとは**

- 機械学習手法の一種
- 人間の脳の神経回路網を
数式モデルで表したもの
- NNと略される
（DNN[^1]、RNN[^2]、CNN[^3]など）

[^1]: Deep Neural Network（ディープニューラルネットワーク）

[^2]: Recurrent Neural Network（再帰型ニューラルネットワーク）

[^3]: Convolutional Neural Network（畳み込みニューラルネットワーク）

![20161006215219.png](https://qiita-image-store.s3.amazonaws.com/0/113553/29df62b9-4058-3901-3eb2-3cb7b080697e.png)

**補足：機械学習による画像認識の流れ**
機械学習を利用したアプリケーションを開発するには、以下のように機械学習モデルを構築する必要があります。

1. 学習のため画像データを収集（教材を集める）
2. 学習用データから、機械学習アルゴリズムによりモデルを作成
3. 学習済みモデルを用いて未知の画像を判別（実践）

# Visionで認識できるもの
Visionでの画像認識は、Appleが既に画像認識モデルを用意したもの(1)と、
開発者がモデルを用意する必要のあるもの(2)があります。
今回はモデルを用意し、「機械学習による画像分析」機能を利用します。

**(1)機械学習モデルの用意が不要なもの**

- 顔検出 / Face Detection and Recognition
- バーコード検出 / Barcode Detection
- 画像の位置合わせ / Image Alignment Analysis
- テキスト検出 / Text Detection
- 水平線検出 / Horizon Detection

**(2)機械学習モデルの用意が必要なもの**

- オブジェクト検出とトラッキング / Object Detection and Tracking
- **機械学習による画像分析 / Machine Learning Image Analysis**

# 画像認識モデルの用意
今回は簡単のため、Appleのサイトで配布されている学習済みモデルを利用します。
[https://developer.apple.com/machine-learning/](https://developer.apple.com/machine-learning/)

**配布モデル一覧**
モデルによって得意な画像の種類や容量が異なる
（5MB〜553.5MB）

- MobileNets
- SqueezeNet
- Places205-GoogLeNet
- ResNet50
- Inception v3
- VGG16

特に理由はありませんが、ResNet50を利用してみました。

**ResNet50**
- 樹木、動物、食物、乗り物、人などの1000種類のカテゴリ
- サイズは102.6 MB
- MITライセンス

# モデルをXcodeプロジェクトに組み込む
- モデルとして用意した.mlmodelファイルをXcodeにドラッグ&ドロップするだけ
- 自動でモデル名.swiftという名前でモデルクラスが作成される

![スクリーンショット 2017-08-27 22.39.08.png](https://qiita-image-store.s3.amazonaws.com/0/113553/e34f039c-0468-d79b-8d7b-c0b39076b8f0.png)

Resnet50.swift（一部抜粋）
![スクリーンショット 2017-08-27 22.40.58.png](https://qiita-image-store.s3.amazonaws.com/0/113553/9b7e075f-7b2c-58a5-ab95-c843e331afac.png)

# カメラ画像をキャプチャする処理を実装

```swift:AVFoundationを利用し、カメラ画像をキャプチャ
// カメラキャプチャの開始
private func startCapture() {
let captureSession = AVCaptureSession()
captureSession.sessionPreset = AVCaptureSessionPresetPhoto

// 入力の指定
let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
guard captureSession.canAddInput(input) else { return }
captureSession.addInput(input)

// 出力の指定
let output: AVCaptureVideoDataOutput = AVCaptureVideoDataOutput()
output.setSampleBufferDelegate(self, queue: DispatchQueue(label: "VideoQueue"))
guard captureSession.canAddOutput(output) else { return }
captureSession.addOutput(output)

// プレビューの指定
guard let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession) else { return }
previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
previewLayer.frame = view.bounds
view.layer.insertSublayer(previewLayer, at: 0)

// キャプチャ開始
captureSession.startRunning()
}
```

```swift:撮影フレーム枚に呼び出されるデリゲートメソッド
extension ViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
func captureOutput(_ output: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, from connection: AVCaptureConnection!) {

// CMSampleBufferをCVPixelBufferに変換
guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }

// この中にVision.frameworkの処理を書いていく
}
}
```

# Vision.frameworkで利用する主なクラス
概要をまとめると以下のようになります。

- VNCoreMLModel（組み込んだモデル）
- VNCoreMLRequest（画像認識のリクエスト）
- VNImageRequestHandler（リクエストの実行）
- VNObservation（認識結果）

**VNCoreMLModel**

- CoreMLのモデルをVisionで扱うためのコンテナクラス

**VNCoreMLRequest**

- CoreMLに画像認識を要求するためのクラス
- 認識結果はモデルの出力形式により決まる
    - 画像→クラス（分類結果）
    - 画像→特徴量
    - 画像→画像

**VNImageRequestHandler**

- 一つの画像に対し、一つ以上の画像認識処理（VNCoreMLRequest）を実行するためのクラス
- 初期化時に認識対象の画像形式を指定する
    - CVPixelBuffer
    - CIImage
    - CGImage

**VNObservation**

- 画像認識結果の抽象クラス
- 結果としてこのクラスのサブクラスのいずれかが返される
- 認識の確信度を表すconfidenceプロパティを持つ（VNConfidence=Floatのエイリアス）

**VNObservationサブクラス**

- VNClassificationObservation
分類名としてidentifierプロパティを持つ

- VNCoreMLFeatureValueObservation
特徴量データとしてfeatureValueプロパティを持つ

- VNPixelBufferObservation
画像データとしてpixelBufferプロパティを持つ

# 具体的な実装コード

```swift:モデルクラスの初期化
// CoreMLのモデルクラスの初期化
guard let model = try? VNCoreMLModel(for: Resnet50().model) else { return }
```

```swift:画像認識リクエストを作成
// 画像認識リクエストを作成（引数はモデルとハンドラ）
let request = VNCoreMLRequest(model: model) {
[weak self] (request: VNRequest, error: Error?) in
guard let results = request.results as? [VNClassificationObservation] else { return }

// 判別結果とその確信度を上位3件まで表示
// identifierはカンマ区切りで複数書かれていることがあるので、最初の単語のみ取得する
let displayText = results.prefix(3)
.flatMap { "\(Int($0.confidence * 100))% \($0.identifier.components(separatedBy: ", ")[0])" }
.joined(separator: "\n")

DispatchQueue.main.async {
self?.textView.text = displayText
}
}
```

```swift:画像認識リクエストを実行
// CVPixelBufferに対し、画像認識リクエストを実行
try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
```

# 画像認識部分の完成形
```swift

guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
guard let model = try? VNCoreMLModel(for: Resnet50().model) else { return }

let request = VNCoreMLRequest(model: model) {
[weak self] (request: VNRequest, error: Error?) in
guard let results = request.results as? [VNClassificationObservation] else { return }

let displayText = results.prefix(3)
.flatMap { "\(Int($0.confidence * 100))% \($0.identifier.components(separatedBy: ", ")[0])" }
.joined(separator: "\n")

DispatchQueue.main.async { self?.textView.text = displayText }
}
try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
```

# サンプルコード
今回ご紹介したサンプルコードはこちらに置いてあります。
https://github.com/shtnkgm/VisionFrameworkSample

# 参考
- [Build more intelligent apps with machine learning. / Apple](https://developer.apple.com/machine-learning/)
- [Vision / Apple Developer Documentation](https://developer.apple.com/documentation/vision)
- [【WWDC2017】Vision.framework のテキスト検出を試してみました【iOS11】](https://tech.recruit-mp.co.jp/mobile/ios-11-vision-framework/)
- [Keras + iOS11 CoreML + Vision Framework による、ももクロ顔識別アプリの開発](http://qiita.com/kenmaz/items/d416b191f79f60e07752)
- [[Core ML] .mlmodel ファイルを作成する / フェンリル](https://blog.fenrir-inc.com/jp/2017/06/create-core-ml.html)
- [[iOS 11] CoreMLで画像の識別を試してみました（Vision.Frameworkを使わないパターン） #WWDC2017](http://dev.classmethod.jp/smartphone/ios-11-code-ml/)
- [Places205-GoogLeNetで場所の判定 / fabo.io](http://docs.fabo.io/swift/coreml/001_coreml.html)
- [iOSDCのリジェクトコンで『iOSとディープラーニング』について話しましたAdd Star](http://d.hatena.ne.jp/shu223/20160902/1472771340)
- [[iOS 10][ニューラルネットワーク] OSSでAccelerateに追加されたBNNSを理解する ~XOR編~](http://dev.classmethod.jp/smartphone/ios-10-bnns-xor/)

