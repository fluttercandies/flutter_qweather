import 'basic.dart';
import 'refer.dart';

/// 实时天气情况
class WeatherNow {
  late String code; // API状态码
  late Basic basic; // Basic包含 接口更新时间, 	所查询城市的天气预报网页
  late Refer refer; // Refer数据来源信息

  late String cloud; // 云量，百分比	15
  late String dew; // 云量
  late String feelsLike; // 体感温度，默认单位：摄氏度
  late String humidity; // 相对湿度
  late String icon; // 和风实况天气状况图标代码
  late String obsTime; // 实况观测时间
  late String precip; // 降水量
  late String pressure; // 大气压强
  late String temp; // 温度，默认单位：摄氏度
  late String text; // 实况天气状况
  late String vis; // 能见度，默认单位：公里
  late String wind360; // 风向360角度
  late String windDir; // 风向
  late String windScale; // 风力
  late String windSpeed; // 风速，公里/小时

  WeatherNow.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    basic = Basic.fromMap(map['basic'] ?? Map());
    refer = Refer.fromMap(map['refer'] ?? Map());
    Map<String,String> now = Map.from(map['now']);
    cloud = now['cloud'] as String;
    dew = now['dew'] as String;
    feelsLike = now['feelsLike'] as String;
    humidity = now['humidity'] as String;
    icon = now['icon'] as String;
    obsTime = now['obsTime'] as String;
    precip = now['precip'] as String;
    pressure = now['pressure'] as String;
    temp = now['temp'] as String;
    text = now['text'] as String;
    vis = now['vis'] as String;
    wind360 = now['wind360'] as String;
    windDir = now['windDir'] as String;
    windScale = now['windScale'] as String;
    windSpeed = now['windSpeed'] as String;
  }
}
