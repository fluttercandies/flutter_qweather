import 'basic.dart';
import 'refer.dart';

/// 日出日落
class Sun {
  /// 日出时间
  late String sunrise;

  /// 日落时间
  late String sunset;

  Sun.fromMap(Map<dynamic, dynamic> map) {
    sunrise = map['sunrise'] as String;
    sunset = map['sunset'] as String;
  }
}

///  获取日出日落查询结果
class SunRsp {
  /// API状态码
  late String code;

  /// Basic 包含 接口更新时间, 	所查询城市的天气预报网页
  late Basic basic;

  /// Refer 数据来源信息
  late Refer refer;

  /// Sun 日出日落
  late Sun sun;

  SunRsp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    basic = Basic.fromMap(map['basic'] ?? Map());
    refer = Refer.fromMap(map['refer'] ?? Map());
    sun = Sun.fromMap(map);
  }
}

/// 月相信息
class MoonPhase {
  /// 月相逐小时预报时间
  late String fxTime;

  /// 月相数值
  late String value;

  /// 月相名字
  late String name;

  /// 月亮照明度，百分比数值
  late String illumination;

  /// 月相图标代码
  late String icon;

  MoonPhase.fromMap(Map<dynamic, dynamic> map) {
    fxTime = map['fxTime'] as String;
    value = map['value'] as String;
    name = map['name'] as String;
    illumination = map['illumination'] as String;
    icon = map['icon'] as String;
  }
}

/// 月升月落月相
class Moon {
  /// 月升时间
  late String moonrise;

  /// 月落时间
  late String moonset;

  Moon.fromMap(Map<dynamic, dynamic> map) {
    moonrise = map['moonrise'] as String;
    moonset = map['moonset'] as String;
  }
}

/// 月升月落月相查询结果
class MoonRsp {
  /// API状态码
  late String code;

  /// Basic 包含 接口更新时间, 	所查询城市的天气预报网页
  late Basic basic;

  /// Refer 数据来源信息
  late Refer refer;

  /// Moon 月升月落月相
  late Moon moon;

  /// 月相信息
  late List<MoonPhase> moonPhaseList;

  MoonRsp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    basic = Basic.fromMap(map['basic'] ?? Map());
    refer = Refer.fromMap(map['refer'] ?? Map());
    moon = Moon.fromMap(map);
    moonPhaseList = List.from((map['moonPhaseBeanList'] as List? ?? [])
        .map((v) => MoonPhase.fromMap(v)));
  }
}

/// 太阳高度角
class SolarElevationAngle {
  /// 太阳高度角
  late String solarElevationAngle;

  /// 太阳方位角，正北顺时针方向角度
  late String solarAzimuthAngle;

  /// 太阳时，HHmm格式
  late String solarHour;

  /// 时角
  late String hourAngle;

  SolarElevationAngle.fromMap(Map<dynamic, dynamic> map) {
    solarElevationAngle = map['solarElevationAngle'] as String;
    solarAzimuthAngle = map['solarAzimuthAngle'] as String;
    solarHour = map['solarHour'] as String;
    hourAngle = map['hourAngle'] as String;
  }
}

/// 太阳高度角查询结果
class SolarElevationAngleRsp {
  /// API状态码
  late String code;

  /// Refer 数据来源信息
  late Refer refer;

  /// SolarElevationAngle 太阳高度角信息
  late SolarElevationAngle solarElevationAngle;

  SolarElevationAngleRsp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    refer = Refer.fromMap(map['refer'] ?? Map());
    solarElevationAngle = SolarElevationAngle.fromMap(map);
  }
}
