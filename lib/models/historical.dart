import 'basic.dart';
import 'refer.dart';

/// 历史当天天气
class HistoricalDailyWeather {
  /// 当天日期
  late String date;

  /// 日出时间
  late String sunrise;

  /// 日落时间
  late String sunset;

  /// 月升时间
  late String moonrise;

  /// 月落时间
  late String moonset;

  /// 月相
  late String moonPhase;

  /// 最高温度
  late String tempMax;

  /// 最低温度
  late String tempMin;

  /// 相对温度
  late String humidity;

  /// 降雨量
  late String precip;

  /// 大气压强
  late String pressure;

  HistoricalDailyWeather.fromMap(Map<dynamic, dynamic> map) {
    date = map['date'] as String;
    sunrise = map['sunrise'] as String;
    sunset = map['sunset'] as String;
    moonrise = map['moonrise'] as String;
    moonset = map['moonset'] as String;
    moonPhase = map['moonPhase'] as String;
    tempMax = map['tempMax'] as String;
    tempMin = map['tempMin'] as String;
    humidity = map['humidity'] as String;
    precip = map['precip'] as String;
    pressure = map['pressure'] as String;
  }
}

/// 历史当天逐小时天气
class HistoricalHourlyWeather {
  /// 历史当天天气时间
  late String time;

  /// 温度
  late String temp;

  /// 天气状况图标代码
  late String icon;

  /// 天气状况代码
  late String text;

  /// 风向360角度
  late String wind360;

  /// 风向
  late String windDir;

  /// 风力
  late String windScale;

  /// 风速
  late String windSpeed;

  /// 温度
  late String humidity;

  /// 打起压强
  late String pressure;

  /// 降雨量
  late String precip;

  HistoricalHourlyWeather.fromMap(Map<dynamic, dynamic> map) {
    time = map['time'] as String;
    temp = map['temp'] as String;
    icon = map['icon'] as String;
    text = map['text'] as String;
    wind360 = map['wind360'] as String;
    windDir = map['windDir'] as String;
    windScale = map['windScale'] as String;
    windSpeed = map['windSpeed'] as String;
    humidity = map['humidity'] as String;
    pressure = map['pressure'] as String;
    precip = map['precip'] as String;
  }
}

/// 历史天气查询结果
class HistoricalWeatherRsp {
  /// API状态码
  late String code;

  /// Basic 包含 接口更新时间, 	所查询城市的天气预报网页
  late Basic basic;

  /// Refer 数据来源信息
  late Refer refer;

  /// HistoricalDailyWeather 历史当天天气
  late HistoricalDailyWeather dailyWeather;

  /// List<HistoricalHourlyWeather> 当天逐小时天气
  late List<HistoricalHourlyWeather> hourlyWeatherList;

  /// fromMap
  HistoricalWeatherRsp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    basic = Basic.fromMap(map['basic'] ?? Map());
    refer = Refer.fromMap(map['refer'] ?? Map());
    dailyWeather = HistoricalDailyWeather.fromMap(map['dailyBean'] ?? Map());
    hourlyWeatherList = List.from((map['hourlyBeans'] as List? ?? [])
        .map((v) => HistoricalHourlyWeather.fromMap(v)));
  }
}

/// 历史当天逐小时空气质量
class HistoricalHourlyAir {
  /// 数据发布时间
  late String pubTime;

  /// 空气质量指数，AQI和PM25的关系
  late String aqi;

  /// 主要污染物
  late String primary;

  /// 实时空气质量指数等级
  late String level;

  /// 实时空气质量指数级别
  late String category;

  /// PM10
  late String pm10;

  /// PM2.5
  late String pm2p5;

  /// 二氧化氮
  late String no2;

  /// 二氧化硫
  late String so2;

  /// 一氧化碳
  late String co;

  /// 臭氧
  late String o3;

  HistoricalHourlyAir.fromMap(Map<String, dynamic> map) {
    pubTime = map['pubTime'] as String;
    aqi = map['aqi'] as String;
    primary = map['primary'] as String;
    level = map['level'] as String;
    category = map['category'] as String;
    pm10 = map['pm10'] as String;
    pm2p5 = map['pm2p5'] as String;
    no2 = map['no2'] as String;
    so2 = map['so2'] as String;
    co = map['co'] as String;
    o3 = map['o3'] as String;
  }
}

/// 历史当天逐小时空气质量查询结果
class HistoricalHourlyAirRsp {
  /// API状态码
  late String code;

  /// Basic 包含 接口更新时间, 	所查询城市的天气预报网页
  late Basic basic;

  /// Refer 数据来源信息
  late Refer refer;

  /// HistoricalDailyWeather 历史当天天气
  late HistoricalDailyWeather dailyWeather;

  /// List<HistoricalHourlyAir> 历史当天逐小时空气质量
  late List<HistoricalHourlyAir> hourlyAirList;

  /// fromMap
  HistoricalHourlyAirRsp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    basic = Basic.fromMap(map['basic'] ?? Map());
    refer = Refer.fromMap(map['refer'] ?? Map());
    hourlyAirList = List.from((map['airHourlyBeans'] as List? ?? [])
        .map((v) => HistoricalHourlyAirRsp.fromMap(v)));
  }
}