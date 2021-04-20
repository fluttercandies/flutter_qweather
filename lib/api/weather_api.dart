part of qweather;

/// 城市天气API
mixin _Weather on _ServiceApi {
  /// [获取实时天气]: https://dev.qweather.com/docs/android-sdk/android-weather/#接口参数说明
  Future<WeatherNow?> getWeatherNow(String location) async {
    Map? value = await methodChannel.invokeMapMethod(MethodConstants.GetWeatherNow, location);
    return value == null ? null : WeatherNow.fromMap(value);
  }
}
