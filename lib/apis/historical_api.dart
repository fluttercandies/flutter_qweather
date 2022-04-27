part of qweather;

/// 历史天气和空气质量
mixin _Historical on _ServiceApi {
  /// [获取历史天气]: https://dev.qweather.com/docs/android-sdk/android-historical/#接口参数说明
  /// date: 查询日期，日期格式为yyyyMMdd，例如 20200531
  Future<HistoricalWeatherRsp?> getHistoricalWeather(
      String location, String date) async {
    Map param = {"location": location, "date": date};
    Map? value = await _methodChannel.invokeMapMethod(
        MethodConstants.GetHistoricalWeather, param);
    return value == null ? null : HistoricalWeatherRsp.fromMap(value);
  }

  /// [获取历史空气质量]: https://dev.qweather.com/docs/android-sdk/android-historical/#接口参数说明-1
  /// date: 查询日期，日期格式为yyyyMMdd，例如 20200531
  Future<HistoricalHourlyAirRsp?> getHistoricalAir(
      String location, String date) async {
    Map param = {"location": location, "date": date};
    Map? value = await _methodChannel.invokeMapMethod(
        MethodConstants.GetHistoricalAir, param);
    return value == null ? null : HistoricalHourlyAirRsp.fromMap(value);
  }
}
