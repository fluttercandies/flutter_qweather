part of qweather;

/// 热带气旋（台风）
mixin _Tropical on _ServiceApi {
  /// [获取灾害预警]: https://dev.qweather.com/docs/android-sdk/android-tropical/#接口参数说明
  /// 支持查询本年度和上一年度的台风，year 例如：2020 2019
  Future<StormListRsp?> getStormList(String year, Basin basin) async {
    Map param = {"year": year, "basin": basin.code};
    Map? value = await _methodChannel.invokeMapMethod(
        MethodConstants.GetStormList, param);
    return value == null ? null : StormListRsp.fromMap(value);
  }

  /// [获取灾害预警列表]: https://dev.qweather.com/docs/android-sdk/android-tropical/#接口参数说明-1
  Future<StormTracRsp?> getStormTrack(String stormId) async {
    Map? value = await _methodChannel.invokeMapMethod(
        MethodConstants.GetStormTrack, stormId);
    return value == null ? null : StormTracRsp.fromMap(value);
  }

  /// [获取灾害预警列表]: https://dev.qweather.com/docs/android-sdk/android-tropical/#接口参数说明-3
  Future<ForecastRsp?> getStormForecast(String stormId) async {
    Map? value = await _methodChannel.invokeMapMethod(
        MethodConstants.GetStormForecast, stormId);
    return value == null ? null : ForecastRsp.fromMap(value);
  }
}
