part of qweather;

/// 潮汐和潮流
mixin _Ocean on _ServiceApi {
  /// [获取潮汐]: https://dev.qweather.com/docs/android-sdk/android-ocean/#接口参数说明
  /// date: 查询日期，日期格式为yyyyMMdd，例如 20200531
  Future<DailyIndicesResp?> getOceanTide(String location, String date) async {
    Map param = {"location": location, "date": date};
    Map? value = await _methodChannel.invokeMapMethod(
        MethodConstants.GetIndices1Day, param);
    return value == null ? null : DailyIndicesResp.fromMap(value);
  }

  /// [获取潮流]: https://dev.qweather.com/docs/android-sdk/android-ocean/#接口参数说明-1
  /// date: 查询日期，日期格式为yyyyMMdd，例如 20200531
  Future<DailyIndicesResp?> getOceanCurrents(
      String location, String date) async {
    Map param = {"location": location, "date": date};
    Map? value = await _methodChannel.invokeMapMethod(
        MethodConstants.GetIndices3Day, param);
    return value == null ? null : DailyIndicesResp.fromMap(value);
  }
}
