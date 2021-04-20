//
//  ApiWeather.h
//  qweather
//
//  Created by CyJay on 2021/4/19.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>


@interface ApiWeather : NSObject
/// 获取当前天气
+ (void) getWeatherNow:(NSString*)location result:(FlutterResult)result;

@end
