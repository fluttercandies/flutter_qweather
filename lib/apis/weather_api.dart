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
    String location,
    WeatherDailyForecast dailyForecast,
  ) async {
    Map<String, dynamic> param = {"location": location};
    switch (dailyForecast) {
      case WeatherDailyForecast.WeatherForecast3Day:
        param["daily"] = 3;
        break;
      case WeatherDailyForecast.WeatherForecast7Day:
        param["daily"] = 7;
        break;
      case WeatherDailyForecast.WeatherForecast10Day:
        param["daily"] = 10;
        break;
      case WeatherDailyForecast.WeatherForecast15Day:
        param["daily"] = 15;
        break;
    }
    Map? value = await _methodChannel.invokeMapMethod(
        MethodConstants.GetWeatherDaily, param);
    return value == null ? null : WeatherDailyResp.fromMap(value);
  }

  /// [获取逐时预报]: https://dev.qweather.com/docs/android-sdk/android-weather/#接口参数说明-2
  Future<WeatherHourlyResp?> getWeatherHourly(
    String location,
    WeatherHourlyForecast hourlyForecast,
  ) async {
    Map<String, dynamic> param = {"location": location};
    switch (hourlyForecast) {
      case WeatherHourlyForecast.WeatherForecast24Hour:
        param["hourly"] = 24;
        break;
      case WeatherHourlyForecast.WeatherForecast72Hour:
        param["hourly"] = 72;
        break;
      case WeatherHourlyForecast.WeatherForecast168Hour:
        param["hourly"] = 168;
        break;
    }
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
