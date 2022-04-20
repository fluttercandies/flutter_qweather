//
//  ApiAstronomy.h
//  flutter_qweather
//
//  Created by CyJay on 2022/4/19.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>


@interface ApiAstronomy : NSObject
/// 获取日出日落
+ (void) getSun:(id)param result:(FlutterResult)result;
/// 获取月升月落月相
+ (void) getMoon:(id)param result:(FlutterResult)result;
/// 获取太阳高度角
+ (void) getSolarElevationAngle:(id)param result:(FlutterResult)result;
@end

