import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_qweather/flutter_qweather.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  /// _location
  /// LocationID 或者 经纬度;
  /// LocationID 可通过geo 接口查询 或 查看https://github.com/qwd/LocationList
  String _location = "116.41,39.92";
  TextEditingController _controller = TextEditingController();
  WeatherNow _weatherNow;

  @override
  void initState() {
    _controller.text = _location;
    super.initState();
    initPlatformState();
    initQweather();
  }

  // 初始化 Qweather
  Future<void> initQweather() async {
    QweatherConfig config = QweatherConfig(
        publicIdForAndroid: 'HE2100000000000000',
        keyForAndroid: '84538637d3xxxxxxxxxxxxxxxxxxxxx',
        publicIdForIos: 'HE2100000000000000',
        keyForIos: 'aead742b4xxxxxxxxxxxxxxxxxxxxx',
        biz: false,
        debug: true);
    await FlutterQweather.instance.init(config);
    // await Qweather.instance.setDebug();
    queryWeatherNow();
  }

  // 查询实时天气
  Future<void> queryWeatherNow() async {
    setState(() => _weatherNow = null);
    // await Qweather.instance.getWeatherNow("101010100");
    _weatherNow = await FlutterQweather.instance.getWeatherNow(_location);
    setState(() {});
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await FlutterQweather.instance.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() => _platformVersion = platformVersion);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('QWeather example app')),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        onChanged: (v) => _location = v,
                        decoration: InputDecoration(
                          hintText: "请输入LocationID 或者 经纬度",
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: Text("查询天气"),
                      onPressed: _weatherNow == null || _location.trim().isEmpty
                          ? null
                          : queryWeatherNow,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: _weatherNow == null
                    ? Center(child: Text("loading..."))
                    : _weatherNowWidget),
            Container(
              padding: EdgeInsets.all(64),
              child: Text('Running on: $_platformVersion\n'),
            )
          ],
        ),
      ),
    );
  }

  Widget get _weatherNowWidget {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("原始数据来源：             ${_weatherNow.refer.sources.join(",")}"),
          Text("使用许可：                ${_weatherNow.refer.license.join(",")}"),
          Divider(),
          Text("接口更新时间：            ${_weatherNow.basic.updateTime}"),
          Text("所查询城市的天气预报网页：   ${_weatherNow.basic.fxLink}"),
          Divider(),
          Text("实况观测时间：            ${_weatherNow.obsTime}"),
          Text("体感温度，默认单位：摄氏度： ${_weatherNow.feelsLike}"),
          Text("温度，默认单位：摄氏度：    ${_weatherNow.temp}"),
          Text("实况天气状况代码：         ${_weatherNow.icon}"),
          Text("实况天气状况：             ${_weatherNow.text}"),
          Text("风向360角度：             ${_weatherNow.wind360}"),
          Text("风向：                   ${_weatherNow.windDir}"),
          Text("风力：                   ${_weatherNow.windScale}"),
          Text("风速，公里/小时：          ${_weatherNow.windSpeed}"),
          Text("相对湿度：                ${_weatherNow.humidity}"),
          Text("降水量：                  ${_weatherNow.precip}"),
          Text("大气压强：                 ${_weatherNow.pressure}"),
          Text("能见度，默认单位：公里：     ${_weatherNow.vis}"),
          Text("云量：                    ${_weatherNow.cloud}"),
          Text("实况云量：                  ${_weatherNow.dew}"),
        ],
      ),
    );
  }
}
