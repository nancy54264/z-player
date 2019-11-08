# ZPlayer


## 简介
> 初学者学习Flutter的练手项目，会有很多比较简陋的地方，欢迎提意见。


## TODO

+ [ ] 收藏功能
+ [ ] 本地缓存
+ [ ] 界面优化
+ [ ] 搜索记录

## 如何使用
> 本应用支持网络地址播放(媒体)和Api资源采集(资源)。可以提供实验的地址:

+ butterfly : https://flutter.github.io/assets-for-api-docs/videos/butterfly.mp4
+ CCTV-1高清 :  http://ivi.bupt.edu.cn/hls/cctv1hd.m3u8

### 资源采集网示例

```
"name": "ok资源网站",
"uri": "http://www.jisudhw.com",
"httpApi": "http://cj.okzy.tv/inc/apickm3u8.php",
"httpsApi": "http://cj.okzy.tv/inc/apickm3u8s.php",
```

## 截图


## Release
> 只有Android版本的包(使用最新版本的SDK打包的，可能低版本不能用，未做测试).[下载]()

## Build
```shell script
flutter build apk --target-platform android-arm,android-arm64 --split-per-abi
```