part of qweather;

/// 地理信息搜索API
mixin _Geo on _ServiceApi {
  /// [城市信息查询]: https://dev.qweather.com/docs/android-sdk/android-geo/#城市信息查询
  Future<GeoPoiLocationResp?> geoCityLookup(String location,
      {String range = 'world', int number = 10}) async {
    Map param = {
      "location": location,
      "range": range.isEmpty ? 'world' : range,
      "number": Platform.isAndroid ? number : number.toString()
    };
    Map? value = await methodChannel.invokeMapMethod(
        MethodConstants.GeoCityLookup, param);
    return value == null ? null : GeoPoiLocationResp.fromMap(value);
  }

  /// [热门城市查询]: https://dev.qweather.com/docs/android-sdk/android-geo/#热门城市查询
  Future<GeoPoiLocationResp?> getGeoTopCity(
      {String range = 'world', int number = 10}) async {
    Map param = {
      "range": range.isEmpty ? 'world' : range,
      "number": Platform.isAndroid ? number : number.toString()
    };
    Map? value = await methodChannel.invokeMapMethod(
        MethodConstants.GetGeoTopCity, param);
    return value == null ? null : GeoPoiLocationResp.fromMap(value);
  }

  /// [POI信息搜索]: https://dev.qweather.com/docs/android-sdk/android-geo/#POI信息搜索
  Future<GeoPoiLocationResp?> geoPoiLookup(String location, PoiType type,
      {String city = '', int number = 10}) async {
    Map param = {
      "location": location,
      "city": city,
      "number": Platform.isAndroid ? number : number.toString()
    };
    param["type"] = "scenic"; // 目前SDK只支持该选项
    // switch (type) {
    //   case PoiType.scenic:
    //     param["type"] = "scenic";
    //     break;
    //   case PoiType.CSTA:
    //     param["type"] = "CSTA";
    //     break;
    //   case PoiType.TSTA:
    //     param["type"] = "TSTA";
    //     break;
    // }
    Map? value = await methodChannel.invokeMapMethod(
        MethodConstants.GeoPoiLookup, param);
    return value == null ? null : GeoPoiLocationResp.fromMap(value);
  }

  /// [POI范围搜索]: https://dev.qweather.com/docs/android-sdk/android-geo/#POI范围搜索
  Future<GeoPoiLocationResp?> geoPoiRangeLookup(String location, PoiType type,
      {int radius = 5, int number = 10}) async {
    Map param = {
      "location": location,
      "radius": Platform.isAndroid ? radius : radius.toString(),
      "number": Platform.isAndroid ? number : number.toString()
    };
    param["type"] = "scenic"; // 目前SDK只支持该选项
    // switch (type) {
    //   case PoiType.scenic:
    //     param["type"] = "scenic";
    //     break;
    //   case PoiType.CSTA:
    //     param["type"] = "CSTA";
    //     break;
    //   case PoiType.TSTA:
    //     param["type"] = "TSTA";
    //     break;
    // }
    Map? value = await methodChannel.invokeMapMethod(
        MethodConstants.GeoPoiRangeLookup, param);
    return value == null ? null : GeoPoiLocationResp.fromMap(value);
  }
}
