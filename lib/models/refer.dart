/// 数据源
class Refer {
  late List<String> sources; // 原始数据来源，或数据源说明
  late List<String> license; //数据许可或版权声明
  /// fromMap
  Refer.fromMap(Map<dynamic, dynamic> map) {
    sources = map["sourcesList"] == null ? [] : List.from(map["sourcesList"]);
    license = map["licenseList"] == null ? [] : List.from(map["licenseList"]);
  }
}
