import 'basic.dart';
import 'refer.dart';

/// 台风
class Storm {
  /// 台风ID
  late String id;

  /// 台风名称
  late String name;

  /// 台风所处流域
  late String basin;

  /// 台风所处年份
  late String year;

  /// 是否为活跃台风
  late String active;

  Storm.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'] as String;
    name = map['name'] as String;
    basin = map['basin'] as String;
    year = map['year'] as String;
    active = map['active'] as String;
  }
}

/// 台风列表查询结果
class StormListRsp {
  /// API状态码
  late String code;

  /// Basic 包含 接口更新时间, 	所查询城市的天气预报网页
  late Basic basic;

  /// Refer 数据来源信息
  late Refer refer;

  /// 台风列表数据
  late List<Storm> stormList;

  /// fromMap
  StormListRsp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    basic = Basic.fromMap(map['basic'] ?? Map());
    refer = Refer.fromMap(map['refer'] ?? Map());
    stormList = (map["stormList"] ?? []).map((v) => Storm.fromMap(v)).toList();
  }
}

/// 台风风圈
class StormTrackWind {
  /// 东北半径
  late String neRadius;

  /// 东南半径
  late String seRadius;

  /// 西南半径
  late String swRadius;

  /// 西北半径
  late String nwRadius;

  StormTrackWind.fromMap(Map<String, dynamic> map) {
    neRadius = map['neRadius'] as String;
    seRadius = map['seRadius'] as String;
    swRadius = map['swRadius'] as String;
    nwRadius = map['nwRadius'] as String;
  }
}

/// 台风当前信息数据
class StormTrackNow {
  /// 台风信息发布时间
  late String pubTime;

  /// 台风所处经度
  late String lon;

  /// 台风所处纬度
  late String lat;

  /// 台风类型
  late String type;

  /// 台风中心气压
  late String pressure;

  /// 台风附近最大风速
  late String windSpeed;

  /// 台风移动速度
  late String moveSpeed;

  /// 台风移动方位
  late String moveDir;

  /// 台风移动方位360度方向 ，可能为空
  late String move360;

  /// 台风7级风圈，可能为空
  StormTrackWind? windRadius30;

  /// 台风10级风圈，可能为空
  StormTrackWind? windRadius50;

  /// 台风12级风圈，可能为空
  StormTrackWind? windRadius64;

  StormTrackNow.fromMap(Map<dynamic, dynamic> map) {
    pubTime = map['pubTime'] as String;
    lon = map['lon'] as String;
    lat = map['lat'] as String;
    type = map['type'] as String;
    pressure = map['pressure'] as String;
    windSpeed = map['windSpeed'] as String;
    moveSpeed = map['moveSpeed'] as String;
    moveDir = map['moveDir'] as String;
    move360 = map['move360'] as String? ?? '';
    if (map.containsKey('windRadius30')) {
      windRadius30 = StormTrackWind.fromMap(map['windRadius30']);
    }
    if (map.containsKey('windRadius50')) {
      windRadius50 = StormTrackWind.fromMap(map['windRadius50']);
    }
    if (map.containsKey('windRadius64')) {
      windRadius64 = StormTrackWind.fromMap(map['windRadius64']);
    }
  }
}

/// 台风路径数据
class StormTrack {
  /// 台风信息发布时间
  late String time;

  /// 台风所处经度
  late String lon;

  /// 台风所处纬度
  late String lat;

  /// 台风类型
  late String type;

  /// 台风中心气压
  late String pressure;

  /// 台风附近最大风速
  late String windSpeed;

  /// 台风移动速度
  late String moveSpeed;

  /// 台风移动方位
  late String moveDir;

  /// 台风移动方位360度方向 ，可能为空
  late String move360;

  /// 台风7级风圈，可能为空
  StormTrackWind? windRadius30;

  /// 台风10级风圈，可能为空
  StormTrackWind? windRadius50;

  /// 台风12级风圈，可能为空
  StormTrackWind? windRadius64;

  StormTrack.fromMap(Map<dynamic, dynamic> map) {
    time = map['time'] as String;
    lon = map['lon'] as String;
    lat = map['lat'] as String;
    type = map['type'] as String;
    pressure = map['pressure'] as String;
    windSpeed = map['windSpeed'] as String;
    moveSpeed = map['moveSpeed'] as String;
    moveDir = map['moveDir'] as String;
    move360 = map['move360'] as String? ?? '';
    if (map.containsKey('windRadius30')) {
      windRadius30 = StormTrackWind.fromMap(map['windRadius30']);
    }
    if (map.containsKey('windRadius50')) {
      windRadius50 = StormTrackWind.fromMap(map['windRadius50']);
    }
    if (map.containsKey('windRadius64')) {
      windRadius64 = StormTrackWind.fromMap(map['windRadius64']);
    }
  }
}

/// 台风实况和路径查询结果
class StormTracRsp {
  /// API状态码
  late String code;

  /// Basic 包含 接口更新时间, 	所查询城市的天气预报网页
  late Basic basic;

  /// Refer 数据来源信息
  late Refer refer;

  /// 是否为活跃台风 1:活跃台风; 0:停编
  late String isActive;

  /// 台风当前信息数据
  late StormTrackNow now;

  /// 台风路径数据
  late List<StormTrack> trackList;

  /// fromMap
  StormTracRsp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    basic = Basic.fromMap(map['basic'] ?? Map());
    refer = Refer.fromMap(map['refer'] ?? Map());
    isActive = map['isActive'] ?? '0';
    now = StormTrackNow.fromMap(map['now']);
    trackList = (map["trackList"] as List? ?? [])
        .map((v) => StormTrack.fromMap(v))
        .toList();
  }
}

/// 台风预报
class Forecast {
  late String fxTime;
  late String lon;
  late String lat;
  late String type;
  late String pressure;
  late String windSpeed;
  late String moveSpeed;
  late String moveDir;
  late String move360;

  Forecast.fromMap(Map<String, dynamic> map) {
    fxTime = map['fxTime'] as String;
    lon = map['lon'] as String;
    lat = map['lat'] as String;
    type = map['type'] as String;
    pressure = map['pressure'] as String;
    windSpeed = map['windSpeed'] as String;
    moveSpeed = map['moveSpeed'] as String;
    moveDir = map['moveDir'] as String;
    move360 = map['move360'] as String? ?? '';
  }
}

/// 台风预报查询结果
class ForecastRsp {
  /// API状态码
  late String code;

  /// Basic 包含 接口更新时间, 	所查询城市的天气预报网页
  late Basic basic;

  /// Refer 数据来源信息
  late Refer refer;

  /// 台风预报列表
  late List<Forecast> forecastList;

  /// fromMap
  ForecastRsp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    basic = Basic.fromMap(map['basic'] ?? Map());
    refer = Refer.fromMap(map['refer'] ?? Map());
    forecastList = (map["forecastList"] as List? ?? [])
        .map((v) => Forecast.fromMap(v))
        .toList();
  }
}
