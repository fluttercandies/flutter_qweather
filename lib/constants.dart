/// 方法常量
class MethodConstants {
  // 获取平台版本
  static const String GetPlatformVersion = 'GetPlatformVersion';

  // 初始化
  static const String Init = 'Init';

  // 设置 Debug
  static const String SetDebug = 'SetDebug';

  // 城市信息查询
  static const String GeoCityLookup = 'GeoCityLookup';

  // 热门城市查询
  static const String GetGeoTopCity = 'GetGeoTopCity';

  // 热门城市查询
  static const String GeoPoiLookup = 'GeoPoiLookup';

  // POI范围搜索
  static const String GeoPoiRangeLookup = 'GeoPoiRangeLookup';

  // 获取实况天气数据
  static const String GetWeatherNow = 'GetWeatherNow';

  // 获取逐天预报
  static const String GetWeatherDaily = 'GetWeatherDaily';

  // 获取逐时预报
  static const String GetWeatherHourly = 'GetWeatherHourly';

  // 获取中国地区未来2小时内每5分钟降水
  static const String GetWeatherMinuteLy = 'GetWeatherMinuteLy';
}

/// 逐天可选枚举
enum WeatherDailyForecast {
  WeatherForecast3Day, // 未来 3 天预告
  WeatherForecast7Day, // 未来 7 天预告
  WeatherForecast10Day, // 未来 10 天预告
  WeatherForecast15Day // 未来 15 天预告
}

/// 逐时可选枚举
enum WeatherHourlyForecast {
  WeatherForecast24Hour, // 未来 24 小时预告
  WeatherForecast72Hour, // 未来 72 小时预告
  WeatherForecast168Hour // 未来 168 小时预告
}

///枚举类型转string
String enumToString(o) => o.toString().split('.').last;

/// POI类型
enum PoiType {
  scenic, // 景点
  CSTA, // 潮流站点
  TSTA, // 潮汐站点
}
