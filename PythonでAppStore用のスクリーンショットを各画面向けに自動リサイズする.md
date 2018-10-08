# PythonでAppStore用のスクリーンショットを各画面向けに自動リサイズする

## 前提
 - pythonはVer.2.7.10を利用
 - 画像処理ライブラリのpillowを使う

## 使い方
 - iPhone6/6s(4.7)インチの画像を用意。
 - ファイル名は'01.png','02.png','03.png','04.png','05.png'とし、スクリプトと同じディレクトリにおく
 - 01~05.pngの画像が画面解像度ごとにリサイズされ、同じディレクトリに出力される

## pillowのインストール
```
sudo easy_install pillow
```

## Pythonスクリプト
```py:resize.py
#  -*- encoding: utf-8 -*-
from PIL import Image

# リサイズ前のファイル(4.7インチサイズの画像を想定)
fileNames = ['01.png','02.png','03.png','04.png','05.png']

# 各画面解像度の情報
resolutions = [[5.5,1242,2208], [4.7,750,1334], [4.0,640,1136], [3.5,640,960]]

for i in range(5):
    for j in range(4):
    	if j == 0:
            # 5.5インチ用はresizeを使って拡大する
			image = Image.open(fileNames[i], 'r')
			resize_image = image.resize((resolutions[j][1], resolutions[j][2]))
			resize_image.save('screenshot_' + str(resolutions[j][0]) + '_0' + str(i+1) +'.jpg', 'JPEG', quality=100, optimize=True)
    	else:
            # 4.7インチ以下はthumbnailを使うと劣化が少ない
			image = Image.open(fileNames[i], 'r')
			canvas = Image.new('RGB', (resolutions[j][1], resolutions[j][2]), (255, 255, 255))
			image.thumbnail((resolutions[j][1], resolutions[j][2]), Image.ANTIALIAS)
			x = (resolutions[j][1] - image.size[0])/2
			canvas.paste(image, ( x, 0))
			canvas.save('screenshot_' + str(resolutions[j][0]) + '_0' + str(i+1) +'.jpg', 'JPEG', quality=100, optimize=True)
```

## 実行
```
python resize.py
```

