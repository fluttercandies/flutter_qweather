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
}

/// 逐天可选枚举
enum WeatherDailyForecast {
  /// 未来 3 天预告
  WeatherForecast3Day,

  /// 未来 7 天预告
  WeatherForecast7Day,

  /// 未来 10 天预告
  WeatherForecast10Day,

  /// 未来 15 天预告
  WeatherForecast15Day
}

/// 逐时可选枚举
enum WeatherHourlyForecast {
  /// 未来 24 小时预告
  WeatherForecast24Hour,

  /// 未来 72 小时预告
  WeatherForecast72Hour,

  /// 未来 168 小时预告
  WeatherForecast168Hour
}

/// POI类型
enum PoiType {
  /// 景点
  scenic,

  /// 潮流站点
  CSTA,

  /// 潮汐站点
  TSTA
}

/// 生活指数常量
class IndicesType {
  final String code;

  const IndicesType._(this.code);

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
