# Flutter 和风天气插件 

[![pub package](https://img.shields.io/pub/v/flutter_qweather?logo=dart&label=stable&style=flat-square)](https://pub.dev/packages/flutter_qweather)
[![pub package](https://img.shields.io/pub/v/flutter_qweather?color=42a012&include_prereleases&label=dev&logo=dart&style=flat-square)](https://pub.dev/packages/flutter_qweather)
[![CodeFactor](https://img.shields.io/codefactor/grade/github/fluttercandies/flutter_qweather?logo=codefactor&logoColor=%23ffffff&style=flat-square)](https://www.codefactor.io/repository/github/fluttercandies/flutter_qweather)
[![GitHub license](https://img.shields.io/github/license/fluttercandies/flutter_qweather?style=flat-square)](https://github.com/fluttercandies/flutter_qweather/blob/master/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/fluttercandies/flutter_qweather?logo=github&style=flat-square)](https://github.com/fluttercandies/flutter_qweather/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/fluttercandies/flutter_qweather?logo=github&style=flat-square)](https://github.com/fluttercandies/flutter_qweather/network)
<a target="_blank" href="https://jq.qq.com/?_wv=1027&k=5bcc0gy"><img border="0" src="https://pub.idqqimg.com/wpa/images/group.png" alt="FlutterCandies" title="FlutterCandies"></a>


## 已有功能
  - [x] 城市信息查询
  - [x] 热门城市查询
  - [x] POI信息搜索
  - [x] POI范围搜索
  - [x] 实时天气查询
  - [x] 逐天天气查询
  - [x] 逐时天气查询
  - [x] 中国地区未来2小时内每5分钟降水查询
  - [x] 当天生活指数查询
  - [x] 三天生活指数查询
  - [x] 天气灾害预警
  - [x] 灾害预警列表
  - [x] 空气质量实况
  - [x] 空气质量5天预报
  - [x] 历史天气
  - [x] 历史空气质量
  - [x] 日出日落
  - [x] 月升月落月相
  - [x] 太阳高度角
  - [x] 潮汐
  - [x] 潮流
  - [x] 台风列表
  - [x] 台风实况和路径
  - [x] 台风预报
  - [ ] 其他功能(好像没有了)

## 运行
### 注册账号 并 get 秘钥
首先你得有个和风天气的账号，[去吧骚年](https://id.qweather.com)。账号注册成功后在应用管理创建应用。注意包名别写错了哦。 

#### 本项目 example 的包名  

    Android：com.fluttercandies.flutter_qweather_example
    ios: com.fluttercandies.flutterQweatherExample
### 初始化插件
```dart
    QweatherConfig config = QweatherConfig(
        publicIdForAndroid: 'HE210xxxxxxxxxxxxx',
        keyForAndroid: '8453863xxxxxxxxxxxxxxxxxxxxxxxxxx',
        publicIdForIos: 'HE210xxxxxxxxxxxxx',
        keyForIos: 'aead742xxxxxxxxxxxxxxxxxxxxxxxxx',
        biz: false,
        debug: true);
    await FlutterQweather.instance.init(config);
```
  location 为 LocationID 或者 经纬度;
  LocationID 可通过geo 接口查询 或 查看[https://github.com/qwd/LocationList](https://github.com/qwd/LocationList)

### 实时天气查询
```dart
  String location = '116.41,39.92'；
  WeatherNow? _resp = await FlutterQweather.instance.getWeatherNow(location);
```

### 逐天天气查询

```dart
  String location = '116.41,39.92'；
  WeatherDailyResp? _resp = await FlutterQweather.instance.getWeatherDaily(location, WeatherDailyForecast.WeatherForecast3Day);
```

### 逐时天气查询
```dart
  String location = '116.41,39.92'；
  WeatherHourlyResp? _resp = await FlutterQweather.instance.getWeatherHourly(location, WeatherHourlyForecast.WeatherForecast24Hour);
```

### 中国地区未来2小时内每5分钟降水查询
```dart
  String location = '116.41,39.92'；
  WeatherMinutelyResp? _resp = await FlutterQweather.instance.getWeatherMinuteLy(location);
```
### 其他接口....相信你能看懂怎么用

## qweather_icons

若需要图标支持，请查看 [qweather_icons](https://pub.dev/packages/qweather_icons) 包。

## 贡献代码
第一次写跟原生交互的插件，望各位大大多多指点，有写得不好的地方，请直接用 PR 来怼我。
