part of qweather;

/// 太阳和月亮
mixin _Astronomy on _ServiceApi {
  /// [获取日出日落]: https://dev.qweather.com/docs/android-sdk/android-astronomy/#接口参数说明
  /// date: 查询日期，日期格式为yyyyMMdd，例如 20200531
  Future<SunRsp?> getSun(String location, String date) async {
    Map param = {"location": location, "date": date};
    Map? value =
        await _methodChannel.invokeMapMethod(MethodConstants.GetSun, param);
    return value == null ? null : SunRsp.fromMap(value);
  }

  /// [获取月升月落月相]: https://dev.qweather.com/docs/android-sdk/android-astronomy/#接口参数说明-1
  /// date: 查询日期，日期格式为yyyyMMdd，例如 20200531
  Future<MoonRsp?> getMoon(String location, String date) async {
    Map param = {"location": location, "date": date};
    Map? value =
        await _methodChannel.invokeMapMethod(MethodConstants.GetMoon, param);
    return value == null ? null : MoonRsp.fromMap(value);
  }

  /// [获取太阳高度角]: https://dev.qweather.com/docs/android-sdk/android-astronomy/#接口参数说明-2
  /// date: 查询日期，日期格式为yyyyMMdd，例如 20200531
  /// time: 查询时间，格式为HHmm，24时制，例如 1230
  /// tz: 查询地区所在时区，例如0800 或 -0530
  /// alt: 海拔高度，单位为米，例如 43
  Future<SolarElevationAngleRsp?> getSolarElevationAngle(
      {required String location,
      required String date,
      required String time,
      required String tz,
      required String alt}) async {
    Map param = {
      "location": location,
      "date": date,
      "time": time,
      "tz": tz,
      "alt": alt
    };
    Map? value = await _methodChannel.invokeMapMethod(
        MethodConstants.GetSolarElevationAngle, param);
    return value == null ? null : SolarElevationAngleRsp.fromMap(value);
  }
}
