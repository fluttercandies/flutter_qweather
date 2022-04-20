part of qweather;

/// 城市天气API
mixin _Weather on _ServiceApi {
  /// [获取实时天气]: https://dev.qweather.com/docs/android-sdk/android-weather/#接口参数说明
  Future<WeatherNowResp?> getWeatherNow(String location) async {
    Map? value = await _methodChannel.invokeMapMethod(
        MethodConstants.GetWeatherNow, location);
    return value == null ? null : WeatherNowResp.fromMap(value);
  }

  /// [获取逐天预报]: https://dev.qweather.com/docs/android-sdk/android-weather/#接口参数说明-1
  Future<WeatherDailyResp?> getWeatherDaily(
      String location, WeatherDailyForecast dailyForecast) async {
    Map<String, dynamic> param = {
      "location": location,
      "daily": dailyForecast.day
    };
    Map? value = await _methodChannel.invokeMapMethod(
        MethodConstants.GetWeatherDaily, param);
    return value == null ? null : WeatherDailyResp.fromMap(value);
  }

  /// [获取逐时预报]: https://dev.qweather.com/docs/android-sdk/android-weather/#接口参数说明-2
  Future<WeatherHourlyResp?> getWeatherHourly(
      String location, WeatherHourlyForecast hourlyForecast) async {
    Map<String, dynamic> param = {
      "location": location,
      "hourly": hourlyForecast.hour
    };

    Map? value = await _methodChannel.invokeMapMethod(
        MethodConstants.GetWeatherHourly, param);
    return value == null ? null : WeatherHourlyResp.fromMap(value);
  }

  /// [获取中国地区未来2小时内每5分钟降水数据]: https://dev.qweather.com/docs/android-sdk/android-weather/#接口参数说明-3
  Future<WeatherMinutelyResp?> getWeatherMinuteLy(String location) async {
    Map? value = await _methodChannel.invokeMapMethod(
        MethodConstants.GetWeatherMinuteLy, location);
    return value == null ? null : WeatherMinutelyResp.fromMap(value);
  }
}
