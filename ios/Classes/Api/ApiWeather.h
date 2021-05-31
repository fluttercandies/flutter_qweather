//
//  ApiWeather.h
//  flutter_qweather
//
//  Created by CyJay on 2021/4/19.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>


@interface ApiWeather : NSObject
/// 获取当前天气
+ (void) getWeatherNow:(id)param result:(FlutterResult)result;
/// 获取逐天预报
+ (void) getWeatherDaily:(id)param result:(FlutterResult)result;
/// 获取逐时预报
+ (void) getWeatherHourly:(id)param result:(FlutterResult)result;
/// 获取中国地区未来2小时内每5分钟降水
+ (void) getWeatherMinuteLy:(id)param result:(FlutterResult)result;
@end
