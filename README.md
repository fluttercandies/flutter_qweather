# 和风天气 Flutter插件 flutter_qweather

和风天气插件

A qweather flutter plugin.

## 已有功能
  - [x] 实时天气查询
  - [x] 逐天天气查询
  - [x] 逐时天气查询
  - [x] 中国地区未来2小时内每5分钟降水查询
  - [ ] 其他功能...

## 开发计划
由于平时比较忙，计划每天增加一个接口。

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
  WeatherNow _weatherNow = await FlutterQweather.instance.getWeatherNow(location);
```

### 逐天天气查询

```dart
  String location = '116.41,39.92'；
  WeatherNow _weatherNow = await FlutterQweather.instance.getWeatherDaily(location, WeatherDailyForecast.WeatherForecast3Day);
```

### 逐时天气查询
```dart
  String location = '116.41,39.92'；
  WeatherNow _weatherNow = await FlutterQweather.instance.getWeatherHourly(location, WeatherHourlyForecast.WeatherForecast24Hour);
```

### 中国地区未来2小时内每5分钟降水查询
```dart
  String location = '116.41,39.92'；
  WeatherNow _weatherNow = await FlutterQweather.instance.getWeatherMinuteLy(location);
```


## Demo 
只打包了安卓[app-release.apk](app-release.apk)，ios 请自行运行 example



## 注意
目前仅实现了查询实时天气(很短时间写的东西，别指望我写多少😂)，其他接口后续慢慢加上。

## 贡献代码
第一次写跟原生交互的插件，望各位大大多多指点，有写得不好的地方，请直接用 PR 来怼我。