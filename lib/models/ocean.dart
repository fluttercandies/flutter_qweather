import 'basic.dart';
import 'refer.dart';

/// 满潮或干潮数据
class OceanTide {
  /// 满潮或干潮时间
  late String fxTime;

  /// 海水高度，单位：米
  late String height;

  /// 满潮（H）或干潮（L）
  late String type;

  OceanTide.fromMap(Map<String, dynamic> map) {
    fxTime = map['fxTime'] as String;
    height = map['height'] as String;
    type = map['type'] as String? ?? '';
  }
}

/// 潮汐查询结果
class OceanTideRsp {
  /// API状态码
  late String code;

  /// Basic 包含 接口更新时间, 	所查询城市的天气预报网页
  late Basic basic;

  /// Refer 数据来源信息
  late Refer refer;

  /// 潮汐小时数据
  late List<OceanTide> tideHourlyList;

  /// 满潮或干潮数据
  late List<OceanTide> tideList;

  /// fromMap
  OceanTideRsp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    basic = Basic.fromMap(map['basic'] ?? Map());
    refer = Refer.fromMap(map['refer'] ?? Map());
    tideHourlyList = (map["tideHourlyList"] as List? ?? [])
        .map((v) => OceanTide.fromMap(v))
        .toList();
    tideList = (map["tideTable"] as List? ?? [])
        .map((v) => OceanTide.fromMap(v))
        .toList();
  }
}

/// 潮流数据
class OceanCurrents {
  /// 潮流最大流速时间
  late String fxTime;

  /// 潮流最大流速，单位：厘米/秒
  late String speedMax;

  /// 潮流360度方向
  late String dir360;

  OceanCurrents.fromMap(Map<String, dynamic> map) {
    fxTime = map['fxTime'] as String;
    speedMax = map['speedMax'] as String;
    dir360 = map['dir360'] as String;
  }
}

/// 潮流数据查询结果
class OceanCurrentsRsp {
  /// API状态码
  late String code;

  /// Basic 包含 接口更新时间, 	所查询城市的天气预报网页
  late Basic basic;

  /// Refer 数据来源信息
  late Refer refer;

  /// 潮流小时数据
  late List<OceanCurrents> currentsHourlyList;

  /// 潮流数据
  late List<OceanCurrents> currentsList;

  /// fromMap
  OceanCurrentsRsp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    basic = Basic.fromMap(map['basic'] ?? Map());
    refer = Refer.fromMap(map['refer'] ?? Map());
    currentsHourlyList = (map["hourlyList"] as List? ?? [])
        .map((v) => OceanCurrents.fromMap(v))
        .toList();
    currentsList = (map["tableList"] as List? ?? [])
        .map((v) => OceanCurrents.fromMap(v))
        .toList();
  }
}
