//
//  ApiAir.h
//  flutter_qweather
//
//  Created by CyJay on 2022/4/18.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>


@interface ApiAir : NSObject
/// 获取实时空气质量
+ (void) getAirNow:(id)param result:(FlutterResult)result;
/// 空气质量逐天预报
+ (void) getAir5Day:(id)param result:(FlutterResult)result;
@end
