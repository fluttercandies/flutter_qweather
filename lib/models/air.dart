import 'basic.dart';
import 'refer.dart';

/// 当前监测站
class StationNow {
  /// 数据发布时间
  late String pubTime;

  /// 站点名称
  late String name;

  /// 站点id
  late int id;

  /// 空气质量指数，AQI和PM25的关系
  late int aqi;

  /// 主要污染物
  late String primary;

  /// 实时空气质量指数等级
  late int level;

  /// 实时空气质量指数级别
  late String category;

  /// PM 10
  late int pm10;

  /// PM 2.5
  late int pm2p5;

  /// 二氧化氮
  late int no2;

  /// 二氧化硫
  late int so2;

  /// 一氧化碳
  late double co;

  /// 臭氧
  late int o3;

  StationNow.fromMap(Map<dynamic, dynamic> map) {
    pubTime = map['pubTime'] as String;
    name = map['name'] as String;
    id = map['id'] as int;
    aqi = map['aqi'] as int;
    primary = map['primary'] as String;
    level = map['level'] as int;
    category = map['category'] as String;
    pm10 = map['pm10'] as int;
    pm2p5 = map['pm2p5'] as int;
    no2 = map['no2'] as int;
    so2 = map['so2'] as int;
    co = map['co'] as double;
    o3 = map['o3'] as int;
  }
}

/// 实时空气质量
class AirNow {
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

  /// PM 10
  late String pm10;

  /// PM 2.5
  late String pm2p5;

  /// 二氧化氮
  late String no2;

  /// 二氧化硫
  late String so2;

  /// 一氧化碳
  late String co;

  /// 臭氧
  late String o3;

  AirNow.fromMap(Map<dynamic, dynamic> map) {
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

/// 实时空气质量查询结果
class AirNowResp {
  /// API状态码
  late String code;

  /// Basic 包含 接口更新时间, 	所查询城市的天气预报网页
  late Basic basic;

  /// Refer 数据来源信息
  late Refer refer;

  /// AirNow 实时空气质量
  late AirNow now;

  late List<StationNow> stations;

  /// fromMap
  AirNowResp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    basic = Basic.fromMap(map['basic'] ?? Map());
    refer = Refer.fromMap(map['refer'] ?? Map());
    now = AirNow.fromMap(map['now'] ?? Map());
    stations = map.containsKey('airNowStationBean')
        ? (map['airNowStationBean'] as List)
            .map((v) => StationNow.fromMap(v))
            .toList()
        : [];
  }
}

/// 逐天空气质量
class AirDaily {
  /// 预报日期
  late String fxDate;

  /// 空气质量指数，AQI和PM25的关系
  late String aqi;

  /// 主要污染物
  late String primary;

  /// 实时空气质量指数等级
  late String level;

  /// 实时空气质量指数级别
  late String category;

  AirDaily.fromMap(Map<dynamic, dynamic> map) {
    fxDate = map['fxDate'] as String;
    aqi = map['aqi'] as String;
    primary = map['primary'] as String;
    level = map['level'] as String;
    category = map['category'] as String;
  }
}

/// 逐天空气质量预报查询结果
class AirDailyResp {
  /// API状态码
  late String code;

  /// Basic 包含 接口更新时间, 	所查询城市的天气预报网页
  late Basic basic;

  /// Refer 数据来源信息
  late Refer refer;

  /// 逐天预报
  late List<AirDaily> daily;

  /// fromMap
  AirDailyResp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    basic = Basic.fromMap(map['basic'] ?? Map());
    refer = Refer.fromMap(map['refer'] ?? Map());
    daily = map.containsKey('airDailyBeans')
        ? (map['airDailyBeans'] as List)
            .map((v) => AirDaily.fromMap(v))
            .toList()
        : [];
  }
}
