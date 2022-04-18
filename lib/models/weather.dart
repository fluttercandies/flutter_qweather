import 'basic.dart';
import 'refer.dart';

/// 实时天气
class WeatherNow {
  /// 云量，百分比	15
  late String cloud;

  /// 云量
  late String dew;

  /// 体感温度，默认单位：摄氏度
  late String feelsLike;

  /// 相对湿度
  late String humidity;

  /// 和风实况天气状况图标代码
  late String icon;

  /// 实况观测时间
  late String obsTime;

  /// 降水量
  late String precip;

  /// 大气压强
  late String pressure;

  /// 温度，默认单位：摄氏度
  late String temp;

  /// 实况天气状况
  late String text;

  /// 能见度，默认单位：公里
  late String vis;

  /// 风向360角度
  late String wind360;

  /// 风向
  late String windDir;

  /// 风力
  late String windScale;

  /// 风速，公里/小时
  late String windSpeed;

  /// fromMap
  WeatherNow.fromMap(Map<dynamic, dynamic> map) {
    cloud = map['cloud'] as String;
    dew = map['dew'] as String;
    feelsLike = map['feelsLike'] as String;
    humidity = map['humidity'] as String;
    icon = map['icon'] as String;
    obsTime = map['obsTime'] as String;
    precip = map['precip'] as String;
    pressure = map['pressure'] as String;
    temp = map['temp'] as String;
    text = map['text'] as String;
    vis = map['vis'] as String;
    wind360 = map['wind360'] as String;
    windDir = map['windDir'] as String;
    windScale = map['windScale'] as String;
    windSpeed = map['windSpeed'] as String;
  }
}

/// 实时天气查询结果
class WeatherNowResp {
  /// API状态码
  late String code;

  /// Basic 包含 接口更新时间, 	所查询城市的天气预报网页
  late Basic basic;

  /// Refer 数据来源信息
  late Refer refer;

  /// WeatherNow 实时天气
  late WeatherNow now;

  /// fromMap
  WeatherNowResp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    basic = Basic.fromMap(map['basic'] ?? Map());
    refer = Refer.fromMap(map['refer'] ?? Map());
    now = WeatherNow.fromMap(map['now'] ?? Map());
  }
}

/// 逐天预报
class WeatherDaily {
  /// 预报日期
  late String fxDate;

  /// 日出时间
  late String sunrise;

  /// 日落时间
  late String sunset;

  /// 月升时间
  late String moonRise;

  /// 月落时间
  late String moonSet;

  /// 月相名称
  late String moonPhase;

  /// 月相图标代码
  late String moonPhaseIcon;

  /// 最高温度
  late String tempMax;

  /// 最低温度
  late String tempMin;

  /// 白天天气状况代码
  late String iconDay;

  /// 晚间天气状况代码
  late String iconNight;

  /// 白天天气状况描述
  late String textDay;

  /// 晚间天气状况描述
  late String textNight;

  /// 白天风向360角度
  late String wind360Day;

  /// 晚间风向360角度
  late String wind360Night;

  /// 白天风向
  late String windDirDay;

  /// 夜间风向
  late String windDirNight;

  /// 白天风力
  late String windScaleDay;

  /// 夜间风力
  late String windScaleNight;

  /// 白天风速，公里/小时
  late String windSpeedDay;

  /// 夜间风速，公里/小时
  late String windSpeedNight;

  /// 相对湿度
  late String humidity;

  /// 降水量
  late String precip;

  /// 大气压强
  late String pressure;

  /// 当天云量
  late String cloud;

  /// 紫外线强度指数
  late String uvIndex;

  /// 能见度，公里
  late String vis;

  /// fromMap
  WeatherDaily.fromMap(Map<dynamic, dynamic> map) {
    fxDate = map['fxDate'] ?? '';
    sunrise = map['sunrise'] ?? '';
    sunset = map['sunset'] ?? '';
    moonRise = map['moonRise'] ?? '';
    moonSet = map['moonSet'] ?? '';
    moonPhase = map['moonPhase'] ?? '';
    moonPhaseIcon = map['moonPhaseIcon'] ?? '';
    tempMax = map['tempMax'] ?? '';
    tempMin = map['tempMin'] ?? '';
    iconDay = map['iconDay'] ?? '';
    iconNight = map['iconNight'] ?? '';
    textDay = map['textDay'] ?? '';
    textNight = map['textNight'] ?? '';
    wind360Day = map['wind360Day'] ?? '';
    wind360Night = map['wind360Night'] ?? '';
    windDirDay = map['windDirDay'] ?? '';
    windDirNight = map['windDirNight'] ?? '';
    windScaleDay = map['windScaleDay'] ?? '';
    windScaleNight = map['windScaleNight'] ?? '';
    windSpeedDay = map['windSpeedDay'] ?? '';
    windSpeedNight = map['windSpeedNight'] ?? '';
    humidity = map['humidity'] ?? '';
    precip = map['precip'] ?? '';
    pressure = map['pressure'] ?? '';
    cloud = map['cloud'] ?? '';
    uvIndex = map['uvIndex'] ?? '';
    vis = map['vis'] ?? '';
  }
}

/// 逐天预报查询结果
class WeatherDailyResp {
  /// API状态码 安卓成功是 'OK' ios 是 '200'
  late String code;

  /// Basic 包含 接口更新时间、所查询城市的天气预报网页
  late Basic basic;

  /// Refer 数据来源信息
  late Refer refer;

  /// 逐天预报
  late List<WeatherDaily> daily;

  /// fromMap
  WeatherDailyResp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    basic = Basic.fromMap(map['basic'] ?? Map());
    refer = Refer.fromMap(map['refer'] ?? Map());
    daily = map.containsKey('daily')
        ? (map['daily'] as List).map((v) => WeatherDaily.fromMap(v)).toList()
        : [];
  }
}

/// 逐时预报
class WeatherHourly {
  /// 预报日期 2021-04-21T18:00+08:00
  late String fxTime;

  /// 温度
  late String temp;

  /// 天气状况代码
  late String icon;

  /// 天气状况描述
  late String text;

  /// 风向360角度
  late String wind360;

  /// 风向
  late String windDir;

  /// 风力
  late String windScale;

  /// 风速，公里/小时
  late String windSpeed;

  ///	相对湿度
  late String humidity;

  /// 降水量
  late String precip;

  /// 逐小时预报降水概率，百分比数值，可能为空
  late String pop;

  /// 大气压强
  late String pressure;

  /// 露点温度
  late String dew;

  /// 云量，百分比	15
  late String cloud;

  /// fromMap
  WeatherHourly.fromMap(Map<dynamic, dynamic> map) {
    fxTime = map['fxTime'] ?? '';
    temp = map['temp'] ?? '';
    icon = map['icon'] ?? '';
    text = map['text'] ?? '';
    wind360 = map['wind360'] ?? '';
    windDir = map['windDir'] ?? '';
    windScale = map['windScale'] ?? '';
    windSpeed = map['windSpeed'] ?? '';
    humidity = map['humidity'] ?? '';
    precip = map['precip'] ?? '';
    pop = map['pop'] ?? '';
    pressure = map['pressure'] ?? '';
    dew = map['dew'] ?? '';
    cloud = map['cloud'] ?? '';
  }
}

/// 逐时预报查询结果
class WeatherHourlyResp {
  /// API状态码 安卓成功是 'OK' ios 是 '200'
  late String code;

  /// Basic 包含 接口更新时间, 	所查询城市的天气预报网页
  late Basic basic;

  /// Refer 数据来源信息
  late Refer refer;

  /// 逐时预报
  late List<WeatherHourly> hourly;

  /// fromMap
  WeatherHourlyResp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    basic = Basic.fromMap(map['basic'] ?? Map());
    refer = Refer.fromMap(map['refer'] ?? Map());
    hourly = map.containsKey('hourly')
        ? (map['hourly'] as List).map((v) => WeatherHourly.fromMap(v)).toList()
        : [];
  }
}

/// 分钟降水
class WeatherMinutel {
  /// 预报日期 2021-04-21T17:25+08:00
  late String fxTime;

  /// 	降水量
  late String precip;

  /// 降水类型
  late String type;

  /// fromMap
  WeatherMinutel.fromMap(Map<dynamic, dynamic> map) {
    fxTime = map['fxTime'] ?? '';
    precip = map['precip'] ?? '';
    type = map['type'] ?? '';
  }
}

/// 分钟降水查询结果
class WeatherMinutelyResp {
  /// API状态码 安卓成功是 'OK' ios 是 '200'
  late String code;

  /// Basic 包含 接口更新时间、所查询城市的天气预报网页
  late Basic basic;

  /// Refer 数据来源信息
  late Refer refer;

  /// 分钟降水描述
  late String summary;

  /// 分钟降水
  late List<WeatherMinutel> minutely;

  /// fromMap
  WeatherMinutelyResp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    summary = map['summary'] as String;
    basic = Basic.fromMap(map['basic'] ?? Map());
    refer = Refer.fromMap(map['refer'] ?? Map());
    minutely = map.containsKey('minutely')
        ? (map['minutely'] as List)
            .map((v) => WeatherMinutel.fromMap(v))
            .toList()
        : [];
  }
}
