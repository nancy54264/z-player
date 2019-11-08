# ZPlayer


## 简介
> 一个视频采集以及在线视频播放器。初学者学习Flutter的练手项目，会有很多比较简陋的地方，欢迎提意见。


## TODO

+ [ ] 收藏功能
+ [ ] 本地缓存
+ [ ] 界面优化
+ [ ] 搜索记录

## 如何使用
> 本应用支持网络地址播放(媒体)和Api资源采集(资源)。可以提供实验的地址:

### 媒体文件示例：

+ butterfly : https://flutter.github.io/assets-for-api-docs/videos/butterfly.mp4
+ CCTV-1高清 :  http://ivi.bupt.edu.cn/hls/cctv1hd.m3u8

### 资源采集网示例

+ OK资源网 
    + httpsApi: http://cj.okzy.tv/inc/apickm3u8s.php


## 截图


|<img width="240" src="https://user-images.githubusercontent.com/16064095/68454910-01816180-0235-11ea-95ca-fd0c2e205182.png"/>|<img width="240" src="https://user-images.githubusercontent.com/16064095/68455024-4a391a80-0235-11ea-98ff-5e933a45bf2d.png"/>|<img width="240" src="https://user-images.githubusercontent.com/16064095/68455049-5624dc80-0235-11ea-950e-e087aa3b652f.png">|
|---|---|---|
|<img width="240" src="https://user-images.githubusercontent.com/16064095/68455059-5ae99080-0235-11ea-9861-e1f475b528ec.png">|<img width="240" src="https://user-images.githubusercontent.com/16064095/68455065-5fae4480-0235-11ea-952e-7aaa93071d42.png">|
|<img width="240" src="https://user-images.githubusercontent.com/16064095/68455622-c8e28780-0236-11ea-8438-a2e7c3731340.png">||




## Release
> 只有Android版本的包(使用最新版本的SDK打包的，可能低版本不能用，未做测试).[点击下载](https://github.com/nancy54264/z-player/releases/download/1.0.0/app-arm64-v8a-release.apk)

## Build
```shell script
flutter build apk --target-platform android-arm,android-arm64 --split-per-abi
```