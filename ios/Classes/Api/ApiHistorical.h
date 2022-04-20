//
//  ApiHistorical.h
//  flutter_qweather
//
//  Created by CyJay on 2022/4/19.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>


@interface ApiHistorical : NSObject
/// 获取历史天气
+ (void) getHistoricalWeather:(id)param result:(FlutterResult)result;
/// 获取历史空气质量
+ (void) getHistoricalAir:(id)param result:(FlutterResult)result;
@end

