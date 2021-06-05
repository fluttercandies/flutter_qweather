import 'package:flutter_qweather/models/refer.dart';

/// 当天生活指数信息
class DailyIndices {
  /// 预报日期，格式 yyyy-MM-dd
  late String date;

  /// 生活指数预报等级
  late String level;

  /// 生活指数预报级别名称
  late String category;

  /// 生活指数类型名称
  late String name;

  /// 生活指数类型
  late String type;

  /// 生活指数详细描述
  late String text;

  /// fromMap
  DailyIndices.fromMap(Map<dynamic, dynamic> map) {
    date = map['date'] as String;
    level = map['level'] as String;
    category = map['category'] as String;
    name = map['name'] as String;
    type = map['type'] as String;
    text = map['text'] as String;
  }
}

/// 天气生活指数查询 结果
class DailyIndicesResp {
  /// API状态码
  late String code;

  /// Refer 数据来源信息
  late Refer refer;

  /// 天气生活指数
  late List<DailyIndices> dailyList;

  /// fromMap
  DailyIndicesResp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    refer = Refer.fromMap(map['refer'] ?? Map());
    List _tmp = map['dailyList'] ?? [];
    dailyList = _tmp.map((v) => DailyIndices.fromMap(v)).toList();
  }
}
