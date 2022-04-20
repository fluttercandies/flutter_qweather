/// 方法常量
class MethodConstants {
  /// 获取平台版本
  static const String GetPlatformVersion = 'GetPlatformVersion';

  /// 初始化
  static const String Init = 'Init';

  /// 设置 Debug
  static const String SetDebug = 'SetDebug';

  /// 城市信息查询
  static const String GeoCityLookup = 'GeoCityLookup';

  /// 热门城市查询
  static const String GetGeoTopCity = 'GetGeoTopCity';

  /// 热门城市查询
  static const String GeoPoiLookup = 'GeoPoiLookup';

  /// POI范围搜索
  static const String GeoPoiRangeLookup = 'GeoPoiRangeLookup';

  /// 获取实况天气数据
  static const String GetWeatherNow = 'GetWeatherNow';

  /// 获取逐天预报
  static const String GetWeatherDaily = 'GetWeatherDaily';

  /// 获取逐时预报
  static const String GetWeatherHourly = 'GetWeatherHourly';

  /// 获取中国地区未来2小时内每5分钟降水
  static const String GetWeatherMinuteLy = 'GetWeatherMinuteLy';

  /// 获取1天生活指数
  static const String GetIndices1Day = "GetIndices1Day";

  /// 获取3天生活指数
  static const String GetIndices3Day = "GetIndices3Day";

  /// 获取灾害预警
  static const String GetWarning = "GetWarning";

  /// 获取灾害预警列表
  static const String GetWarningList = "GetWarningList";

  /// 获取实时空气质量
  static const String GetAirNow = "GetAirNow";

  /// 获取5天空气质量预报
  static const String GetAir5Day = "GetAir5Day";

  /// 获取历史天气
  static const String GetHistoricalWeather = "GetHistoricalWeather";

  /// 获取历史空气质量
  static const String GetHistoricalAir = "GetHistoricalAir";

  /// 获取日出日落
  static const String GetSun = "GetSun";

  /// 获取月升月落月相
  static const String GetMoon = "GetMoon";

  /// 获取太阳高度角
  static const String GetSolarElevationAngle = "GetSolarElevationAngle";

  /// 获取潮汐
  static const String GetOceanTide = "GetOceanTide";

  /// 获取潮流
  static const String GetOceanCurrents = "GetOceanCurrents";

  /// 台风列表
  static const String GetStormList = "GetStormList";

  /// 台风实况和路径
  static const String GetStormTrack = "GetStormTrack";

  /// 台风预报
  static const String GetStormForecast = "GetStormForecast";
}

/// 逐天可选枚举
class WeatherDailyForecast {
  final int _day;

  int get day => _day;

  const WeatherDailyForecast._(this._day);

  /// 未来 3 天预告
  static const WeatherForecast3Day = WeatherDailyForecast._(3);

  /// 未来 7 天预告
  static const WeatherForecast7Day = WeatherDailyForecast._(7);

  /// 未来 10 天预告
  static const WeatherForecast10Day = WeatherDailyForecast._(10);

  /// 未来 15 天预告
  static const WeatherForecast15Day = WeatherDailyForecast._(15);
}

/// 逐时可选枚举
class WeatherHourlyForecast {
  final int _hour;

  int get hour => _hour;

  const WeatherHourlyForecast._(this._hour);

  /// 未来 24 小时预告
  static const WeatherForecast24Hour = WeatherHourlyForecast._(24);

  /// 未来 72 小时预告
  static const WeatherForecast72Hour = WeatherHourlyForecast._(72);

  /// 未来 168 小时预告
  static const WeatherForecast168Hour = WeatherHourlyForecast._(168);
}

/// POI类型
class PoiType {
  final String _code;

  String get code => _code;

  const PoiType._(this._code);

  /// 景点
  static const PoiType scenic = PoiType._('scenic');

  /// 潮流站点
  static const PoiType CSTA = PoiType._('CSTA');

  /// 潮汐站点
  static const PoiType TSTA = PoiType._('TSTA');
}

/// 生活指数常量
class IndicesType {
  final String _code;

  String get code => _code;

  const IndicesType._(this._code);

  /// 全部生活指数
  static const IndicesType ALL = IndicesType._('ALL');

  /// 运动指数
  static const IndicesType SPT = IndicesType._('SPT');

  /// 洗车指数
  static const IndicesType CW = IndicesType._('CW');

  /// 穿衣指数
  static const IndicesType DRSG = IndicesType._('DRSG');

  /// 钓鱼指数
  static const IndicesType FIS = IndicesType._('FIS');

  /// 紫外线指数
  static const IndicesType UV = IndicesType._('UV');

  /// 旅游指数
  static const IndicesType TRAV = IndicesType._('TRAV');

  /// 花粉过敏指数
  static const IndicesType AG = IndicesType._('AG');

  /// 舒适度指数
  static const IndicesType COMF = IndicesType._('COMF');

  /// 感冒指数
  static const IndicesType FLU = IndicesType._('FLU');

  /// 空气污染扩散条件指数
  static const IndicesType AP = IndicesType._('AP');

  /// 空调开启指数
  static const IndicesType AC = IndicesType._('AC');

  /// 太阳镜指数
  static const IndicesType GL = IndicesType._('GL');

  /// 化妆指数
  static const IndicesType MU = IndicesType._('MU');

  /// 晾晒指数
  static const IndicesType DC = IndicesType._('DC');

  /// 交通指数
  static const IndicesType PTFC = IndicesType._('PTFC');

  /// 防晒指数
  static const IndicesType SPI = IndicesType._('SPI');

  /// 滑雪指数，暂时获取不到
  static const IndicesType SKI = IndicesType._('SKI');
}

/// 单位参数
class Unit {
  final String code;

  const Unit._(this.code);

  static const Unit METRIC = Unit._('m');
  static const Unit IMPERIAL = Unit._('i');
}

/// 流域
class Basin {
  final String _code;

  String get code => _code;

  const Basin._(this._code);

  static const Basin AL = Basin._('AL'); // North Atlantic 北大西洋
  static const Basin EP = Basin._('EP'); // Eastern Pacific 东太平洋
  static const Basin NP = Basin._('NP'); // NorthWest Pacific 西北太平洋
  static const Basin SP = Basin._('SP'); // SouthWestern Pacific 西南太平洋
  static const Basin NI = Basin._('NI'); // North Indian 北印度洋
  static const Basin SI = Basin._('SI'); // South Indian 南印度洋
}
