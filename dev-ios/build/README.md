# 构建系统 （ 只关注 xcode 8 以后）

* 该repo是http://www.jianshu.com/p/54ab07f2e63b 一文中所列的脚本。
* build_using_gym.sh使用了[gem](https://github.com/fastlane/fastlane)
* build_using_xctool.sh使用了[xctool](https://github.com/facebook/xctool)
* 两个脚本的结尾都会将ipa上传到[fir](https://github.com/FIRHQ/fir-cli)

## 构建

### 构建命令 之 xcodebuild

xcodebuild 是苹果提供的打包项目或者工程的命令:
1. 需要在包含 name.xcodeproj 的目录下执行 xcodebuild 命令，且如果该目录下有多个 projects，那么需要使用 -project 指定需要 build 的项目
2. 在不指定 build 的 target 的时候，默认情况下会 build project 下的第一个 target
3. 当 build workspace 时，需要同时指定 -workspace 和 -scheme 参数，scheme 参数控制了哪些 targets 会被 build 以及以怎样的方式 build
4. 有一些诸如 -list, -showBuildSettings, -showsdks 的参数可以查看项目或者工程的信息，不会对 build action 造成任何影响
	- xcodebuild -showsdks: 列出 Xcode 所有可用的 SDKs
	- 

脚本参考：build-7.sh, build-8.sh


### 构建命令 之 [xcbuild](https://github.com/facebook/xcbuild)

*如果对编译速度有较高要求，可以参考使用xcbuild*

1. 特性
	* 超快的增量构建和构建频率；
	* 支持构建Xcode项目和workspace；
	* 支持Swift应用与框架；
	* 使用Ninja和llbuild；
	* 完全兼容xcpretty；
	* 基于BSD开源许可；
	* 基于Linux平台构建。
2. 安装：ninja
```
brew install cmake ninja
```
3. 安装：见github

4. 还没有测试OK！！！


### 构建命令 之 gym


### 构建命令 之 xcodebuild

*直观的输出，搭配xcpretty*

安装 [xcpretty](https://github.com/supermarin/xcpretty)
```
sudo gem install xcpretty
```

使用例子
```
xcodebuild [flags] | xcpretty
```

## 上传

### fir-cli

https://github.com/FIRHQ/fir-cli

```
gem install fir-cli
```

### curl


?????


## 基本知识

### exportOptions.plist 文件配置参数说明

```
compileBitcode : Bool

  For non-App Store exports, should Xcode re-compile the app from bitcode? Defaults to YES.

embedOnDemandResourcesAssetPacksInBundle : Bool

  For non-App Store exports, if the app uses On Demand Resources and this is YES, asset   
  packs are embedded in the app bundle so that the app can be tested without a server to   
  host asset packs. Defaults to YES unless onDemandResourcesAssetPacksBaseURL is specified.

iCloudContainerEnvironment

  For non-App Store exports, if the app is using CloudKit, this configures the   
  "com.apple.developer.icloud-container-environment" entitlement. Available options:   
  Development and Production. Defaults to Development.

manifest : Dictionary

  For non-App Store exports, users can download your app over the web by opening your   
  distribution manifest file in a web browser. To generate a distribution manifest, the   
  value of this key should be a dictionary with three sub-keys: appURL, displayImageURL,   
  fullSizeImageURL. The additional sub-key assetPackManifestURL is required when using on demand resources.

method : String

  Describes how Xcode should export the archive. Available options: app-store, ad-hoc,   
  package, enterprise, development, and developer-id. The list of options varies based on   
  the type of archive. Defaults to development.

onDemandResourcesAssetPacksBaseURL : String

  For non-App Store exports, if the app uses On Demand Resources and   
  embedOnDemandResourcesAssetPacksInBundle isn't YES, this should be a base URL specifying   
  where asset packs are going to be hosted. This configures the app to download asset   
  packs from the specified URL.

teamID : String

  The Developer Portal team to use for this export. Defaults to the team used to build the archive.

thinning : String

  For non-App Store exports, should Xcode thin the package for one or more device   
  variants? Available options: <none> (Xcode produces a non-thinned universal app),   
  <thin-for-all-variants> (Xcode produces a universal app and all available thinned   
  variants), or a model identifier for a specific device (e.g. "iPhone7,1"). Defaults to <none>.

uploadBitcode : Bool

  For App Store exports, should the package include bitcode? Defaults to YES.

uploadSymbols : Bool

  For App Store exports, should the package include symbols? Defaults to YES.
```

### xcodebuild 使用说明

```
NAME

xcodebuild -- build Xcode projects and workspaces

SYNOPSIS

xcodebuild [-project name.xcodeproj] [[-target targetname] ... | -alltargets] [-configuration configurationname] [-sdk [sdkfullpath | sdkname]] [action ...] [buildsetting=value ...] [-userdefault=value ...]
xcodebuild [-project name.xcodeproj] -scheme schemename [[-destination destinationspecifier] ...] [-destination-timeout value] [-configuration configurationname] [-sdk [sdkfullpath | sdkname]] [action ...] [buildsetting=value ...] [-userdefault=value ...]
xcodebuild -workspace name.xcworkspace -scheme schemename [[-destination destinationspecifier] ...] [-destination-timeout value] [-configuration configurationname] [-sdk [sdkfullpath | sdkname]] [action ...] [buildsetting=value ...] [-userdefault=value ...]
xcodebuild -version [-sdk [sdkfullpath | sdkname]] [infoitem]
xcodebuild -showsdks
xcodebuild -showBuildSettings [-project name.xcodeproj | [-workspace name.xcworkspace -scheme schemename]]
xcodebuild -list [-project name.xcodeproj | -workspace name.xcworkspace]
xcodebuild -exportArchive -archivePath xcarchivepath -exportPath destinationpath -exportOptionsPlist path
xcodebuild -exportLocalizations -project name.xcodeproj -localizationPath path [[-exportLanguage language] ...]
xcodebuild -importLocalizations -project name.xcodeproj -localizationPath path
```