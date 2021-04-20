class Basic {
  late String fxLink; // 所查询城市的天气预报网页
  late String updateTime; // 接口更新时间: 2021-04-19T18:27+08:00

  Basic.fromMap(Map<dynamic, dynamic> map) {
    fxLink = map["fxLink"] ?? '';
    updateTime = map["updateTime"] ?? '';
  }
}
