part of qweather;

/// 实时空气质量和预报
mixin _Air on _ServiceApi {
  /// [获取实时空气质量]: https://dev.qweather.com/docs/android-sdk/android-air/#接口参数说明
  Future<AirNowResp?> getAirNow(String location) async {
    Map? value = await _methodChannel.invokeMapMethod(
        MethodConstants.GetAirNow, location);
    return value == null ? null : AirNowResp.fromMap(value);
  }

  /// [获取5天空气质量预报]: https://dev.qweather.com/docs/android-sdk/android-air/#接口参数说明-1
  Future<AirDailyResp?> getAir5Day(String location) async {
    Map? value = await _methodChannel.invokeMapMethod(
        MethodConstants.GetAir5Day, location);
    return value == null ? null : AirDailyResp.fromMap(value);
  }
}
