library qweather;

import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'models/air.dart';
import 'models/geo.dart';
import 'models/indices.dart';
import 'models/warning.dart';
import 'models/weather.dart';
import 'constants.dart';

export 'models/geo.dart';
export 'models/weather.dart';

part 'apis/air_api.dart';

part 'apis/astronomy_api.dart';

part 'apis/geo_api.dart';

part 'apis/historical_api.dart';

part 'apis/indices_api.dart';

part 'apis/ocean_api.dart';

part 'apis/tropical_api.dart';

part 'apis/warning_api.dart';

part 'apis/weather_api.dart';

/// 和风天气配置
class QweatherConfig {
  /// publicId for Android
  String publicIdForAndroid;

  /// key for Android
  String keyForAndroid;

  /// publicId for iOS
  String publicIdForIos;

  /// key for iOS
  String keyForIos;

  /// 是否调试模式
  bool debug;

  /// 是否商业模式
  bool biz;

  QweatherConfig(
      {this.publicIdForAndroid = '',
      this.keyForAndroid = '',
      this.publicIdForIos = '',
      this.keyForIos = '',
      this.debug = false,
      this.biz = false});
}

class FlutterQweather extends _ServiceApi
    with
        _Air,
        _Astronomy,
        _Geo,
        _Historical,
        _Indices,
        _Ocean,
        _Tropical,
        _Warning,
        _Weather {
  FlutterQweather._();

  static FlutterQweather instance = FlutterQweather._();
}

class _ServiceApi {
  final _methodChannel = MethodChannel('com.fluttercandies.qweather');

  Future<String> get platformVersion async {
    final String? version = await _methodChannel
        .invokeMethod<String>(MethodConstants.GetPlatformVersion);
    return version!;
  }

  /// 初始化
  Future<void> init(QweatherConfig config) async {
    String publicId = '', key = '';
    if (Platform.isAndroid) {
      publicId = config.publicIdForAndroid;
      key = config.keyForAndroid;
    } else if (Platform.isIOS) {
      publicId = config.publicIdForIos;
      key = config.keyForIos;
    }
    if (publicId.isEmpty || key.isEmpty)
      return print("和风天气：当前平台的 publicId 或 key 为空");
    final Map<String, dynamic> param = {
      "publicId": publicId,
      "key": key,
      "biz": config.biz,
      "debug": config.debug
    };
    final ok = await _methodChannel.invokeMethod(MethodConstants.Init, param);
    if (config.debug) print("和风天气：初始化结果: $ok");
  }

  /// 设置 Debug
  Future<void> setDebug([bool debug = true]) async {
    return await _methodChannel.invokeMethod(MethodConstants.SetDebug, debug);
  }
}
