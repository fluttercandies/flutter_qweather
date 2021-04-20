library qweather;

import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'models/weather.dart';
import 'constants.dart';

export 'models/weather.dart';

part 'api/weather_api.dart';

/// 和风天气配置
class QweatherConfig {
  String publicIdForAndroid;
  String keyForAndroid;
  String publicIdForIos;
  String keyForIos;
  bool debug;
  bool biz; // 是否商业模式

  QweatherConfig(
      {this.publicIdForAndroid = '',
      this.keyForAndroid = '',
      this.publicIdForIos = '',
      this.keyForIos = '',
      this.debug = false,
      this.biz = false});
}

class FlutterQweather extends _ServiceApi with _Weather {
  FlutterQweather._();

  static FlutterQweather instance = FlutterQweather._();
}

class _ServiceApi {
  final methodChannel = MethodChannel('com.fluttercandies.qweather');

  Future<String> get platformVersion async {
    final String? version = await methodChannel
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
    final ok = await methodChannel.invokeMethod(MethodConstants.Init, param);
    return print("和风天气：初始化结果: $ok");
  }

  /// 设置 Debug
  Future<void> setDebug([bool debug = true]) async {
    return await methodChannel.invokeMethod(MethodConstants.SetDebug, debug);
  }
}
