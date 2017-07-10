## script-ios

scripts i used when developing ios stuff...

以下链接需要处理：
1. [一条命令 快速配置 Xcode 各种 环境](https://my.oschina.net/u/727843/blog/731322)

### PNG压缩
    1. https://imageoptim.com/howto.html

### png尺寸检查
    1. http://blog.devtang.com/2012/08/26/use-script-to-power-up-ui-work/

### 脚本自动生成小尺寸的图片
    1. http://blog.devtang.com/2012/08/26/use-script-to-power-up-ui-work/
        > brew link jpeg, brew install imagemagick
    2. 同时推荐了：http://www.xnview.com/en/xnconvert/

### app icon 生成
    1. https://github.com/smallmuou/ios-icon-generator
    2. 包含android的，输入为1024：https://github.com/hibara/create-ios-all-icons-shellscript

### 搜索无用的图片
    1. https://github.com/examplecode/unused-image

### IOS压力测试工具
    1. http://my.oschina.net/u/147181/blog/193396, 相关的github地址：https://github.com/jonathanpenn/ui-auto-monkey

### 功能测试
    1. https://github.com/krukow/calabash-script

### 重新签名IPA
    1. https://github.com/nanonation/floatsign

### 脚本生成启动图
    1. https://github.com/danielpovlsen/ios-icons-launch-images-generator

### 编译脚本：（用于持续集成）
    1. https://github.com/splinesoft/SSBuild
    2. https://github.com/spritefly/ios-builder
    3. https://github.com/jtribe/ios-tools
    4. https://github.com/DavidBenko/iOS-Enterprise-Build-Script
    5. https://github.com/juxingzhutou/iOS-Build-Scripts/blob/master/build.sh
    6. 持续集成：https://github.com/iOSeros/BuildScripts

    7. [Jenkins+GitHub+fir_cli 一行命令从源码到fir.im](http://www.jianshu.com/p/0515e2465c49)

### 编译脚本 之 [nomad/shenzhen](https://github.com/nomad/shenzhen)

  * 可参考：[iOS持续部署平台（一）：SHENZHEN](http://blog.csdn.net/ljj_saver/article/details/47009723)

  * 血泪史
    1. gem install nokogiri的时候出错：参考[installing_nokogiri](http://www.nokogiri.org/tutorials/installing_nokogiri.html)

  * ipa build 执行的时候，因为各种参数，它依赖xcode配置，所以在project-schemaname-configurations-use xxx for command-line builds，这里对xxx的配置，决定了编译什么版本～

### 自动检查证书和配置文件的匹配性
    1. https://github.com/quadion/iOSValidation

### 脸书出品：https://github.com/facebook/xctool

    1. 参考[使用fastlane gym/xctool编写ipa打包脚本](http://www.jianshu.com/p/54ab07f2e63b)，使用xctool、gym编译iOS工程：
        > 简书讲两个脚本更新在：https://github.com/xilin/ios-build-script
        > gym：https://github.com/fastlane/fastlane
          > 1.How to set project path? GYM_PROJECT enviromental variable
        > xctool：https://github.com/facebook/xctool
        > fir：https://github.com/FIRHQ/fir-cli

        mark 一下，xcode 8下，貌似有点问题。。。暂时放在这里。

    2. 持续集成

        [使用fastlane实现iOS持续集成](http://blog.csdn.net/azhou_hui/article/details/51244667)

        mark 一下，xcode 8下，貌似有点问题。。。暂时放在这里。

### check-signature，脚本


### imagemagick 强大的图像处理库

安装 imagemagick：
brew install imagemagick

[安装 bew](http://webmedia.blog.163.com/blog/static/416695020123261226695/)
```
cd /usr/local
sudo mkdir homebrew
curl -L https://github.com/mxcl/homebrew/tarball/master | sudo tar xz --strip 1 -C homebrew
cd homebrew/bin
./brew -v
file brew
cat brew | moresudo ./brew update

...

如果~下没有文件".bash_profile" 请执行： touch '.bash_profile'

...

vim '.bash_profile'加入
export PATH=$PATH:/usr/local/homebrew/bin
```

### [清理 iOS 项目不用的图片资源](http://www.cocoachina.com/ios/20160531/16536.html)

  1. 图片调用方法：1. [UIImage imageNamed:@"image"], 2. <imageview image="image" id="rb9-sl-eqm"></imageview image="image" id="rb9-sl-eqm">, 3. 用法较少，就是名称中有固定编码的，比如"320x480"/"1080x720"，然后根据屏幕适配；又比如"-1"/"-2",数组方式使用的。

  [https://github.com/jjz/script/blob/master/un_used.py](https://github.com/jjz/script/blob/master/un_used.py)

  2. 该仓库下还可以使用：unused-image.sh, 使用方法：
  This shell script is used to check and clean unused image file in your project  directory，supoort Android and IOS.
  * show unused image file
      ```
      ./unused-image.sh -p /path/of/your/project
      ```
  * show and clean unused image file
      ```
      ./unused-image.sh -r -p /path/of/your/project
      ```

### 搜索文件

搜索文件的方式可以使用grep,ack都是不错的工具，但是有一种更快，更好的搜索文件内容的方式:The Silver Searcher，项目地址：https://github.com/ggreer/the_silver_searcher，The Silver Searcher使用方便，更快，更简单。

安装The Silver Searcher:
```
brew install the_silver_searcher
```

使用ag搜索, 搜索该目录下以及其子目录下的所有包括image的文件:
```
ag “image” ‘./’
```

### plist cli编辑工具：PlistBuddy

[PlistBuddy](http://blog.csdn.net/a351945755/article/details/46561249)

### 网速模拟工具

[Hardware IO Tools for Xcode, Network Linker Conditioner](http://www.cnblogs.com/qiyer/p/5363983.html), Xcode - Open Develop Tools - More Tools ^_^
