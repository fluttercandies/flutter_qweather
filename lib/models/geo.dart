import 'refer.dart';

/// PIO地址信息
class GeoPoiLocation {
  /// 地区／城市名称/地址	卓资
  late String name;

  /// 地区／城市ID	101080402
  late String id;

  /// 地区／城市经度	112.577702
  late String lon;

  /// 地区／城市纬度	40.89576
  late String lat;

  /// 该地区／城市的上级城市	乌兰察布
  late String adm2;

  /// 该地区／城市所属行政区域	内蒙古
  late String adm1;

  /// 该地区／城市所属国家名称	中国
  late String country;

  /// 该地区／城市所在时区	Asia/Shanghai
  late String tz;

  /// 该地区/城市目前与UTC时间偏移的小时数	+08:00
  late String utcOffset;

  /// 该地区/城市是否当前处于夏令时,1: 表示当前处于夏令时, 0: 表示当前不是夏令时	0
  late String isDst;

  /// 该地区／城市的属性	city
  late String type;

  /// 该地区／城市评分	10
  late String rank;

  /// 城市的天气预报网页链接	http://hfx.link/ae45;安卓 POI信息搜索/POI范围搜索时 为空
  late String fxLink;

  /// fromMap
  GeoPoiLocation.fromMap(Map<dynamic, dynamic> map) {
    name = map['name'] as String;
    id = map['id'] as String;
    lon = map['lon'] as String;
    lat = map['lat'] as String;
    adm1 = map['adm1'] as String;
    adm2 = map['adm2'] as String;
    country = map['country'] as String;
    tz = map['tz'] as String;
    utcOffset = map['utcOffset'] as String;
    isDst = map['isDst'] as String;
    type = map['type'] as String;
    rank = map['rank'] as String;
    fxLink = map['fxLink'] as String? ?? '';
  }
}

/// 城市信息查询/热门城市查询/POI信息搜索/POI范围搜索 结果
class GeoPoiLocationResp {
  /// API状态码
  late String code;

  /// Refer 数据来源信息
  late Refer refer;

  /// 城市数据
  late List<GeoPoiLocation> locations;

  /// fromMap
  GeoPoiLocationResp.fromMap(Map<dynamic, dynamic> map) {
    code = map['code'] as String;
    refer = Refer.fromMap(map['refer'] ?? Map());
    List _tmp = map['locations'] ?? [];
    locations = _tmp.map((v) => GeoPoiLocation.fromMap(v)).toList();
  }
}
