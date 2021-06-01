/// 数据源
class Refer {
  /// 原始数据来源，或数据源说明
  List<String> sources = [];

  /// 数据许可或版权声明
  List<String> license = [];

  /// fromMap
  Refer.fromMap(Map<dynamic, dynamic> map) {
    if (map.containsKey("sourcesList")) sources = List.from(map["sourcesList"]);
    if (map.containsKey("licenseList")) license = List.from(map["licenseList"]);
  }
}
