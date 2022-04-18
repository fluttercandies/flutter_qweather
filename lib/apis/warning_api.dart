part of qweather;

/// 天气灾害预警
mixin _Warning on _ServiceApi {
  /// [获取灾害预警]: https://dev.qweather.com/docs/android-sdk/android-warning/#接口参数说明
  Future<WarningRsp?> getWarning(String location) async {
    Map? value = await _methodChannel.invokeMapMethod(
        MethodConstants.GetWarning, location);
    return value == null ? null : WarningRsp.fromMap(value);
  }

  /// [获取灾害预警列表]: https://dev.qweather.com/docs/android-sdk/android-warning/#接口参数说明-1
  Future<WarningListRsp?> getWarningList({String range = 'cn'}) async {
    Map? value = await _methodChannel.invokeMapMethod(
        MethodConstants.GetWarningList, range.isEmpty ? 'cn' : range);
    return value == null ? null : WarningListRsp.fromMap(value);
  }
}
