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

脚本参考：关注[build.sh]()


### 构建命令 之 xcbuild


### 构建命令 之 gym


### 构建命令 之 xcodebuild


## 上传


## 