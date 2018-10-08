# CIFilterチートシート（全201種）
# はじめに
iOS、MacOSで画像処理にとても便利な**CIFilterの全フィルタ一覧（201種）と設定可能なパラメーター一覧**をチートシートにまとめました。
Appleのドキュメントにあまり載っていない、パラメーターの最小値、最大値も載せています。利用したいフィルタがある場合は本記事でフィルタ名で検索していただくと良いかと思います。

# CIAccordionFoldTransition

## フィルタ名
Accordion Fold Transition

## SDKs
iOS 8+ / macOS 10.10+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAccordionFoldTransition

## 所属カテゴリ
CICategoryTransition, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBottomHeight
|項目|内容|
|:--|:--|
|パラメーター名|Bottom Height|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|0|
|最小値, 最大値|0 ~ 無し|

### inputTime
|項目|内容|
|:--|:--|
|パラメーター名|Time|
|説明|The duration of the effect.|
|タイプ|CIAttributeTypeTime|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputFoldShadowAmount
|項目|内容|
|:--|:--|
|パラメーター名|Fold Shadow Amount|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.1|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputNumberOfFolds
|項目|内容|
|:--|:--|
|パラメーター名|Number of Folds|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|3|
|最小値, 最大値|1 ~ 50|
|スライダー最小値, 最大値|1 ~ 10|

### inputTargetImage
|項目|内容|
|:--|:--|
|パラメーター名|Target Image|
|説明|The target image for a transition.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIAdditionCompositing

## フィルタ名
Addition

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAdditionCompositing

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryHighDynamicRange, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIAffineClamp

## フィルタ名
Affine Clamp

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAffineClamp

## 所属カテゴリ
CICategoryTileEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputTransform
|項目|内容|
|:--|:--|
|パラメーター名|Transform|
|説明|The transform to apply to the image.|
|型|NSValue|
|Default値, Identity値|CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}, CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIAffineTile

## フィルタ名
Affine Tile

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAffineTile

## 所属カテゴリ
CICategoryTileEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputTransform
|項目|内容|
|:--|:--|
|パラメーター名|Transform|
|説明|The transform to apply to the image.|
|型|NSValue|
|Default値, Identity値|CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}, CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIAffineTransform

## フィルタ名
Affine Transform

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAffineTransform

## 所属カテゴリ
CICategoryGeometryAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputTransform
|項目|内容|
|:--|:--|
|パラメーター名|Transform|
|説明|A transform to apply to the image.|
|タイプ|CIAttributeTypeTransform|
|型|NSValue|
|Default値, Identity値|CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}, CGAffineTransform: {{1, 0, 0, 1}, {0, 0}}|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIAreaAverage

## フィルタ名
Area Average

## SDKs
iOS 9+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaAverage

## 所属カテゴリ
CICategoryReduction, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputExtent
|項目|内容|
|:--|:--|
|パラメーター名|Extent|
|説明|A rectangle that specifies the subregion of the image that you want to process.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値|[0 0 640 80]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to process.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIAreaHistogram

## フィルタ名
Area Histogram

## SDKs
iOS 8+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaHistogram

## 所属カテゴリ
CICategoryReduction, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputExtent
|項目|内容|
|:--|:--|
|パラメーター名|Extent|
|説明|A rectangle that, after intersection with the image extent, specifies the subregion of the image that you want to process.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値|[0 0 640 80]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image whose histogram you want to calculate.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputScale
|項目|内容|
|:--|:--|
|パラメーター名|Scale|
|説明|The scale value to use for the histogram values. If the scale is 1.0, then the bins in the resulting image will add up to 1.0.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|1|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1|

### inputCount
|項目|内容|
|:--|:--|
|パラメーター名|Count|
|説明|The number of bins for the histogram. This value will determine the width of the output image.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|64|
|最小値, 最大値|1 ~ 2048|
|スライダー最小値, 最大値|10 ~ 1000|

# CIAreaMaximum

## フィルタ名
Area Maximum

## SDKs
iOS 9+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaMaximum

## 所属カテゴリ
CICategoryReduction, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputExtent
|項目|内容|
|:--|:--|
|パラメーター名|Extent|
|説明|A rectangle that specifies the subregion of the image that you want to process.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値|[0 0 640 80]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to process.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIAreaMaximumAlpha

## フィルタ名
Area Maximum Alpha

## SDKs
iOS 9+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaMaximumAlpha

## 所属カテゴリ
CICategoryReduction, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputExtent
|項目|内容|
|:--|:--|
|パラメーター名|Extent|
|説明|A rectangle that specifies the subregion of the image that you want to process.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値|[0 0 640 80]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to process.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIAreaMinimum

## フィルタ名
Area Minimum

## SDKs
iOS 9+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaMinimum

## 所属カテゴリ
CICategoryReduction, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputExtent
|項目|内容|
|:--|:--|
|パラメーター名|Extent|
|説明|A rectangle that specifies the subregion of the image that you want to process.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値|[0 0 640 80]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to process.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIAreaMinimumAlpha

## フィルタ名
Area Minimum Alpha

## SDKs
iOS 9+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaMinimumAlpha

## 所属カテゴリ
CICategoryReduction, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputExtent
|項目|内容|
|:--|:--|
|パラメーター名|Extent|
|説明|A rectangle that specifies the subregion of the image that you want to process.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値|[0 0 640 80]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to process.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIAreaMinMax

## フィルタ名
Area Min and Max

## SDKs
iOS 12+ / macOS 10.14+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaMinMax

## 所属カテゴリ
CICategoryReduction, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputExtent
|項目|内容|
|:--|:--|
|パラメーター名|Extent|
|説明|A rectangle that specifies the subregion of the image that you want to process.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値|[0 0 640 80]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to process.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIAreaMinMaxRed

## フィルタ名
Area Min and Max Red

## SDKs
iOS 11+ / macOS 10.13+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAreaMinMaxRed

## 所属カテゴリ
CICategoryReduction, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputExtent
|項目|内容|
|:--|:--|
|パラメーター名|Extent|
|説明|A rectangle that specifies the subregion of the image that you want to process.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値|[0 0 640 80]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to process.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIAttributedTextImageGenerator

## フィルタ名
Attributed Text Image Generator

## SDKs
iOS 11+ / macOS 10.13+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIAttributedTextImageGenerator

## 所属カテゴリ
CICategoryGenerator, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputText
|項目|内容|
|:--|:--|
|パラメーター名|Text|
|型|NSAttributedString|

### inputScaleFactor
|項目|内容|
|:--|:--|
|パラメーター名|Scale Factor|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|1|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|1 ~ 4|

# CIBarsSwipeTransition

## フィルタ名
Bars Swipe Transition

## SDKs
iOS 6+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBarsSwipeTransition

## 所属カテゴリ
CICategoryTransition, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The width of each bar.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|30|
|最小値, 最大値|2 ~ 無し|
|スライダー最小値, 最大値|2 ~ 300|

### inputTime
|項目|内容|
|:--|:--|
|パラメーター名|Time|
|説明|The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).|
|タイプ|CIAttributeTypeTime|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputBarOffset
|項目|内容|
|:--|:--|
|パラメーター名|Bar Offset|
|説明|The offset of one bar with respect to another|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|10|
|最小値, 最大値|1 ~ 無し|
|スライダー最小値, 最大値|1 ~ 100|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputTargetImage
|項目|内容|
|:--|:--|
|パラメーター名|Target Image|
|説明|The target image for a transition.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle (in radians) of the bars.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|3.141592653589793, 0|
|スライダー最小値, 最大値|0 ~ 6.283185307179586|

# CIBicubicScaleTransform

## フィルタ名
Bicubic Scale Transform

## SDKs
iOS 11+ / macOS 10.13+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBicubicScaleTransform

## 所属カテゴリ
CICategoryGeometryAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputC
|項目|内容|
|:--|:--|
|パラメーター名|C|
|説明|Specifies the value of C to use for the cubic resampling function.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.75|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputScale
|項目|内容|
|:--|:--|
|パラメーター名|Scale|
|説明|The scaling factor to use on the image. Values less than 1.0 scale down the images. Values greater than 1.0 scale up the image.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1, 1|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0.05 ~ 100|

### inputAspectRatio
|項目|内容|
|:--|:--|
|パラメーター名|Aspect Ratio|
|説明|The additional horizontal scaling factor to use on the image.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1, 1|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0.5 ~ 2|

### inputB
|項目|内容|
|:--|:--|
|パラメーター名|B|
|説明|Specifies the value of B to use for the cubic resampling function.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

# CIBlendWithAlphaMask

## フィルタ名
Blend With Alpha Mask

## SDKs
iOS 7+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBlendWithAlphaMask

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputMaskImage
|項目|内容|
|:--|:--|
|パラメーター名|Mask Image|
|説明|A masking image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIBlendWithBlueMask

## フィルタ名
Blend With Blue Mask

## SDKs
iOS 11+ / macOS 10.13+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBlendWithBlueMask

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputMaskImage
|項目|内容|
|:--|:--|
|パラメーター名|Mask Image|
|説明|A masking image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIBlendWithMask

## フィルタ名
Blend With Mask

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBlendWithMask

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputMaskImage
|項目|内容|
|:--|:--|
|パラメーター名|Mask Image|
|説明|A grayscale mask. When a mask value is 0.0, the result is the background. When the mask value is 1.0, the result is the image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as a foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIBlendWithRedMask

## フィルタ名
Blend With Red Mask

## SDKs
iOS 11+ / macOS 10.13+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBlendWithRedMask

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputMaskImage
|項目|内容|
|:--|:--|
|パラメーター名|Mask Image|
|説明|A masking image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIBloom

## フィルタ名
Bloom

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBloom

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius determines how many pixels are used to create the effect. The larger the radius, the greater the effect.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|10, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 100|

### inputIntensity
|項目|内容|
|:--|:--|
|パラメーター名|Intensity|
|説明|The intensity of the effect. A value of 0.0 is no effect. A value of 1.0 is the maximum effect.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0.5, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1|

# CIBokehBlur

## フィルタ名
Bokeh Blur

## SDKs
iOS 11+ / macOS 10.13+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBokehBlur

## 所属カテゴリ
CICategoryBlur, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputSoftness
|項目|内容|
|:--|:--|
|パラメーター名|Softness|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|1|
|最小値, 最大値|0 ~ 10|
|スライダー最小値, 最大値|0.25 ~ 0.4|

### inputRingSize
|項目|内容|
|:--|:--|
|パラメーター名|Ring Size|
|説明|The size of extra emphasis at the ring of the bokeh|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.1|
|最小値, 最大値|0 ~ 0.2|
|スライダー最小値, 最大値|0 ~ 0.2|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|20|
|最小値, 最大値|0 ~ 500|
|スライダー最小値, 最大値|0 ~ 100|

### inputRingAmount
|項目|内容|
|:--|:--|
|パラメーター名|Ring Amount|
|説明|The amount of extra emphasis at the ring of the bokeh.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

# CIBoxBlur

## フィルタ名
Box Blur

## SDKs
iOS 9+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBoxBlur

## 所属カテゴリ
CICategoryBlur, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|10|
|最小値, 最大値|1 ~ 無し|
|スライダー最小値, 最大値|1 ~ 100|

# CIBumpDistortion

## フィルタ名
Bump Distortion

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBumpDistortion

## 所属カテゴリ
CICategoryDistortionEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The center of the effect as x and y coordinates.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputScale
|項目|内容|
|:--|:--|
|パラメーター名|Scale|
|説明|The scale of the effect determines the curvature of the bump. A value of 0.0 has no effect. Positive values create an outward bump; negative values create an inward bump.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0.5, 0|
|スライダー最小値, 最大値|-1 ~ 1|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|300|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 600|

# CIBumpDistortionLinear

## フィルタ名
Bump Distortion Linear

## SDKs
iOS 6+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBumpDistortionLinear

## 所属カテゴリ
CICategoryDistortionEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The center of the effect as x and y coordinates.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputScale
|項目|内容|
|:--|:--|
|パラメーター名|Scale|
|説明|The scale of the effect.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0.5, 1|
|最小値, 最大値|-1 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|300, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 600|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle (in radians) of the line around which the distortion occurs.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|0 ~ 6.283185307179586|

# CICameraCalibrationLensCorrection

## フィルタ名
Lens Correction for AVC

## SDKs
iOS 12+ / macOS 10.14+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICameraCalibrationLensCorrection

## 所属カテゴリ
CICategoryDistortionEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputUseInverseLookUpTable
|項目|内容|
|:--|:--|
|パラメーター名|Use Inverse Look Up Table|
|説明|Boolean value used to select the Look Up Table from the AVCameraCalibrationData|
|型|NSNumber|
|Default値|0|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to process.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAVCameraCalibrationData
|項目|内容|
|:--|:--|
|パラメーター名|Calibration Data object of type AVCameraCalibrationData|
|説明|AVCameraCalibrationData for the correction.  Will be set from the inputImage if available and can be overridden here.|
|型|AVCameraCalibrationData|

# CICheckerboardGenerator

## フィルタ名
Checkerboard

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICheckerboardGenerator

## 所属カテゴリ
CICategoryGenerator, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The width of the squares in the pattern.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|80|
|スライダー最小値, 最大値|0 ~ 800|

### inputSharpness
|項目|内容|
|:--|:--|
|パラメーター名|Sharpness|
|説明|The sharpness of the edges in pattern. The smaller the value, the more blurry the pattern. Values range from 0.0 to 1.0.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|1|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The center of the effect as x and y coordinates.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputColor1
|項目|内容|
|:--|:--|
|パラメーター名|Color 2|
|説明|A color to use for the second set of squares.|
|型|CIColor|
|Default値|(0 0 0 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputColor0
|項目|内容|
|:--|:--|
|パラメーター名|Color 1|
|説明|A color to use for the first set of squares.|
|型|CIColor|
|Default値|(1 1 1 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

# CICircleSplashDistortion

## フィルタ名
Circle Splash Distortion

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICircleSplashDistortion

## 所属カテゴリ
CICategoryDistortionEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The center of the effect as x and y coordinates.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|150|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1000|

# CICircularScreen

## フィルタ名
Circular Screen

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICircularScreen

## 所属カテゴリ
CICategoryHalftoneEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The distance between each circle in the pattern.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|6|
|最小値, 最大値|1 ~ 無し|
|スライダー最小値, 最大値|2 ~ 50|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the circular screen pattern|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputSharpness
|項目|内容|
|:--|:--|
|パラメーター名|Sharpness|
|説明|The sharpness of the circles. The larger the value, the sharper the circles.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.7|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

# CICircularWrap

## フィルタ名
Circular Wrap Distortion

## SDKs
iOS 9+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICircularWrap

## 所属カテゴリ
CICategoryDistortionEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The center of the effect as x and y coordinates.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|150|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 600|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle of the effect.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

# CIClamp

## フィルタ名
Clamp

## SDKs
iOS 10+ / macOS 10.12+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIClamp

## 所属カテゴリ
CICategoryTileEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputExtent
|項目|内容|
|:--|:--|
|パラメーター名|Extent|
|説明|A rectangle that defines the extent of the effect.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値|[0 0 640 80]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CICMYKHalftone

## フィルタ名
CMYK Halftone

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICMYKHalftone

## 所属カテゴリ
CICategoryHalftoneEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputGCR
|項目|内容|
|:--|:--|
|パラメーター名|Gray Component Replacement|
|説明|The gray component replacement value. The value can vary from 0.0 (none) to 1.0.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1, 1|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1|
|パラメーターセット|CIUISetIntermediate|

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The distance between dots in the pattern.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|6, 6|
|最小値, 最大値|-2 ~ 無し|
|スライダー最小値, 最大値|2 ~ 100|
|パラメーターセット|CIUISetBasic|

### inputSharpness
|項目|内容|
|:--|:--|
|パラメーター名|Sharpness|
|説明|The sharpness of the pattern. The larger the value, the sharper the pattern.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|0.7|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1|
|パラメーターセット|CIUISetBasic|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle of the pattern.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputUCR
|項目|内容|
|:--|:--|
|パラメーター名|Under Color Removal|
|説明|The under color removal value. The value can vary from 0.0 to 1.0. |
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0.5, 0.5|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1|
|パラメーターセット|CIUISetIntermediate|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the halftone pattern|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

# CIColorBlendMode

## フィルタ名
Color Blend Mode

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIColorBurnBlendMode

## フィルタ名
Color Burn Blend Mode

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorBurnBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIColorClamp

## フィルタ名
Color Clamp

## SDKs
iOS 7+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorClamp

## 所属カテゴリ
CICategoryColorAdjustment, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputMinComponents
|項目|内容|
|:--|:--|
|パラメーター名|Min Components|
|説明|Lower clamping values|
|型|CIVector|
|Default値|[0 0 0 0]|

### inputMaxComponents
|項目|内容|
|:--|:--|
|パラメーター名|Max Components|
|説明|Higher clamping values|
|型|CIVector|
|Default値|[1 1 1 1]|

# CIColorControls

## フィルタ名
Color Controls

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorControls

## 所属カテゴリ
CICategoryColorAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputSaturation
|項目|内容|
|:--|:--|
|パラメーター名|Saturation|
|説明|The amount of saturation to apply. The larger the value, the more saturated the result.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1, 1|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 2|

### inputBrightness
|項目|内容|
|:--|:--|
|パラメーター名|Brightness|
|説明|The amount of brightness to apply. The larger the value, the brighter the result.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|-1 ~ 無し|
|スライダー最小値, 最大値|-1 ~ 1|

### inputContrast
|項目|内容|
|:--|:--|
|パラメーター名|Contrast|
|説明|The amount of contrast to apply. The larger the value, the more contrast in the resulting image.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1, 1|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0.25 ~ 4|

# CIColorCrossPolynomial

## フィルタ名
Color Cross Polynomial

## SDKs
iOS 7+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCrossPolynomial

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputBlueCoefficients
|項目|内容|
|:--|:--|
|パラメーター名|Blue Coefficients|
|説明|Polynomial coefficients for blue channel|
|型|CIVector|
|Default値, Identity値|[0 0 1 0 0 0 0 0 0 0], [0 0 1 0 0 0 0 0 0 0]|

### inputRedCoefficients
|項目|内容|
|:--|:--|
|パラメーター名|Red Coefficients|
|説明|Polynomial coefficients for red channel|
|型|CIVector|
|Default値, Identity値|[1 0 0 0 0 0 0 0 0 0], [1 0 0 0 0 0 0 0 0 0]|

### inputGreenCoefficients
|項目|内容|
|:--|:--|
|パラメーター名|Green Coefficients|
|説明|Polynomial coefficients for green channel|
|型|CIVector|
|Default値, Identity値|[0 1 0 0 0 0 0 0 0 0], [0 1 0 0 0 0 0 0 0 0]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIColorCube

## フィルタ名
Color Cube

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCube

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputCubeDimension
|項目|内容|
|:--|:--|
|パラメーター名|Cube Dimension|
|タイプ|CIAttributeTypeCount|
|型|NSNumber|
|Default値, Identity値|2, 2|
|最小値, 最大値|2 ~ 64|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputCubeData
|項目|内容|
|:--|:--|
|パラメーター名|Cube Data|
|説明|Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.|
|型|NSData|
|Default値, Identity値|<00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>, <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>|

# CIColorCubesMixedWithMask

## フィルタ名
Color Cubes Mixed With Mask

## SDKs
iOS 11+ / macOS 10.13+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCubesMixedWithMask

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputMaskImage
|項目|内容|
|:--|:--|
|パラメーター名|Mask Image|
|説明|A masking image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputColorSpace
|項目|内容|
|:--|:--|
|パラメーター名|Color Space|
|型|NSObject|

### inputCubeDimension
|項目|内容|
|:--|:--|
|パラメーター名|Cube Dimension|
|タイプ|CIAttributeTypeCount|
|型|NSNumber|
|Default値, Identity値|2, 2|
|最小値, 最大値|2 ~ 64|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputCube0Data
|項目|内容|
|:--|:--|
|パラメーター名|Cube 0 Data|
|説明|Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.|
|型|NSData|
|Default値, Identity値|<00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>, <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>|

### inputCube1Data
|項目|内容|
|:--|:--|
|パラメーター名|Cube 1 Data|
|説明|Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.|
|型|NSData|
|Default値, Identity値|<00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>, <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>|

# CIColorCubeWithColorSpace

## フィルタ名
Color Cube with ColorSpace

## SDKs
iOS 7+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCubeWithColorSpace

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputColorSpace
|項目|内容|
|:--|:--|
|パラメーター名|Color Space|
|型|NSObject|

### inputCubeDimension
|項目|内容|
|:--|:--|
|パラメーター名|Cube Dimension|
|タイプ|CIAttributeTypeCount|
|型|NSNumber|
|Default値, Identity値|2, 2|
|最小値, 最大値|2 ~ 64|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputCubeData
|項目|内容|
|:--|:--|
|パラメーター名|Cube Data|
|説明|Data containing a 3-dimensional color table of floating-point premultiplied RGBA values. The cells are organized in a standard ordering. The columns and rows of the data are indexed by red and green, respectively. Each data plane is followed by the next higher plane in the data, with planes indexed by blue.|
|型|NSData|
|Default値, Identity値|<00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>, <00000000 00000000 00000000 0000803f 0000803f 00000000 00000000 0000803f 00000000 0000803f 00000000 0000803f 0000803f 0000803f 00000000 0000803f 00000000 00000000 0000803f 0000803f 0000803f 00000000 0000803f 0000803f 00000000 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f 0000803f>|

# CIColorCurves

## フィルタ名
Color Curves

## SDKs
iOS 11+ / macOS 10.13+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorCurves

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputColorSpace
|項目|内容|
|:--|:--|
|パラメーター名|Color Space|
|型|NSObject|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputCurvesDomain
|項目|内容|
|:--|:--|
|パラメーター名|Curves Domain|
|型|CIVector|
|Default値|[0 1]|

### inputCurvesData
|項目|内容|
|:--|:--|
|パラメーター名|Curves Data|
|型|NSData|
|Default値|<00000000 00000000 00000000 0000003f 0000003f 0000003f 0000803f 0000803f 0000803f>|

# CIColorDodgeBlendMode

## フィルタ名
Color Dodge Blend Mode

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorDodgeBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIColorInvert

## フィルタ名
Color Invert

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorInvert

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIColorMap

## フィルタ名
Color Map

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMap

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputGradientImage
|項目|内容|
|:--|:--|
|パラメーター名|Gradient Image|
|説明|The image data from this image transforms the source image values.|
|タイプ|CIAttributeTypeGradient|
|型|CIImage|

# CIColorMatrix

## フィルタ名
Color Matrix

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMatrix

## 所属カテゴリ
CICategoryColorAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputGVector
|項目|内容|
|:--|:--|
|パラメーター名|Green Vector|
|説明|The amount of green to multiply the source color values by.|
|型|CIVector|
|Default値, Identity値|[0 1 0 0], [0 1 0 0]|

### inputRVector
|項目|内容|
|:--|:--|
|パラメーター名|Red Vector|
|説明|The amount of red to multiply the source color values by.|
|型|CIVector|
|Default値, Identity値|[1 0 0 0], [1 0 0 0]|

### inputBiasVector
|項目|内容|
|:--|:--|
|パラメーター名|Bias Vector|
|説明|A vector that’s added to each color component.|
|型|CIVector|
|Default値, Identity値|[0 0 0 0], [0 0 0 0]|

### inputBVector
|項目|内容|
|:--|:--|
|パラメーター名|Blue Vector|
|説明|The amount of blue to multiply the source color values by.|
|型|CIVector|
|Default値, Identity値|[0 0 1 0], [0 0 1 0]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAVector
|項目|内容|
|:--|:--|
|パラメーター名|Alpha Vector|
|説明|The amount of alpha to multiply the source color values by.|
|型|CIVector|
|Default値, Identity値|[0 0 0 1], [0 0 0 1]|

# CIColorMonochrome

## フィルタ名
Color Monochrome

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorMonochrome

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputColor
|項目|内容|
|:--|:--|
|パラメーター名|Color|
|説明|The monochrome color to apply to the image.|
|タイプ|CIAttributeTypeOpaqueColor|
|型|CIColor|
|Default値|(0.6 0.45 0.3 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputIntensity
|項目|内容|
|:--|:--|
|パラメーター名|Intensity|
|説明|The intensity of the monochrome effect. A value of 1.0 creates a monochrome image using the supplied color. A value of 0.0 has no effect on the image.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1|

# CIColorPolynomial

## フィルタ名
Color Polynomial

## SDKs
iOS 7+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorPolynomial

## 所属カテゴリ
CICategoryColorAdjustment, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputBlueCoefficients
|項目|内容|
|:--|:--|
|パラメーター名|Blue Coefficients|
|説明|Polynomial coefficients for blue channel|
|型|CIVector|
|Default値, Identity値|[0 1 0 0], [0 1 0 0]|

### inputAlphaCoefficients
|項目|内容|
|:--|:--|
|パラメーター名|Alpha Coefficients|
|説明|Polynomial coefficients for alpha channel|
|型|CIVector|
|Default値, Identity値|[0 1 0 0], [0 1 0 0]|

### inputRedCoefficients
|項目|内容|
|:--|:--|
|パラメーター名|Red Coefficients|
|説明|Polynomial coefficients for red channel|
|型|CIVector|
|Default値, Identity値|[0 1 0 0], [0 1 0 0]|

### inputGreenCoefficients
|項目|内容|
|:--|:--|
|パラメーター名|Green Coefficients|
|説明|Polynomial coefficients for green channel|
|型|CIVector|
|Default値, Identity値|[0 1 0 0], [0 1 0 0]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIColorPosterize

## フィルタ名
Color Posterize

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColorPosterize

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputLevels
|項目|内容|
|:--|:--|
|パラメーター名|Levels|
|説明|The number of brightness levels to use for each color component. Lower values result in a more extreme poster effect.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|6, 300|
|最小値, 最大値|1 ~ 無し|
|スライダー最小値, 最大値|2 ~ 30|

# CIColumnAverage

## フィルタ名
Column Average

## SDKs
iOS 9+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIColumnAverage

## 所属カテゴリ
CICategoryReduction, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputExtent
|項目|内容|
|:--|:--|
|パラメーター名|Extent|
|説明|A rectangle that specifies the subregion of the image that you want to process.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値|[0 0 640 80]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to process.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIComicEffect

## フィルタ名
Comic Effect

## SDKs
iOS 9+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIComicEffect

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIConstantColorGenerator

## フィルタ名
Constant Color

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConstantColorGenerator

## 所属カテゴリ
CICategoryGenerator, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputColor
|項目|内容|
|:--|:--|
|パラメーター名|Color|
|説明|The color to generate.|
|タイプ|CIAttributeTypeColor|
|型|CIColor|
|Default値|(1 0 0 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

# CIConvolution3X3

## フィルタ名
3 by 3 convolution

## SDKs
iOS 7+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolution3X3

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputBias
|項目|内容|
|:--|:--|
|パラメーター名|Bias|
|型|NSNumber|
|Default値, Identity値|0, 0|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputWeights
|項目|内容|
|:--|:--|
|パラメーター名|Weights|
|型|CIVector|
|Default値, Identity値|[0 0 0 0 1 0 0 0 0], [0 0 0 0 1 0 0 0 0]|

# CIConvolution5X5

## フィルタ名
5 by 5 convolution

## SDKs
iOS 7+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolution5X5

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputBias
|項目|内容|
|:--|:--|
|パラメーター名|Bias|
|型|NSNumber|
|Default値, Identity値|0, 0|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputWeights
|項目|内容|
|:--|:--|
|パラメーター名|Weights|
|型|CIVector|
|Default値, Identity値|[0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0], [0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0]|

# CIConvolution7X7

## フィルタ名
7 by 7 convolution

## SDKs
iOS 9+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolution7X7

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputBias
|項目|内容|
|:--|:--|
|パラメーター名|Bias|
|型|NSNumber|
|Default値, Identity値|0, 0|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputWeights
|項目|内容|
|:--|:--|
|パラメーター名|Weights|
|型|CIVector|
|Default値, Identity値|[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0], [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]|

# CIConvolution9Horizontal

## フィルタ名
Horizontal 9 Convolution

## SDKs
iOS 7+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolution9Horizontal

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputBias
|項目|内容|
|:--|:--|
|パラメーター名|Bias|
|型|NSNumber|
|Default値, Identity値|0, 0|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputWeights
|項目|内容|
|:--|:--|
|パラメーター名|Weights|
|型|CIVector|
|Default値, Identity値|[0 0 0 0 1 0 0 0 0], [0 0 0 0 1 0 0 0 0]|

# CIConvolution9Vertical

## フィルタ名
Vertical 9 Convolution

## SDKs
iOS 7+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIConvolution9Vertical

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputBias
|項目|内容|
|:--|:--|
|パラメーター名|Bias|
|型|NSNumber|
|Default値, Identity値|0, 0|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputWeights
|項目|内容|
|:--|:--|
|パラメーター名|Weights|
|型|CIVector|
|Default値, Identity値|[0 0 0 0 1 0 0 0 0], [0 0 0 0 1 0 0 0 0]|

# CICopyMachineTransition

## フィルタ名
Copy Machine

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICopyMachineTransition

## 所属カテゴリ
CICategoryTransition, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The width of the copier light. |
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|200, 200|
|最小値, 最大値|0.1 ~ 無し|
|スライダー最小値, 最大値|0.1 ~ 500|

### inputTargetImage
|項目|内容|
|:--|:--|
|パラメーター名|Target Image|
|説明|The target image for a transition.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle of the copier light.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 6.283185307179586|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputColor
|項目|内容|
|:--|:--|
|パラメーター名|Color|
|説明|The color of the copier light.|
|タイプ|CIAttributeTypeOpaqueColor|
|型|CIColor|
|Default値|(0.6 1 0.8 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputTime
|項目|内容|
|:--|:--|
|パラメーター名|Time|
|説明|The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).|
|タイプ|CIAttributeTypeTime|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputOpacity
|項目|内容|
|:--|:--|
|パラメーター名|Opacity|
|説明|The opacity of the copier light. A value of 0.0 is transparent. A value of 1.0 is opaque.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1.3, 1.3|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 3|

### inputExtent
|項目|内容|
|:--|:--|
|パラメーター名|Extent|
|説明|A rectangle that defines the extent of the effect.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値|[0 0 300 300]|

# CICoreMLModelFilter

## フィルタ名
CoreML Model Filter

## SDKs
iOS 12+ / macOS 10.14+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICoreMLModelFilter

## 所属カテゴリ
CICategoryStillImage, CICategoryBuiltIn, CICategoryStylize

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputModel
|項目|内容|
|:--|:--|
|パラメーター名|Model|
|説明|The CoreML model to be used for applying effect on the image.|
|型|MLModel|

# CICrop

## フィルタ名
Crop

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICrop

## 所属カテゴリ
CICategoryGeometryAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputRectangle
|項目|内容|
|:--|:--|
|パラメーター名|Rectangle|
|説明|The rectangle that specifies the crop to apply to the image.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値, Identity値|[-8.98847e+307 -8.98847e+307 1.79769e+308 1.79769e+308], [-8.98847e+307 -8.98847e+307 1.79769e+308 1.79769e+308]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CICrystallize

## フィルタ名
Crystallize

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CICrystallize

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The center of the effect as x and y coordinates.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius determines how many pixels are used to create the effect. The larger the radius, the larger the resulting crystals.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|20, 1|
|最小値, 最大値|1 ~ 無し|
|スライダー最小値, 最大値|1 ~ 100|

# CIDarkenBlendMode

## フィルタ名
Darken Blend Mode

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDarkenBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIDepthBlurEffect

## フィルタ名
Depth Blur Effect

## SDKs
iOS 11+ / macOS 10.13+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDepthBlurEffect

## 所属カテゴリ
CICategoryBlur, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputLeftEyePositions
|項目|内容|
|:--|:--|
|パラメーター名|Left Eye Positions|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[-1 -1]|

### inputNosePositions
|項目|内容|
|:--|:--|
|パラメーター名|Nose Positions|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[-1 -1]|

### inputDisparityImage
|項目|内容|
|:--|:--|
|パラメーター名|Disparity Image|
|型|CIImage|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAperture
|項目|内容|
|:--|:--|
|パラメーター名|Aperture|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0|
|最小値, 最大値|0 ~ 22|
|スライダー最小値, 最大値|1 ~ 22|

### inputMatteImage
|項目|内容|
|:--|:--|
|パラメーター名|Matte Image|
|説明|A matting image.|
|型|CIImage|

### inputLumaNoiseScale
|項目|内容|
|:--|:--|
|パラメーター名|Luma Noise Scale|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0|
|最小値, 最大値|0 ~ 0.1|
|スライダー最小値, 最大値|0 ~ 0.1|

### inputScaleFactor
|項目|内容|
|:--|:--|
|パラメーター名|Scale Factor|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|1|
|スライダー最小値, 最大値|0 ~ 1|

### inputShape
|項目|内容|
|:--|:--|
|パラメーター名|Shape|
|型|NSString|

### inputRightEyePositions
|項目|内容|
|:--|:--|
|パラメーター名|Right Eye Positions|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[-1 -1]|

### inputFocusRect
|項目|内容|
|:--|:--|
|パラメーター名|Focus Rectangle|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Identity値|[-8.98847e+307 -8.98847e+307 1.79769e+308 1.79769e+308]|

### inputChinPositions
|項目|内容|
|:--|:--|
|パラメーター名|Chin Positions|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[-1 -1]|

### inputCalibrationData
|項目|内容|
|:--|:--|
|パラメーター名|Calibration Data|
|型|AVCameraCalibrationData|

### inputAuxDataMetadata
|項目|内容|
|:--|:--|
|パラメーター名|Aux Data Metadata|
|型|CGImageMetadataRef|

# CIDepthOfField

## フィルタ名
Depth of Field

## SDKs
iOS 9+ / macOS 10.6+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDepthOfField

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputUnsharpMaskRadius
|項目|内容|
|:--|:--|
|パラメーター名|Unsharp Mask Radius|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|2.5|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 10|

### inputSaturation
|項目|内容|
|:--|:--|
|パラメーター名|Saturation|
|説明|The amount to adjust the saturation.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|1.5|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 10|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The distance from the center of the effect.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|6|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 30|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputPoint1
|項目|内容|
|:--|:--|
|パラメーター名|Point 1|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[300 300]|

### inputPoint0
|項目|内容|
|:--|:--|
|パラメーター名|Point 0|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[0 300]|

### inputUnsharpMaskIntensity
|項目|内容|
|:--|:--|
|パラメーター名|Unsharp Mask Intensity|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.5|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 10|

# CIDepthToDisparity

## フィルタ名
Depth To Disparity

## SDKs
iOS 11+ / macOS 10.13+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDepthToDisparity

## 所属カテゴリ
CICategoryColorAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The input depth data image to convert to disparity data.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIDifferenceBlendMode

## フィルタ名
Difference Blend Mode

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDifferenceBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIDiscBlur

## フィルタ名
Disc Blur

## SDKs
iOS 9+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDiscBlur

## 所属カテゴリ
CICategoryBlur, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|8|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 100|

# CIDisintegrateWithMaskTransition

## フィルタ名
Disintegrate With Mask

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDisintegrateWithMaskTransition

## 所属カテゴリ
CICategoryTransition, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputShadowRadius
|項目|内容|
|:--|:--|
|パラメーター名|Shadow Radius|
|説明|The radius of the shadow created by the mask.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|8|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 50|

### inputTargetImage
|項目|内容|
|:--|:--|
|パラメーター名|Target Image|
|説明|The target image for a transition.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputShadowOffset
|項目|内容|
|:--|:--|
|パラメーター名|Shadow Offset|
|説明|The offset of the shadow created by the mask.|
|タイプ|CIAttributeTypeOffset|
|型|CIVector|
|Default値, Identity値|[0 -10], [0 0]|

### inputTime
|項目|内容|
|:--|:--|
|パラメーター名|Time|
|説明|The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).|
|タイプ|CIAttributeTypeTime|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputMaskImage
|項目|内容|
|:--|:--|
|パラメーター名|Mask Image|
|説明|An image that defines the shape to use when disintegrating from the source to the target image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputShadowDensity
|項目|内容|
|:--|:--|
|パラメーター名|Shadow Density|
|説明|The density of the shadow created by the mask.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0.65, 0|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

# CIDisparityToDepth

## フィルタ名
Disparity To Depth

## SDKs
iOS 11+ / macOS 10.13+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDisparityToDepth

## 所属カテゴリ
CICategoryColorAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The input disparity data image to convert to depth data.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIDisplacementDistortion

## フィルタ名
Displacement Distortion

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDisplacementDistortion

## 所属カテゴリ
CICategoryDistortionEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputDisplacementImage
|項目|内容|
|:--|:--|
|パラメーター名|Displacement Image|
|説明|An image whose grayscale values will be applied to the source image.|
|型|CIImage|

### inputScale
|項目|内容|
|:--|:--|
|パラメーター名|Scale|
|説明|The amount of texturing of the resulting image. The larger the value, the greater the texturing.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|50, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 200|

# CIDissolveTransition

## フィルタ名
Dissolve

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDissolveTransition

## 所属カテゴリ
CICategoryTransition, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputTime
|項目|内容|
|:--|:--|
|パラメーター名|Time|
|説明|The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).|
|タイプ|CIAttributeTypeTime|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputTargetImage
|項目|内容|
|:--|:--|
|パラメーター名|Target Image|
|説明|The target image for a transition.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIDither

## フィルタ名
Dither

## SDKs
iOS 12+ / macOS 10.14+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDither

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputIntensity
|項目|内容|
|:--|:--|
|パラメーター名|Intensity|
|説明|The intensity of the effect.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0.1, 0|
|最小値, 最大値|0 ~ 5|
|スライダー最小値, 最大値|0 ~ 1|

# CIDivideBlendMode

## フィルタ名
Divide Blend Mode

## SDKs
iOS 8+ / macOS 10.10+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDivideBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIDotScreen

## フィルタ名
Dot Screen

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDotScreen

## 所属カテゴリ
CICategoryHalftoneEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The distance between dots in the pattern.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|6|
|最小値, 最大値|1 ~ 無し|
|スライダー最小値, 最大値|2 ~ 50|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the dot screen pattern|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputSharpness
|項目|内容|
|:--|:--|
|パラメーター名|Sharpness|
|説明|The sharpness of the pattern. The larger the value, the sharper the pattern.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.7|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle of the pattern.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

# CIDroste

## フィルタ名
Droste

## SDKs
iOS 9+ / macOS 10.6+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIDroste

## 所属カテゴリ
CICategoryDistortionEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputRotation
|項目|内容|
|:--|:--|
|パラメーター名|Rotation|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値|0|
|スライダー最小値, 最大値|0 ~ 6.283185307179586|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputInsetPoint1
|項目|内容|
|:--|:--|
|パラメーター名|Inset Point 1|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[400 400]|

### inputPeriodicity
|項目|内容|
|:--|:--|
|パラメーター名|Periodicity|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|1|
|最小値, 最大値|1 ~ 無し|
|スライダー最小値, 最大値|1 ~ 5|

### inputInsetPoint0
|項目|内容|
|:--|:--|
|パラメーター名|Inset Point 0|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[200 200]|

### inputZoom
|項目|内容|
|:--|:--|
|パラメーター名|Zoom|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|1|
|最小値, 最大値|0.01 ~ 無し|
|スライダー最小値, 最大値|0.01 ~ 5|

### inputStrands
|項目|内容|
|:--|:--|
|パラメーター名|Strands|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|1|
|最小値, 最大値|-10 ~ 10|
|スライダー最小値, 最大値|-2 ~ 2|

# CIEdgePreserveUpsampleFilter

## フィルタ名
Edge Preserve Upsample Filter

## SDKs
iOS 10+ / macOS 10.12+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIEdgePreserveUpsampleFilter

## 所属カテゴリ
CICategoryGeometryAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputLumaSigma
|項目|内容|
|:--|:--|
|パラメーター名|Luma Sigma|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.15|
|最小値, 最大値|0 ~ 1|

### inputSmallImage
|項目|内容|
|:--|:--|
|パラメーター名|Small Image|
|型|CIImage|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputSpatialSigma
|項目|内容|
|:--|:--|
|パラメーター名|Spatial Sigma|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|3|
|最小値, 最大値|0 ~ 5|

# CIEdges

## フィルタ名
Edges

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIEdges

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputIntensity
|項目|内容|
|:--|:--|
|パラメーター名|Intensity|
|説明|The intensity of the edges. The larger the value, the higher the intensity.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 10|

# CIEdgeWork

## フィルタ名
Edge Work

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIEdgeWork

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The thickness of the edges. The larger the value, the thicker the edges.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|3|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 20|

# CIEightfoldReflectedTile

## フィルタ名
Eightfold Reflected Tile

## SDKs
iOS 6+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIEightfoldReflectedTile

## 所属カテゴリ
CICategoryTileEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The width of a tile.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|100, 100|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|1 ~ 200|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the effect|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle (in radians) of the tiled pattern.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

# CIExclusionBlendMode

## フィルタ名
Exclusion Blend Mode

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIExclusionBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIExposureAdjust

## フィルタ名
Exposure Adjust

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIExposureAdjust

## 所属カテゴリ
CICategoryColorAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn, CICategoryXMPSerializable

## パラメータ

### inputEV
|項目|内容|
|:--|:--|
|パラメーター名|EV|
|説明|The amount to adjust the exposure of the image by. The larger the value, the brighter the exposure.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-10 ~ 10|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIFalseColor

## フィルタ名
False Color

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFalseColor

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputColor0
|項目|内容|
|:--|:--|
|パラメーター名|Color 1|
|説明|The first color to use for the color ramp.|
|タイプ|CIAttributeTypeColor|
|型|CIColor|
|Default値|(0.3 0 0 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputColor1
|項目|内容|
|:--|:--|
|パラメーター名|Color 2|
|説明|The second color to use for the color ramp.|
|タイプ|CIAttributeTypeColor|
|型|CIColor|
|Default値|(1 0.9 0.8 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

# CIFlashTransition

## フィルタ名
Flash

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFlashTransition

## 所属カテゴリ
CICategoryTransition, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputTargetImage
|項目|内容|
|:--|:--|
|パラメーター名|Target Image|
|説明|The target image for a transition.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputFadeThreshold
|項目|内容|
|:--|:--|
|パラメーター名|Fade Threshold|
|説明|The amount of fade between the flash and the target image. The higher the value, the more flash time and the less fade time.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.85|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputStriationStrength
|項目|内容|
|:--|:--|
|パラメーター名|Striation Strength|
|説明|The strength of the light rays emanating from the flash.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.5|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 3|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the effect|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputStriationContrast
|項目|内容|
|:--|:--|
|パラメーター名|Striation Contrast|
|説明|The contrast of the light rays emanating from the flash.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|1.375|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 5|

### inputColor
|項目|内容|
|:--|:--|
|パラメーター名|Color|
|説明|The color of the light rays emanating from the flash.|
|タイプ|CIAttributeTypeColor|
|型|CIColor|
|Default値|(1 0.8 0.6 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputTime
|項目|内容|
|:--|:--|
|パラメーター名|Time|
|説明|The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).|
|タイプ|CIAttributeTypeTime|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputExtent
|項目|内容|
|:--|:--|
|パラメーター名|Extent|
|説明|The extent of the flash.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値|[0 0 300 300]|

### inputMaxStriationRadius
|項目|内容|
|:--|:--|
|パラメーター名|Maximum Striation Radius|
|説明|The radius of the light rays emanating from the flash.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|2.58|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 10|

# CIFourfoldReflectedTile

## フィルタ名
Fourfold Reflected Tile

## SDKs
iOS 6+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFourfoldReflectedTile

## 所属カテゴリ
CICategoryTileEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The width of a tile.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|100, 100|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|1 ~ 200|

### inputAcuteAngle
|項目|内容|
|:--|:--|
|パラメーター名|Acute Angle|
|説明|The primary angle for the repeating reflected tile. Small values create thin diamond tiles, and higher values create fatter reflected tiles.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|1.570796326794897, 1.570796326794897|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the effect|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle (in radians) of the tiled pattern.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

# CIFourfoldRotatedTile

## フィルタ名
Fourfold Rotated Tile

## SDKs
iOS 6+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFourfoldRotatedTile

## 所属カテゴリ
CICategoryTileEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The width of a tile.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|100, 100|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|1 ~ 200|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the effect|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle (in radians) of the tiled pattern.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

# CIFourfoldTranslatedTile

## フィルタ名
Fourfold Translated Tile

## SDKs
iOS 6+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIFourfoldTranslatedTile

## 所属カテゴリ
CICategoryTileEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The width of a tile.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|100, 100|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|1 ~ 200|

### inputAcuteAngle
|項目|内容|
|:--|:--|
|パラメーター名|Acute Angle|
|説明|The primary angle for the repeating translated tile. Small values create thin diamond tiles, and higher values create fatter translated tiles.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|1.570796326794897, 1.570796326794897|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the effect|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle (in radians) of the tiled pattern.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

# CIGammaAdjust

## フィルタ名
Gamma Adjust

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGammaAdjust

## 所属カテゴリ
CICategoryColorAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputPower
|項目|内容|
|:--|:--|
|パラメーター名|Power|
|説明|A gamma value to use to correct image brightness. The larger the value, the darker the result.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1, 1|
|スライダー最小値, 最大値|0.25 ~ 4|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIGaussianBlur

## フィルタ名
Gaussian Blur

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGaussianBlur

## 所属カテゴリ
CICategoryBlur, CICategoryStillImage, CICategoryVideo, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|10, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 100|

# CIGaussianGradient

## フィルタ名
Gaussian Gradient

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGaussianGradient

## 所属カテゴリ
CICategoryGradient, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius of the Gaussian distribution.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|300|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 800|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The center of the effect as x and y coordinates.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputColor1
|項目|内容|
|:--|:--|
|パラメーター名|Color 2|
|説明|The second color to use in the gradient.|
|タイプ|CIAttributeTypeColor|
|型|CIColor|
|Default値|(0 0 0 0) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputColor0
|項目|内容|
|:--|:--|
|パラメーター名|Color 1|
|説明|The first color to use in the gradient.|
|タイプ|CIAttributeTypeColor|
|型|CIColor|
|Default値|(1 1 1 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

# CIGlassDistortion

## フィルタ名
Glass Distortion

## SDKs
iOS 8+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGlassDistortion

## 所属カテゴリ
CICategoryDistortionEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The center of the effect as x and y coordinates.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputTexture
|項目|内容|
|:--|:--|
|パラメーター名|Texture|
|説明|A texture to apply to the source image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputScale
|項目|内容|
|:--|:--|
|パラメーター名|Scale|
|説明|The amount of texturing of the resulting image. The larger the value, the greater the texturing.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|200, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0.01 ~ 500|

# CIGlassLozenge

## フィルタ名
Glass Lozenge

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGlassLozenge

## 所属カテゴリ
CICategoryDistortionEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputRefraction
|項目|内容|
|:--|:--|
|パラメーター名|Refraction|
|説明|The refraction of the glass.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1.7, 1|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 5|

### inputPoint0
|項目|内容|
|:--|:--|
|パラメーター名|Point 0|
|説明|The x and y position that defines the center of the circle at one end of the lozenge.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputPoint1
|項目|内容|
|:--|:--|
|パラメーター名|Point 1|
|説明|The x and y position that defines the center of the circle at the other end of the lozenge.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[350 150]|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius of the lozenge. The larger the radius, the wider the extent of the distortion.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|100, 100|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1000|

# CIGlideReflectedTile

## フィルタ名
Glide Reflected Tile

## SDKs
iOS 6+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGlideReflectedTile

## 所属カテゴリ
CICategoryTileEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The width of a tile.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|100, 100|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|1 ~ 200|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the effect|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle (in radians) of the tiled pattern.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

# CIGloom

## フィルタ名
Gloom

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGloom

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius determines how many pixels are used to create the effect. The larger the radius, the greater the effect.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|10, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 100|

### inputIntensity
|項目|内容|
|:--|:--|
|パラメーター名|Intensity|
|説明|The intensity of the effect. A value of 0.0 is no effect. A value of 1.0 is the maximum effect.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0.5, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1|

# CIGuidedFilter

## フィルタ名
Guided Filter

## SDKs
iOS 12+ / macOS 10.14+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIGuidedFilter

## 所属カテゴリ
CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|A small image to upsample.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputGuideImage
|項目|内容|
|:--|:--|
|パラメーター名|A larger image to use as a guide.|
|説明|A larger image to use as a guide.|
|型|CIImage|

### inputEpsilon
|項目|内容|
|:--|:--|
|パラメーター名|Epsilon|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.0001|
|スライダー最小値, 最大値|1e-09 ~ 0.1|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The distance from the center of the effect.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|1|
|スライダー最小値, 最大値|1 ~ 10|

# CIHardLightBlendMode

## フィルタ名
Hard Light Blend Mode

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHardLightBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIHatchedScreen

## フィルタ名
Hatched Screen

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHatchedScreen

## 所属カテゴリ
CICategoryHalftoneEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The distance between lines in the pattern.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|6|
|最小値, 最大値|1 ~ 無し|
|スライダー最小値, 最大値|2 ~ 50|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the hatched screen pattern|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputSharpness
|項目|内容|
|:--|:--|
|パラメーター名|Sharpness|
|説明|The amount of sharpening to apply.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.7|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle of the pattern.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

# CIHeightFieldFromMask

## フィルタ名
Height Field From Mask

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHeightFieldFromMask

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The white values of the mask define those pixels that are inside the height field while the black values define those pixels that are outside. The field varies smoothly and continuously inside the mask, reaching the value 0 at the edge of the mask.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The distance from the edge of the mask for the smooth transition is proportional to the input radius. Larger values make the transition smoother and more pronounced. Smaller values make the transition approximate a fillet radius.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|10, 10|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 300|

# CIHexagonalPixellate

## フィルタ名
Hexagonal Pixelate

## SDKs
iOS 9+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHexagonalPixellate

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the effect|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputScale
|項目|内容|
|:--|:--|
|パラメーター名|Scale|
|説明|The scale determines the size of the hexagons. Larger values result in larger hexagons.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|8, 1|
|最小値, 最大値|1 ~ 無し|
|スライダー最小値, 最大値|1 ~ 100|

# CIHighlightShadowAdjust

## フィルタ名
Highlight and Shadow Adjust

## SDKs
iOS 5+ / macOS 10.7+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHighlightShadowAdjust

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputHighlightAmount
|項目|内容|
|:--|:--|
|パラメーター名|Highlight Amount|
|説明|The amount of adjustment to the highlights of the image.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1, 1|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0.3 ~ 1|

### inputShadowAmount
|項目|内容|
|:--|:--|
|パラメーター名|Shadow Amount|
|説明|The amount of adjustment to the shadows of the image.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|-1 ~ 1|
|スライダー最小値, 最大値|-1 ~ 1|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|Shadow Highlight Radius|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 10|

# CIHistogramDisplayFilter

## フィルタ名
Histogram Display

## SDKs
iOS 8+ / macOS 10.?+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHistogramDisplayFilter

## 所属カテゴリ
CICategoryReduction, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputLowLimit
|項目|内容|
|:--|:--|
|パラメーター名|Low Limit|
|説明|The fraction of the left portion of the histogram image to make darker|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputHighLimit
|項目|内容|
|:--|:--|
|パラメーター名|High Limit|
|説明|The fraction of the right portion of the histogram image to make lighter.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|1|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputHeight
|項目|内容|
|:--|:--|
|パラメーター名|Height|
|説明|The height of the displayable histogram image.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|100|
|最小値, 最大値|1 ~ 200|
|スライダー最小値, 最大値|1 ~ 100|

# CIHoleDistortion

## フィルタ名
Hole Distortion

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHoleDistortion

## 所属カテゴリ
CICategoryDistortionEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The center of the effect as x and y coordinates.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|150, 0.1|
|最小値, 最大値|0.01 ~ 無し|
|スライダー最小値, 最大値|0.01 ~ 1000|

# CIHueAdjust

## フィルタ名
Hue Adjust

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHueAdjust

## 所属カテゴリ
CICategoryColorAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|An angle (in radians) to use to correct the hue of an image.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

# CIHueBlendMode

## フィルタ名
Hue Blend Mode

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHueBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIHueSaturationValueGradient

## フィルタ名
Hue/Saturation/Value Gradient

## SDKs
iOS 10+ / macOS 10.12+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIHueSaturationValueGradient

## 所属カテゴリ
CICategoryGradient, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputSoftness
|項目|内容|
|:--|:--|
|パラメーター名|Softness|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|1|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1|

### inputColorSpace
|項目|内容|
|:--|:--|
|パラメーター名|Color Space|
|説明|The CGColorSpaceRef that the color wheel should be generated in.|
|型|NSObject|
|Default値|<CGColorSpace 0x600000c0a460> (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1)|

### inputValue
|項目|内容|
|:--|:--|
|パラメーター名|Value|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|1|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1|

### inputDither
|項目|内容|
|:--|:--|
|パラメーター名|Dither|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|1|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 3|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The distance from the center of the effect.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|300|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 800|

# CIKaleidoscope

## フィルタ名
Kaleidoscope

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIKaleidoscope

## 所属カテゴリ
CICategoryTileEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the effect|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputCount
|項目|内容|
|:--|:--|
|パラメーター名|Count|
|説明|The number of reflections in the pattern.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|6|
|最小値, 最大値|1 ~ 無し|
|スライダー最小値, 最大値|1 ~ 64|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle of reflection.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

# CILabDeltaE

## フィルタ名
Lab ∆E

## SDKs
iOS 11+ / macOS 10.13+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILabDeltaE

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The first input image for comparison.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputImage2
|項目|内容|
|:--|:--|
|パラメーター名|Image2|
|説明|The second input image for comparison.|
|型|CIImage|

# CILanczosScaleTransform

## フィルタ名
Lanczos Scale Transform

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILanczosScaleTransform

## 所属カテゴリ
CICategoryGeometryAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputScale
|項目|内容|
|:--|:--|
|パラメーター名|Scale|
|説明|The scaling factor to use on the image. Values less than 1.0 scale down the images. Values greater than 1.0 scale up the image.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1, 1|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0.05 ~ 1.5|

### inputAspectRatio
|項目|内容|
|:--|:--|
|パラメーター名|Aspect Ratio|
|説明|The additional horizontal scaling factor to use on the image.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1, 1|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0.5 ~ 2|

# CILenticularHaloGenerator

## フィルタ名
Lenticular Halo

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILenticularHaloGenerator

## 所属カテゴリ
CICategoryGenerator, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputHaloOverlap
|項目|内容|
|:--|:--|
|パラメーター名|Halo Overlap|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.77|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1|

### inputStriationStrength
|項目|内容|
|:--|:--|
|パラメーター名|Striation Strength|
|説明|The intensity of the halo colors. Larger values are more intense.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.5|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 3|

### inputHaloWidth
|項目|内容|
|:--|:--|
|パラメーター名|Halo Width|
|説明|The width of the halo, from its inner radius to its outer radius.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|87|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 300|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the halo.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputStriationContrast
|項目|内容|
|:--|:--|
|パラメーター名|Striation Contrast|
|説明|The contrast of the halo colors. Larger values are higher contrast.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|1|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 5|

### inputColor
|項目|内容|
|:--|:--|
|パラメーター名|Color|
|説明|A color.|
|型|CIColor|
|Default値|(1 0.9 0.8 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputTime
|項目|内容|
|:--|:--|
|パラメーター名|Time|
|説明|The duration of the effect.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputHaloRadius
|項目|内容|
|:--|:--|
|パラメーター名|Halo Radius|
|説明|The radius of the halo.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|70|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1000|

# CILightenBlendMode

## フィルタ名
Lighten Blend Mode

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILightenBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CILightTunnel

## フィルタ名
Light Tunnel Distortion

## SDKs
iOS 6+ / macOS 10.10+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILightTunnel

## 所属カテゴリ
CICategoryDistortionEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|Center of the light tunnel.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to process.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRotation
|項目|内容|
|:--|:--|
|パラメーター名|Rotation|
|説明|Rotation angle of the light tunnel.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|0 ~ 1.570796326794897|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|Center radius of the light tunnel.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|100, 0|
|スライダー最小値, 最大値|1 ~ 500|

# CILinearBurnBlendMode

## フィルタ名
Linear Burn Blend Mode

## SDKs
iOS 8+ / macOS 10.10+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILinearBurnBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CILinearDodgeBlendMode

## フィルタ名
Linear Dodge Blend Mode

## SDKs
iOS 8+ / macOS 10.10+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILinearDodgeBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CILinearGradient

## フィルタ名
Linear Gradient

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILinearGradient

## 所属カテゴリ
CICategoryGradient, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputPoint1
|項目|内容|
|:--|:--|
|パラメーター名|Point 1|
|説明|The ending position of the gradient -- where the second color begins.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[200 200]|

### inputPoint0
|項目|内容|
|:--|:--|
|パラメーター名|Point 0|
|説明|The starting position of the gradient -- where the first color begins.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[0 0]|

### inputColor1
|項目|内容|
|:--|:--|
|パラメーター名|Color 2|
|説明|The second color to use in the gradient.|
|タイプ|CIAttributeTypeColor|
|型|CIColor|
|Default値|(0 0 0 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputColor0
|項目|内容|
|:--|:--|
|パラメーター名|Color 1|
|説明|The first color to use in the gradient.|
|タイプ|CIAttributeTypeColor|
|型|CIColor|
|Default値|(1 1 1 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

# CILinearToSRGBToneCurve

## フィルタ名
Linear to sRGB Tone Curve

## SDKs
iOS 7+ / macOS 10.10+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILinearToSRGBToneCurve

## 所属カテゴリ
CICategoryColorAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CILineOverlay

## フィルタ名
Line Overlay

## SDKs
iOS 9+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILineOverlay

## 所属カテゴリ
CICategoryBuiltIn, CICategoryStillImage, CICategoryVideo, CICategoryStylize

## パラメータ

### inputNRSharpness
|項目|内容|
|:--|:--|
|パラメーター名|NR Sharpness|
|説明|The amount of sharpening done when removing noise in the image before tracing the edges of the image. This improves the edge acquisition.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0.71, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 2|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputThreshold
|項目|内容|
|:--|:--|
|パラメーター名|Threshold|
|説明|This value determines edge visibility. Larger values thin out the edges.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0.1, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1|

### inputEdgeIntensity
|項目|内容|
|:--|:--|
|パラメーター名|Edge Intensity|
|説明|The accentuation factor of the Sobel gradient information when tracing the edges of the image. Higher values find more edges, although typically a low value (such as 1.0) is used.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 200|

### inputNRNoiseLevel
|項目|内容|
|:--|:--|
|パラメーター名|NR Noise Level|
|説明|The noise level of the image (used with camera data) that gets removed before tracing the edges of the image. Increasing the noise level helps to clean up the traced edges of the image.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0.07000000000000001, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 0.1|

### inputContrast
|項目|内容|
|:--|:--|
|パラメーター名|Contrast|
|説明|The amount of anti-aliasing to use on the edges produced by this filter. Higher values produce higher contrast edges (they are less anti-aliased).|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|50, 1|
|最小値, 最大値|0.25 ~ 無し|
|スライダー最小値, 最大値|0.25 ~ 200|

# CILineScreen

## フィルタ名
Line Screen

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILineScreen

## 所属カテゴリ
CICategoryHalftoneEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The distance between lines in the pattern.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|6|
|最小値, 最大値|1 ~ 無し|
|スライダー最小値, 最大値|2 ~ 50|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the line screen pattern|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputSharpness
|項目|内容|
|:--|:--|
|パラメーター名|Sharpness|
|説明|The sharpness of the pattern. The larger the value, the sharper the pattern.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.7|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle of the pattern.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

# CILuminosityBlendMode

## フィルタ名
Luminosity Blend Mode

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CILuminosityBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIMaskedVariableBlur

## フィルタ名
Masked Variable Blur

## SDKs
iOS 8+ / macOS 10.10+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaskedVariableBlur

## 所属カテゴリ
CICategoryBlur, CICategoryStillImage, CICategoryVideo, CICategoryBuiltIn

## パラメータ

### inputMask
|項目|内容|
|:--|:--|
|パラメーター名|Mask|
|型|CIImage|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The distance from the center of the effect.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|5, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 10|

# CIMaskToAlpha

## フィルタ名
Mask to Alpha

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaskToAlpha

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIMaximumComponent

## フィルタ名
Maximum Component

## SDKs
iOS 6+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaximumComponent

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to process.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIMaximumCompositing

## フィルタ名
Maximum

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMaximumCompositing

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryHighDynamicRange, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIMedianFilter

## フィルタ名
Median

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMedianFilter

## 所属カテゴリ
CICategoryBlur, CICategoryStillImage, CICategoryVideo, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIMeshGenerator

## フィルタ名
Mesh Generator

## SDKs
iOS 12+ / macOS 10.14+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMeshGenerator

## 所属カテゴリ
CICategoryGenerator, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The width of the effect.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|1.5|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|1 ~ 10|

### inputColor
|項目|内容|
|:--|:--|
|パラメーター名|Color|
|説明|A color.|
|型|CIColor|
|Default値|(1 1 1 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputMesh
|項目|内容|
|:--|:--|
|パラメーター名|Mesh|
|説明|An array of line segments stored as an array of CIVectors each containing a start point and end point.|
|型|NSArray|

# CIMinimumComponent

## フィルタ名
Minimum Component

## SDKs
iOS 6+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMinimumComponent

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to process.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIMinimumCompositing

## フィルタ名
Minimum

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMinimumCompositing

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryHighDynamicRange, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIMix

## フィルタ名
Mix

## SDKs
iOS 12+ / macOS 10.14+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMix

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as a foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAmount
|項目|内容|
|:--|:--|
|パラメーター名|Amount|
|説明|The amount of the effect.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1, 1|
|スライダー最小値, 最大値|0 ~ 1|

# CIModTransition

## フィルタ名
Mod

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIModTransition

## 所属カテゴリ
CICategoryTransition, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputTargetImage
|項目|内容|
|:--|:--|
|パラメーター名|Target Image|
|説明|The target image for a transition.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle of the mod hole pattern.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|2, 0|
|スライダー最小値, 最大値|-6.283185307179586 ~ 6.283185307179586|

### inputCompression
|項目|内容|
|:--|:--|
|パラメーター名|Compression|
|説明|The amount of stretching applied to the mod hole pattern. Holes in the center are not distorted as much as those at the edge of the image.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|300|
|最小値, 最大値|1 ~ 無し|
|スライダー最小値, 最大値|100 ~ 800|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius of the undistorted holes in the pattern.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|150|
|最小値, 最大値|1 ~ 無し|
|スライダー最小値, 最大値|1 ~ 200|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the effect|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputTime
|項目|内容|
|:--|:--|
|パラメーター名|Time|
|説明|The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).|
|タイプ|CIAttributeTypeTime|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

# CIMorphologyGradient

## フィルタ名
Morphology Gradient

## SDKs
iOS 11+ / macOS 10.13+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMorphologyGradient

## 所属カテゴリ
CICategoryBlur, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The desired radius of the circular morphological operation to the image.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|5, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 50|

# CIMorphologyMaximum

## フィルタ名
Morphology Maximum

## SDKs
iOS 11+ / macOS 10.13+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMorphologyMaximum

## 所属カテゴリ
CICategoryBlur, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The desired radius of the circular morphological operation to the image.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|0 ~ 50|

# CIMorphologyMinimum

## フィルタ名
Morphology Minimum

## SDKs
iOS 11+ / macOS 10.13+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMorphologyMinimum

## 所属カテゴリ
CICategoryBlur, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The desired radius of the circular morphological operation to the image.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|0 ~ 50|

# CIMotionBlur

## フィルタ名
Motion Blur

## SDKs
iOS 8.3+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMotionBlur

## 所属カテゴリ
CICategoryBlur, CICategoryStillImage, CICategoryVideo, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius determines how many pixels are used to create the blur. The larger the radius, the blurrier the result.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|20, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 100|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle of the motion determines which direction the blur smears.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

# CIMultiplyBlendMode

## フィルタ名
Multiply Blend Mode

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMultiplyBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIMultiplyCompositing

## フィルタ名
Multiply

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIMultiplyCompositing

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryHighDynamicRange, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CINinePartStretched

## フィルタ名
Nine Part Stretched

## SDKs
iOS 10+ / macOS 10.12+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CINinePartStretched

## 所属カテゴリ
CICategoryDistortionEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputBreakpoint1
|項目|内容|
|:--|:--|
|パラメーター名|Breakpoint1|
|説明|Upper right corner of image to retain after stretching ends.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputGrowAmount
|項目|内容|
|:--|:--|
|パラメーター名|Grow Amount|
|タイプ|CIAttributeTypeOffset|
|型|CIVector|
|Default値|[100 100]|

### inputBreakpoint0
|項目|内容|
|:--|:--|
|パラメーター名|Breakpoint0|
|説明|Lower left corner of image to retain before stretching begins.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[50 50]|

# CINinePartTiled

## フィルタ名
Nine Part Tiled

## SDKs
iOS 10+ / macOS 10.12+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CINinePartTiled

## 所属カテゴリ
CICategoryDistortionEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputBreakpoint1
|項目|内容|
|:--|:--|
|パラメーター名|Breakpoint1|
|説明|Upper right corner of image to retain after tiling ends.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputFlipYTiles
|項目|内容|
|:--|:--|
|パラメーター名|Flip Y Tiles|
|説明|Indicates that Y-Axis flip should occur.|
|タイプ|CIAttributeTypeBoolean|
|型|NSNumber|
|Default値|1|
|最小値, 最大値|0 ~ 1|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputGrowAmount
|項目|内容|
|:--|:--|
|パラメーター名|Grow Amount|
|タイプ|CIAttributeTypeOffset|
|型|CIVector|
|Default値|[100 100]|

### inputBreakpoint0
|項目|内容|
|:--|:--|
|パラメーター名|Breakpoint0|
|説明|Lower left corner of image to retain before tiling begins.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[50 50]|

# CINoiseReduction

## フィルタ名
Noise Reduction

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CINoiseReduction

## 所属カテゴリ
CICategoryBlur, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputNoiseLevel
|項目|内容|
|:--|:--|
|パラメーター名|Noise Level|
|説明|The amount of noise reduction. The larger the value, the more noise reduction.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0.02, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 0.1|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputSharpness
|項目|内容|
|:--|:--|
|パラメーター名|Sharpness|
|説明|The sharpness of the final image. The larger the value, the sharper the result.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0.4, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 2|

# CIOpTile

## フィルタ名
Op Tile

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIOpTile

## 所属カテゴリ
CICategoryTileEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The width of a tile.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|65, 65|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|1 ~ 1000|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the effect|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputScale
|項目|内容|
|:--|:--|
|パラメーター名|Scale|
|説明|The scale determines the number of tiles in the effect.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|2.8, 1|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0.1 ~ 10|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle of a tile.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

# CIOverlayBlendMode

## フィルタ名
Overlay Blend Mode

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIOverlayBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIPageCurlTransition

## フィルタ名
Page Curl

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPageCurlTransition

## 所属カテゴリ
CICategoryTransition, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputTargetImage
|項目|内容|
|:--|:--|
|パラメーター名|Target Image|
|説明|The target image for a transition.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle of the curling page.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius of the curl.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|100|
|最小値, 最大値|0.01 ~ 無し|
|スライダー最小値, 最大値|0.01 ~ 400|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputShadingImage
|項目|内容|
|:--|:--|
|パラメーター名|Shading Image|
|説明|An image that looks like a shaded sphere enclosed in a square image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputTime
|項目|内容|
|:--|:--|
|パラメーター名|Time|
|説明|The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).|
|タイプ|CIAttributeTypeTime|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputExtent
|項目|内容|
|:--|:--|
|パラメーター名|Extent|
|説明|The extent of the effect.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値|[0 0 300 300]|

### inputBacksideImage
|項目|内容|
|:--|:--|
|パラメーター名|Backside Image|
|説明|The image that appears on the back of the source image, as the page curls to reveal the target image.|
|型|CIImage|

# CIPageCurlWithShadowTransition

## フィルタ名
Page Curl With Shadow

## SDKs
iOS 9+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPageCurlWithShadowTransition

## 所属カテゴリ
CICategoryTransition, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputTargetImage
|項目|内容|
|:--|:--|
|パラメーター名|Target Image|
|説明|The target image for a transition.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle of the curling page.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius of the curl.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|100|
|最小値, 最大値|0.01 ~ 無し|
|スライダー最小値, 最大値|0.01 ~ 400|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputShadowAmount
|項目|内容|
|:--|:--|
|パラメーター名|Shadow Amount|
|説明|The strength of the shadow.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|0.7|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputTime
|項目|内容|
|:--|:--|
|パラメーター名|Time|
|説明|The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).|
|タイプ|CIAttributeTypeTime|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputShadowSize
|項目|内容|
|:--|:--|
|パラメーター名|Shadow Size|
|説明|The maximum size in pixels of the shadow.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|0.5|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputExtent
|項目|内容|
|:--|:--|
|パラメーター名|Extent|
|説明|The extent of the effect.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値|[0 0 0 0]|

### inputShadowExtent
|項目|内容|
|:--|:--|
|パラメーター名|Shadow Extent|
|説明|The rectagular portion of input image that will cast a shadow.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値|[0 0 0 0]|

### inputBacksideImage
|項目|内容|
|:--|:--|
|パラメーター名|Backside Image|
|説明|The image that appears on the back of the source image, as the page curls to reveal the target image.|
|型|CIImage|

# CIParallelogramTile

## フィルタ名
Parallelogram Tile

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIParallelogramTile

## 所属カテゴリ
CICategoryTileEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputAcuteAngle
|項目|内容|
|:--|:--|
|パラメーター名|Acute Angle|
|説明|The primary angle for the repeating parallelogram tile. Small values create thin diamond tiles, and higher values create fatter parallelogram tiles.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|1.570796326794897, 1.570796326794897|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The width of a tile.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|100, 100|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|1 ~ 200|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the effect|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle (in radians) of the tiled pattern.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

# CIPerspectiveCorrection

## フィルタ名
Perspective Correction

## SDKs
iOS 8+ / macOS 10.10+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveCorrection

## 所属カテゴリ
CICategoryGeometryAdjustment, CICategoryStillImage, CICategoryVideo, CICategoryBuiltIn

## パラメータ

### inputBottomLeft
|項目|内容|
|:--|:--|
|パラメーター名|Bottom Left|
|説明|The bottom left coordinate to be perspective corrected.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[155 153]|

### inputTopRight
|項目|内容|
|:--|:--|
|パラメーター名|Top Right|
|説明|The top right coordinate to be perspective corrected.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[646 507]|

### inputTopLeft
|項目|内容|
|:--|:--|
|パラメーター名|Top Left|
|説明|The top left coordinate to be perspective corrected.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[118 484]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBottomRight
|項目|内容|
|:--|:--|
|パラメーター名|Bottom Right|
|説明|The bottom right coordinate to be perspective corrected.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[548 140]|

### inputCrop
|項目|内容|
|:--|:--|
|パラメーター名|Crop|
|タイプ|CIAttributeTypeBoolean|
|型|NSNumber|
|Default値|1|

# CIPerspectiveTile

## フィルタ名
Perspective Tile

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveTile

## 所属カテゴリ
CICategoryTileEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputTopRight
|項目|内容|
|:--|:--|
|パラメーター名|Top Right|
|説明|The top right coordinate of a tile.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[646 507]|

### inputTopLeft
|項目|内容|
|:--|:--|
|パラメーター名|Top Left|
|説明|The top left coordinate of a tile.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[118 484]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBottomLeft
|項目|内容|
|:--|:--|
|パラメーター名|Bottom Left|
|説明|The bottom left coordinate of a tile.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[155 153]|

### inputBottomRight
|項目|内容|
|:--|:--|
|パラメーター名|Bottom Right|
|説明|The bottom right coordinate of a tile.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[548 140]|

# CIPerspectiveTransform

## フィルタ名
Perspective Transform

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveTransform

## 所属カテゴリ
CICategoryGeometryAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputTopRight
|項目|内容|
|:--|:--|
|パラメーター名|Top Right|
|説明|The top right coordinate to map the image to.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[646 507]|

### inputTopLeft
|項目|内容|
|:--|:--|
|パラメーター名|Top Left|
|説明|The top left coordinate to map the image to.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[118 484]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBottomLeft
|項目|内容|
|:--|:--|
|パラメーター名|Bottom Left|
|説明|The bottom left coordinate to map the image to.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[155 153]|

### inputBottomRight
|項目|内容|
|:--|:--|
|パラメーター名|Bottom Right|
|説明|The bottom right coordinate to map the image to.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[548 140]|

# CIPerspectiveTransformWithExtent

## フィルタ名
Perspective Transform with Extent

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPerspectiveTransformWithExtent

## 所属カテゴリ
CICategoryGeometryAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputBottomLeft
|項目|内容|
|:--|:--|
|パラメーター名|Bottom Left|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[155 153]|

### inputExtent
|項目|内容|
|:--|:--|
|パラメーター名|Extent|
|説明|A rectangle that defines the extent of the effect.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値|[0 0 300 300]|

### inputTopRight
|項目|内容|
|:--|:--|
|パラメーター名|Top Right|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[646 507]|

### inputTopLeft
|項目|内容|
|:--|:--|
|パラメーター名|Top Left|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[118 484]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBottomRight
|項目|内容|
|:--|:--|
|パラメーター名|Bottom Right|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[548 140]|

# CIPhotoEffectChrome

## フィルタ名
Photo Effect Chrome

## SDKs
iOS 7+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectChrome

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn, CICategoryXMPSerializable

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIPhotoEffectFade

## フィルタ名
Photo Effect Fade

## SDKs
iOS 7+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectFade

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn, CICategoryXMPSerializable

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIPhotoEffectInstant

## フィルタ名
Photo Effect Instant

## SDKs
iOS 7+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectInstant

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn, CICategoryXMPSerializable

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIPhotoEffectMono

## フィルタ名
Photo Effect Mono

## SDKs
iOS 7+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectMono

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn, CICategoryXMPSerializable

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIPhotoEffectNoir

## フィルタ名
Photo Effect Noir

## SDKs
iOS 7+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectNoir

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn, CICategoryXMPSerializable

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIPhotoEffectProcess

## フィルタ名
Photo Effect Process

## SDKs
iOS 7+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectProcess

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn, CICategoryXMPSerializable

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIPhotoEffectTonal

## フィルタ名
Photo Effect Tonal

## SDKs
iOS 7+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectTonal

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn, CICategoryXMPSerializable

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIPhotoEffectTransfer

## フィルタ名
Photo Effect Transfer

## SDKs
iOS 7+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPhotoEffectTransfer

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn, CICategoryXMPSerializable

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIPinchDistortion

## フィルタ名
Pinch Distortion

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPinchDistortion

## 所属カテゴリ
CICategoryDistortionEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The center of the effect as x and y coordinates.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputScale
|項目|内容|
|:--|:--|
|パラメーター名|Scale|
|説明|The amount of pinching. A value of 0.0 has no effect. A value of 1.0 is the maximum pinch.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0.5, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 2|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|300, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1000|

# CIPinLightBlendMode

## フィルタ名
Pin Light Blend Mode

## SDKs
iOS 8+ / macOS 10.10+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPinLightBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIPixellate

## フィルタ名
Pixelate

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPixellate

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the effect|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputScale
|項目|内容|
|:--|:--|
|パラメーター名|Scale|
|説明|The scale determines the size of the squares. Larger values result in larger squares.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|8|
|最小値, 最大値|1 ~ 無し|
|スライダー最小値, 最大値|1 ~ 100|

# CIPointillize

## フィルタ名
Pointillize

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIPointillize

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the effect|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius of the circles in the resulting pattern.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|20, 1|
|最小値, 最大値|1 ~ 無し|
|スライダー最小値, 最大値|1 ~ 100|

# CIRadialGradient

## フィルタ名
Radial Gradient

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRadialGradient

## 所属カテゴリ
CICategoryGradient, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputRadius0
|項目|内容|
|:--|:--|
|パラメーター名|Radius 1|
|説明|The radius of the starting circle to use in the gradient.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|5|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 800|

### inputColor1
|項目|内容|
|:--|:--|
|パラメーター名|Color 2|
|説明|The second color to use in the gradient.|
|タイプ|CIAttributeTypeColor|
|型|CIColor|
|Default値|(0 0 0 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The center of the effect as x and y coordinates.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputRadius1
|項目|内容|
|:--|:--|
|パラメーター名|Radius 2|
|説明|The radius of the ending circle to use in the gradient.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|100|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 800|

### inputColor0
|項目|内容|
|:--|:--|
|パラメーター名|Color 1|
|説明|The first color to use in the gradient.|
|タイプ|CIAttributeTypeColor|
|型|CIColor|
|Default値|(1 1 1 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

# CIRandomGenerator

## フィルタ名
Random Generator

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRandomGenerator

## 所属カテゴリ
CICategoryGenerator, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

# CIRippleTransition

## フィルタ名
Ripple

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRippleTransition

## 所属カテゴリ
CICategoryTransition, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The width of the ripple.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|100|
|最小値, 最大値|1 ~ 無し|
|スライダー最小値, 最大値|10 ~ 300|

### inputTargetImage
|項目|内容|
|:--|:--|
|パラメーター名|Target Image|
|説明|The target image for a transition.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputScale
|項目|内容|
|:--|:--|
|パラメーター名|Scale|
|説明|A value that determines whether the ripple starts as a bulge (higher value) or a dimple (lower value).|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|50, 0|
|最小値, 最大値|-50 ~ 無し|
|スライダー最小値, 最大値|-50 ~ 50|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputShadingImage
|項目|内容|
|:--|:--|
|パラメーター名|Shading Image|
|説明|An image that looks like a shaded sphere enclosed in a square image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the effect|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputTime
|項目|内容|
|:--|:--|
|パラメーター名|Time|
|説明|The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).|
|タイプ|CIAttributeTypeTime|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputExtent
|項目|内容|
|:--|:--|
|パラメーター名|Extent|
|説明|A rectangle that defines the extent of the effect.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値|[0 0 300 300]|

# CIRowAverage

## フィルタ名
Row Average

## SDKs
iOS 9+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIRowAverage

## 所属カテゴリ
CICategoryReduction, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputExtent
|項目|内容|
|:--|:--|
|パラメーター名|Extent|
|説明|A rectangle that specifies the subregion of the image that you want to process.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値|[0 0 640 80]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to process.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CISampleNearest

## フィルタ名
Sample Nearest

## SDKs
iOS 12+ / macOS 10.14+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISampleNearest

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CISaturationBlendMode

## フィルタ名
Saturation Blend Mode

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISaturationBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIScreenBlendMode

## フィルタ名
Screen Blend Mode

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIScreenBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CISepiaTone

## フィルタ名
Sepia Tone

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISepiaTone

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn, CICategoryXMPSerializable

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputIntensity
|項目|内容|
|:--|:--|
|パラメーター名|Intensity|
|説明|The intensity of the sepia effect. A value of 1.0 creates a monochrome sepia image. A value of 0.0 has no effect on the image.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1|

# CIShadedMaterial

## フィルタ名
Shaded Material

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIShadedMaterial

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputShadingImage
|項目|内容|
|:--|:--|
|パラメーター名|Shading Image|
|説明|The image to use as the height field. The resulting image has greater heights with lighter shades, and lesser heights (lower areas) with darker shades.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputScale
|項目|内容|
|:--|:--|
|パラメーター名|Scale|
|説明|The scale of the effect. The higher the value, the more dramatic the effect.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|10|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0.5 ~ 200|

# CISharpenLuminance

## フィルタ名
Sharpen Luminance

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISharpenLuminance

## 所属カテゴリ
CICategorySharpen, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputSharpness
|項目|内容|
|:--|:--|
|パラメーター名|Sharpness|
|説明|The amount of sharpening to apply. Larger values are sharper.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0.4, 0|
|スライダー最小値, 最大値|0 ~ 2|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The distance from the center of the effect.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1.69, 0|
|スライダー最小値, 最大値|0 ~ 20|

# CISixfoldReflectedTile

## フィルタ名
Sixfold Reflected Tile

## SDKs
iOS 6+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISixfoldReflectedTile

## 所属カテゴリ
CICategoryTileEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The width of a tile.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|100, 100|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|1 ~ 200|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the effect|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle (in radians) of the tiled pattern.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

# CISixfoldRotatedTile

## フィルタ名
Sixfold Rotated Tile

## SDKs
iOS 6+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISixfoldRotatedTile

## 所属カテゴリ
CICategoryTileEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The width of a tile.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|100, 100|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|1 ~ 200|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the effect|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle (in radians) of the tiled pattern.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

# CISmoothLinearGradient

## フィルタ名
Smooth Linear Gradient

## SDKs
iOS 6+ / macOS 10.10+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISmoothLinearGradient

## 所属カテゴリ
CICategoryGradient, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputPoint1
|項目|内容|
|:--|:--|
|パラメーター名|Point 1|
|説明|The ending position of the gradient -- where the second color begins.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[200 200]|

### inputPoint0
|項目|内容|
|:--|:--|
|パラメーター名|Point 0|
|説明|The starting position of the gradient -- where the first color begins.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[0 0]|

### inputColor1
|項目|内容|
|:--|:--|
|パラメーター名|Color 2|
|説明|The second color to use in the gradient.|
|タイプ|CIAttributeTypeColor|
|型|CIColor|
|Default値|(0 0 0 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputColor0
|項目|内容|
|:--|:--|
|パラメーター名|Color 1|
|説明|The first color to use in the gradient.|
|タイプ|CIAttributeTypeColor|
|型|CIColor|
|Default値|(1 1 1 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

# CISoftLightBlendMode

## フィルタ名
Soft Light Blend Mode

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISoftLightBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CISourceAtopCompositing

## フィルタ名
Source Atop

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISourceAtopCompositing

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryHighDynamicRange, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CISourceInCompositing

## フィルタ名
Source In

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISourceInCompositing

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryHighDynamicRange, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CISourceOutCompositing

## フィルタ名
Source Out

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISourceOutCompositing

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryHighDynamicRange, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CISourceOverCompositing

## フィルタ名
Source Over

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISourceOverCompositing

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryHighDynamicRange, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CISpotColor

## フィルタ名
Spot Color

## SDKs
iOS 9+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISpotColor

## 所属カテゴリ
CICategoryBuiltIn, CICategoryStillImage, CICategoryVideo, CICategoryStylize

## パラメータ

### inputCloseness3
|項目|内容|
|:--|:--|
|パラメーター名|Closeness 3|
|説明|A value that indicates how close the third color must match before it is replaced.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.5|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 0.5|

### inputCloseness1
|項目|内容|
|:--|:--|
|パラメーター名|Closeness 1|
|説明|A value that indicates how close the first color must match before it is replaced.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.22|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 0.5|

### inputContrast2
|項目|内容|
|:--|:--|
|パラメーター名|Contrast 2|
|説明|The contrast of the second replacement color.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.98|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputReplacementColor3
|項目|内容|
|:--|:--|
|パラメーター名|Replacement Color 3|
|説明|A replacement color for the third color range.|
|型|CIColor|
|Default値|(0.9098 0.7529 0.6078 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputReplacementColor2
|項目|内容|
|:--|:--|
|パラメーター名|Replacement Color 2|
|説明|A replacement color for the second color range.|
|型|CIColor|
|Default値|(0.9137 0.5608 0.5059 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputCenterColor1
|項目|内容|
|:--|:--|
|パラメーター名|Center Color 1|
|説明|The center value of the first color range to replace.|
|型|CIColor|
|Default値|(0.0784 0.0627 0.0706 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputReplacementColor1
|項目|内容|
|:--|:--|
|パラメーター名|Replacement Color 1|
|説明|A replacement color for the first color range.|
|型|CIColor|
|Default値|(0.4392 0.1922 0.1961 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputCloseness2
|項目|内容|
|:--|:--|
|パラメーター名|Closeness 2|
|説明|A value that indicates how close the second color must match before it is replaced.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.15|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 0.5|

### inputCenterColor3
|項目|内容|
|:--|:--|
|パラメーター名|Center Color 3|
|説明|The center value of the third color range to replace.|
|型|CIColor|
|Default値|(0.9216 0.4549 0.3333 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputContrast3
|項目|内容|
|:--|:--|
|パラメーター名|Contrast 3|
|説明|The contrast of the third replacement color.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.99|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1|

### inputCenterColor2
|項目|内容|
|:--|:--|
|パラメーター名|Center Color 2|
|説明|The center value of the second color range to replace.|
|型|CIColor|
|Default値|(0.5255 0.3059 0.3451 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputContrast1
|項目|内容|
|:--|:--|
|パラメーター名|Contrast 1|
|説明|The contrast of the first replacement color.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.98|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1|

# CISpotLight

## フィルタ名
Spot Light

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISpotLight

## 所属カテゴリ
CICategoryStylize, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputLightPosition
|項目|内容|
|:--|:--|
|パラメーター名|Light Position|
|説明|The x and y position of the spotlight.|
|タイプ|CIAttributeTypePosition3|
|型|CIVector|
|Default値|[400 600 150]|

### inputColor
|項目|内容|
|:--|:--|
|パラメーター名|Color|
|説明|The color of the spotlight.|
|タイプ|CIAttributeTypeOpaqueColor|
|型|CIColor|
|Default値|(1 1 1 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputLightPointsAt
|項目|内容|
|:--|:--|
|パラメーター名|Light Points At|
|説明|The x and y position that the spotlight points at.|
|タイプ|CIAttributeTypePosition3|
|型|CIVector|
|Default値|[200 200 0]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputConcentration
|項目|内容|
|:--|:--|
|パラメーター名|Concentration|
|説明|The spotlight size. The smaller the value, the more tightly focused the light beam.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0.1, 20|
|最小値, 最大値|0.001 ~ 無し|
|スライダー最小値, 最大値|0.001 ~ 1.5|

### inputBrightness
|項目|内容|
|:--|:--|
|パラメーター名|Brightness|
|説明|The brightness of the spotlight.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|3, 1|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 10|

# CISRGBToneCurveToLinear

## フィルタ名
sRGB Tone Curve to Linear

## SDKs
iOS 7+ / macOS 10.10+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISRGBToneCurveToLinear

## 所属カテゴリ
CICategoryColorAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIStarShineGenerator

## フィルタ名
Star Shine

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStarShineGenerator

## 所属カテゴリ
CICategoryGenerator, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputCrossScale
|項目|内容|
|:--|:--|
|パラメーター名|Cross Scale|
|説明|The size of the cross pattern.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|15, 15|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 100|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius of the star.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|50|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 300|

### inputCrossAngle
|項目|内容|
|:--|:--|
|パラメーター名|Cross Angle|
|説明|The angle of the cross pattern.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値|0.6|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

### inputCrossOpacity
|項目|内容|
|:--|:--|
|パラメーター名|Cross Opacity|
|説明|The opacity of the cross pattern.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|-2, -2|
|最小値, 最大値|-8 ~ 無し|
|スライダー最小値, 最大値|-8 ~ 0|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the star.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputCrossWidth
|項目|内容|
|:--|:--|
|パラメーター名|Cross Width|
|説明|The width of the cross pattern.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|2.5|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0.5 ~ 10|

### inputColor
|項目|内容|
|:--|:--|
|パラメーター名|Color|
|説明|The color to use for the outer shell of the circular star.|
|型|CIColor|
|Default値|(1 0.8 0.6 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputEpsilon
|項目|内容|
|:--|:--|
|パラメーター名|Epsilon|
|説明|The length of the cross spikes.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|-2, -2|
|最小値, 最大値|-8 ~ 無し|
|スライダー最小値, 最大値|-8 ~ 0|

# CIStraightenFilter

## フィルタ名
Straighten

## SDKs
iOS 5+ / macOS 10.7+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStraightenFilter

## 所属カテゴリ
CICategoryGeometryAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|An angle in radians.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

# CIStretchCrop

## フィルタ名
Stretch Crop

## SDKs
iOS 9+ / macOS 10.6+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStretchCrop

## 所属カテゴリ
CICategoryDistortionEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputCenterStretchAmount
|項目|内容|
|:--|:--|
|パラメーター名|Center Stretch Amount|
|説明|Determine how much the center of the image is stretched if stretching is used. If value is 0 then the center of the image maintains the original aspect ratio. If 1 then the image is stretched uniformly.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.25|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputCropAmount
|項目|内容|
|:--|:--|
|パラメーター名|Crop Amount|
|説明|Determines if and how much cropping should be used to achieve the target size. If value is 0 then only stretching is used. If 1 then only cropping is used.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.25|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputSize
|項目|内容|
|:--|:--|
|パラメーター名|Size|
|説明|The size in pixels of the output image.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[1280 720]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIStripesGenerator

## フィルタ名
Stripes

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIStripesGenerator

## 所属カテゴリ
CICategoryGenerator, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The width of a stripe.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|80|
|スライダー最小値, 最大値|0 ~ 800|

### inputSharpness
|項目|内容|
|:--|:--|
|パラメーター名|Sharpness|
|説明|The sharpness of the stripe pattern. The smaller the value, the more blurry the pattern. Values range from 0.0 to 1.0.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|1|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the stripe pattern.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputColor1
|項目|内容|
|:--|:--|
|パラメーター名|Color 2|
|説明|A color to use for the even stripes.|
|型|CIColor|
|Default値|(0 0 0 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputColor0
|項目|内容|
|:--|:--|
|パラメーター名|Color 1|
|説明|A color to use for the odd stripes.|
|型|CIColor|
|Default値|(1 1 1 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

# CISubtractBlendMode

## フィルタ名
Subtract Blend Mode

## SDKs
iOS 8+ / macOS 10.10+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISubtractBlendMode

## 所属カテゴリ
CICategoryCompositeOperation, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputBackgroundImage
|項目|内容|
|:--|:--|
|パラメーター名|Background Image|
|説明|The image to use as a background image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CISunbeamsGenerator

## フィルタ名
Sunbeams

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISunbeamsGenerator

## 所属カテゴリ
CICategoryGenerator, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputSunRadius
|項目|内容|
|:--|:--|
|パラメーター名|Sun Radius|
|説明|The radius of the sun.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|40, 40|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 800|

### inputStriationStrength
|項目|内容|
|:--|:--|
|パラメーター名|Striation Strength|
|説明|The intensity of the sunbeams. Higher values result in more intensity.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0.5, 0.5|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 3|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the sunbeam pattern|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputStriationContrast
|項目|内容|
|:--|:--|
|パラメーター名|Striation Contrast|
|説明|The contrast of the sunbeams. Higher values result in more contrast.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1.375, 1.375|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 5|

### inputColor
|項目|内容|
|:--|:--|
|パラメーター名|Color|
|説明|The color of the sun.|
|型|CIColor|
|Default値|(1 0.5 0 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputTime
|項目|内容|
|:--|:--|
|パラメーター名|Time|
|説明|The duration of the effect.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputMaxStriationRadius
|項目|内容|
|:--|:--|
|パラメーター名|Maximum Striation Radius|
|説明|The radius of the sunbeams.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|2.58, 2.58|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 10|

# CISwipeTransition

## フィルタ名
Swipe

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CISwipeTransition

## 所属カテゴリ
CICategoryTransition, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The width of the swipe|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|300|
|最小値, 最大値|0.1 ~ 無し|
|スライダー最小値, 最大値|0.1 ~ 800|

### inputTargetImage
|項目|内容|
|:--|:--|
|パラメーター名|Target Image|
|説明|The target image for a transition.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle of the swipe.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputColor
|項目|内容|
|:--|:--|
|パラメーター名|Color|
|説明|The color of the swipe.|
|タイプ|CIAttributeTypeOpaqueColor|
|型|CIColor|
|Default値|(1 1 1 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputTime
|項目|内容|
|:--|:--|
|パラメーター名|Time|
|説明|The parametric time of the transition. This value drives the transition from start (at time 0) to end (at time 1).|
|タイプ|CIAttributeTypeTime|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputOpacity
|項目|内容|
|:--|:--|
|パラメーター名|Opacity|
|説明|The opacity of the swipe.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1|

### inputExtent
|項目|内容|
|:--|:--|
|パラメーター名|Extent|
|説明|The extent of the effect.|
|タイプ|CIAttributeTypeRectangle|
|型|CIVector|
|Default値|[0 0 300 300]|

# CITemperatureAndTint

## フィルタ名
Temperature and Tint

## SDKs
iOS 5+ / macOS 10.7+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITemperatureAndTint

## 所属カテゴリ
CICategoryColorAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputNeutral
|項目|内容|
|:--|:--|
|パラメーター名|Neutral|
|タイプ|CIAttributeTypeOffset|
|型|CIVector|
|Default値, Identity値|[6500 0], [6500 0]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputTargetNeutral
|項目|内容|
|:--|:--|
|パラメーター名|Target Neutral|
|タイプ|CIAttributeTypeOffset|
|型|CIVector|
|Default値, Identity値|[6500 0], [6500 0]|

# CITextImageGenerator

## フィルタ名
Text Image Generator

## SDKs
iOS 11+ / macOS 10.13+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITextImageGenerator

## 所属カテゴリ
CICategoryGenerator, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputFontSize
|項目|内容|
|:--|:--|
|パラメーター名|Font Size|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|12|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|9 ~ 128|

### inputText
|項目|内容|
|:--|:--|
|パラメーター名|Text|
|型|NSString|

### inputFontName
|項目|内容|
|:--|:--|
|パラメーター名|Font Name|
|型|NSString|
|Default値|HelveticaNeue|

### inputScaleFactor
|項目|内容|
|:--|:--|
|パラメーター名|Scale Factor|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|1|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|1 ~ 4|

# CIThermal

## フィルタ名
Thermal

## SDKs
iOS 10+ / macOS 10.11+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIThermal

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIToneCurve

## フィルタ名
Tone Curve

## SDKs
iOS 5+ / macOS 10.7+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIToneCurve

## 所属カテゴリ
CICategoryColorAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputPoint0
|項目|内容|
|:--|:--|
|パラメーター名|Point 0|
|タイプ|CIAttributeTypeOffset|
|型|CIVector|
|Default値, Identity値|[0 0], [0 0]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputPoint2
|項目|内容|
|:--|:--|
|パラメーター名|Point 2|
|タイプ|CIAttributeTypeOffset|
|型|CIVector|
|Default値, Identity値|[0.5 0.5], [0.5 0.5]|

### inputPoint1
|項目|内容|
|:--|:--|
|パラメーター名|Point 1|
|タイプ|CIAttributeTypeOffset|
|型|CIVector|
|Default値, Identity値|[0.25 0.25], [0.25 0.25]|

### inputPoint3
|項目|内容|
|:--|:--|
|パラメーター名|Point 3|
|タイプ|CIAttributeTypeOffset|
|型|CIVector|
|Default値, Identity値|[0.75 0.75], [0.75 0.75]|

### inputPoint4
|項目|内容|
|:--|:--|
|パラメーター名|Point 4|
|タイプ|CIAttributeTypeOffset|
|型|CIVector|
|Default値, Identity値|[1 1], [1 1]|

# CITorusLensDistortion

## フィルタ名
Torus Lens Distortion

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITorusLensDistortion

## 所属カテゴリ
CICategoryDistortionEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The width of the ring.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|80, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 200|

### inputRefraction
|項目|内容|
|:--|:--|
|パラメーター名|Refraction|
|説明|The refraction of the glass.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1.7, 1|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 5|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the torus.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The outer radius of the torus.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|160, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 500|

# CITriangleKaleidoscope

## フィルタ名
Triangle Kaleidoscope

## SDKs
iOS 6+ / macOS 10.10+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITriangleKaleidoscope

## 所属カテゴリ
CICategoryTileEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputDecay
|項目|内容|
|:--|:--|
|パラメーター名|Decay|
|説明|The decay determines how fast the color fades from the center triangle.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.85|
|スライダー最小値, 最大値|0 ~ 1|

### inputSize
|項目|内容|
|:--|:--|
|パラメーター名|Size|
|説明|The size in pixels of the triangle.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|700|
|スライダー最小値, 最大値|0 ~ 1000|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|Input image to generate kaleidoscope effect from.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputPoint
|項目|内容|
|:--|:--|
|パラメーター名|Point|
|説明|The x and y position to use as the center of the triangular area in the input image.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputRotation
|項目|内容|
|:--|:--|
|パラメーター名|Rotation|
|説明|Rotation angle of the triangle.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値|5.924285296593801|
|スライダー最小値, 最大値|0 ~ 6.283185307179586|

# CITriangleTile

## フィルタ名
Triangle Tile

## SDKs
iOS 9+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITriangleTile

## 所属カテゴリ
CICategoryTileEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The width of a tile.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|100|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|1 ~ 200|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the effect|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle (in radians) of the tiled pattern.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

# CITwelvefoldReflectedTile

## フィルタ名
Twelvefold Reflected Tile

## SDKs
iOS 6+ / macOS 10.5+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITwelvefoldReflectedTile

## 所属カテゴリ
CICategoryTileEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputWidth
|項目|内容|
|:--|:--|
|パラメーター名|Width|
|説明|The width of a tile.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|100, 100|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|1 ~ 200|

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The x and y position to use as the center of the effect|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle (in radians) of the tiled pattern.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|0, 0|
|スライダー最小値, 最大値|-3.141592653589793 ~ 3.141592653589793|

# CITwirlDistortion

## フィルタ名
Twirl Distortion

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CITwirlDistortion

## 所属カテゴリ
CICategoryDistortionEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The center of the effect as x and y coordinates.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|300, 300|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 500|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle (in radians) of the twirl. Values can be positive or negative.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|3.141592653589793, 0|
|スライダー最小値, 最大値|-12.56637061435917 ~ 12.56637061435917|

# CIUnsharpMask

## フィルタ名
Unsharp Mask

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIUnsharpMask

## 所属カテゴリ
CICategorySharpen, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius around a given pixel to apply the unsharp mask. The larger the radius, the more of the image is affected.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|2.5, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 100|

### inputIntensity
|項目|内容|
|:--|:--|
|パラメーター名|Intensity|
|説明|The intensity of the effect. The larger the value, the more contrast in the affected area.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0.5, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 1|

# CIVibrance

## フィルタ名
Vibrance

## SDKs
iOS 5+ / macOS 10.7+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVibrance

## 所属カテゴリ
CICategoryColorAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAmount
|項目|内容|
|:--|:--|
|パラメーター名|Amount|
|説明|The amount to adjust the saturation.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|-1 ~ 1|
|スライダー最小値, 最大値|-1 ~ 1|

# CIVignette

## フィルタ名
Vignette

## SDKs
iOS 5+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVignette

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The distance from the center of the effect.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|1|
|最小値, 最大値|0 ~ 2|
|スライダー最小値, 最大値|0 ~ 2|

### inputIntensity
|項目|内容|
|:--|:--|
|パラメーター名|Intensity|
|説明|The intensity of the effect.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|0, 0|
|最小値, 最大値|-1 ~ 1|
|スライダー最小値, 最大値|-1 ~ 1|

# CIVignetteEffect

## フィルタ名
Vignette Effect

## SDKs
iOS 7+ / macOS 10.9+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVignetteEffect

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The center of the effect as x and y coordinates.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputFalloff
|項目|内容|
|:--|:--|
|パラメーター名|Falloff|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値|0.5|
|最小値, 最大値|0 ~ 1|
|スライダー最小値, 最大値|0 ~ 1|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The distance from the center of the effect.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値|150|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 2000|

### inputIntensity
|項目|内容|
|:--|:--|
|パラメーター名|Intensity|
|説明|The intensity of the effect.|
|タイプ|CIAttributeTypeScalar|
|型|NSNumber|
|Default値, Identity値|1, 0|
|最小値, 最大値|-1 ~ 1|
|スライダー最小値, 最大値|-1 ~ 1|

# CIVortexDistortion

## フィルタ名
Vortex Distortion

## SDKs
iOS 6+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIVortexDistortion

## 所属カテゴリ
CICategoryDistortionEffect, CICategoryVideo, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The center of the effect as x and y coordinates.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputRadius
|項目|内容|
|:--|:--|
|パラメーター名|Radius|
|説明|The radius determines how many pixels are used to create the distortion. The larger the radius, the wider the extent of the distortion.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|300, 0|
|最小値, 最大値|0 ~ 無し|
|スライダー最小値, 最大値|0 ~ 800|

### inputAngle
|項目|内容|
|:--|:--|
|パラメーター名|Angle|
|説明|The angle (in radians) of the vortex.|
|タイプ|CIAttributeTypeAngle|
|型|NSNumber|
|Default値, Identity値|56.54866776461628, 0|
|スライダー最小値, 最大値|-94.24777960769379 ~ 94.24777960769379|

# CIWhitePointAdjust

## フィルタ名
White Point Adjust

## SDKs
iOS 5+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIWhitePointAdjust

## 所属カテゴリ
CICategoryColorAdjustment, CICategoryVideo, CICategoryStillImage, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryBuiltIn

## パラメータ

### inputColor
|項目|内容|
|:--|:--|
|パラメーター名|Color|
|説明|A color to use as the white point.|
|タイプ|CIAttributeTypeColor|
|型|CIColor|
|Default値, Identity値|(1 1 1 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB), (1 1 1 1) <CGColorSpace 0x600000c0a3a0> (kCGColorSpaceDeviceRGB)|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIXRay

## フィルタ名
X-Ray

## SDKs
iOS 10+ / macOS 10.11+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIXRay

## 所属カテゴリ
CICategoryColorEffect, CICategoryVideo, CICategoryInterlaced, CICategoryNonSquarePixels, CICategoryStillImage, CICategoryBuiltIn

## パラメータ

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

# CIZoomBlur

## フィルタ名
Zoom Blur

## SDKs
iOS 8.3+ / macOS 10.4+

## ドキュメントURL
http://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIZoomBlur

## 所属カテゴリ
CICategoryBlur, CICategoryStillImage, CICategoryVideo, CICategoryBuiltIn

## パラメータ

### inputCenter
|項目|内容|
|:--|:--|
|パラメーター名|Center|
|説明|The center of the effect as x and y coordinates.|
|タイプ|CIAttributeTypePosition|
|型|CIVector|
|Default値|[150 150]|

### inputImage
|項目|内容|
|:--|:--|
|パラメーター名|Image|
|説明|The image to use as an input image. For filters that also use a background image, this is the foreground image.|
|タイプ|CIAttributeTypeImage|
|型|CIImage|

### inputAmount
|項目|内容|
|:--|:--|
|パラメーター名|Amount|
|説明|The zoom-in amount. Larger values result in more zooming in.|
|タイプ|CIAttributeTypeDistance|
|型|NSNumber|
|Default値, Identity値|20, 0|
|スライダー最小値, 最大値|-200 ~ 200|

