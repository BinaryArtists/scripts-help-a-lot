# PackageApplication

## unable to find utility "PackageApplication", not a developer tool or in PATH

### 错误

Xcode8.3下, 使用用命令进行打包, 提示错误如下:
```
error: unable to find utility "PackageApplication", not a developer tool or in PATH
```

### 解决

根据对比发现新版的Xcode少了这个PackageApplication 
先去找个旧版的Xcode里面copy一个到下面的目录:

```
/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/
```

然后, 执行以下两条命令:

```
sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer/

chmod +x /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/PackageApplication
```

执行完成后, 重新用命令行打包, 此问题便不会存在了。