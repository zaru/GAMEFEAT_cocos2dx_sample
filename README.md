GAMEFEAT cocos2d-x Sample
========================

GAMEFEATのSDKをcocos2d-x（iOS / Android）で動かすサンプルアプリです。

## 対応バージョン

- cocos2d-x 2.x.x
- GAMEFEAT SDK v3.2.0

## 動作方法

### iOSの場合

- GAMEFEAT SDKをXcodeプロジェクトに追加します
	- 必要なFramework（サンプルアプリには追加済みです）
	- Foundation.framework
	- UIKit.framework
	- CoreTelephony.framework
	- AdSupport.framework（Optional）
	- StoreKit.framework（Optional）
- メディアIDを適宜変更をしてください
- ビルドすればサンプルアプリが起動します

### Androidの場合

- EclipseにプロジェクトをImportしてください
- GAMEFEAT SDKのjarファイルをlibsに配置します
- メディアIDを適宜変更をしてください
- /proj.android/build_native.shを開いて、NDKとcocos2d-xSDKのファイルパスを適宜変更してください
- ./build_native.sh を実行してください
- ビルドすればサンプルアプリが起動します

