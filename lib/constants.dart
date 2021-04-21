/// 方法常量
class MethodConstants {
  // 获取平台版本
  static const String GetPlatformVersion = 'getPlatformVersion';

  // 初始化
  static const String Init = 'init';

  // 设置 Debug
  static const String SetDebug = 'setDebug';

  // 获取实况天气数据
  static const String GetWeatherNow = 'getWeatherNow';

  // 获取逐天预报
  static const String GetWeatherDaily = 'getWeatherDaily';

  // 获取逐时预报
  static const String GetWeatherHourly = 'getWeatherHourly';

  // 获取中国地区未来2小时内每5分钟降水
  static const String GetWeatherMinuteLy = 'getWeatherMinuteLy';
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
