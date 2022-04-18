import 'basic.dart';
import 'refer.dart';

/// 灾害预警
class Warning {
  /// 预警id
  late String id;

  /// 预警发布时间
  late String pubTime;

  /// 预警信息标题
  late String title;

  /// 预警发布单位，可能为空
  late String sender;

  /// 预警开始时间
  late String startTime;

  /// 预警结束时间
  late String endTime;

  /// 预警状态
  late String status;

  /// 预警等级：蓝黄橙红白
  late String level;

  /// 预警类型，全部类型参考本文简介
  late String type;

  /// 预警类型，全部类型参考本文简介
  late String typeName;

  /// 预警详细信息
  late String text;

  /// 与本条预警相关联的预警ID，当预警状态为cancel或update时返回。可能为空
  late String related;

  Warning.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'] as String;
    pubTime = map['pubTime'] as String;
    title = map['title'] as String;
    sender = map['sender'] as String;
    startTime = map['startTime'] as String;
    endTime = map['endTime'] as String;
    status = map['status'] as String;
    level = map['level'] as String;
    type = map['type'] as String;
    typeName = map['typeName'] as String;
    text = map['text'] as String;
    related = map['related'] as String;
  }
}

/// 灾害预警查询结果
class WarningRsp {
  /// API状态码
  late String code;

  /// Basic 包含 接口更新时间, 	所查询城市的天气预报网页
  late Basic basic;

  /// Refer 数据来源信息
  late Refer refer;

  /// WeatherNow 实时天气
  late List<Warning> warningList;

  /// fromMap
  WarningRsp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    basic = Basic.fromMap(map['basic'] ?? Map());
    refer = Refer.fromMap(map['refer'] ?? Map());
    warningList = map.containsKey('warningList')
        ? (map['warningList'] as List).map((v) => Warning.fromMap(v)).toList()
        : [];
  }
}

/// 预警城市
class WarningLocation {
  late String locationId;

  WarningLocation.fromMap(Map<dynamic, dynamic> map) {
    locationId = map['locationId'] as String;
  }
}

/// 灾害预警列表查询结果
class WarningListRsp {
  /// API状态码
  late String code;

  /// Basic 包含 接口更新时间, 	所查询城市的天气预报网页
  late Basic basic;

  /// Refer 数据来源信息
  late Refer refer;

  /// WeatherNow 实时天气
  late List<WarningLocation> warningList;

  /// fromMap
  WarningListRsp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    basic = Basic.fromMap(map['basic'] ?? Map());
    refer = Refer.fromMap(map['refer'] ?? Map());
    warningList = List.from((map['warningBean'] as List? ?? [])
        .map((v) => WarningLocation.fromMap(v)));
  }
}
