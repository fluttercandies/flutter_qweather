//
//  ApiTropical.h
//  flutter_qweather
//
//  Created by CyJay on 2022/4/20.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>


@interface ApiTropical : NSObject
/// 台风列表
+ (void) getStormList:(id)param result:(FlutterResult)result;
/// 台风实况和路径
+ (void) getStormTrack:(id)param result:(FlutterResult)result;
/// 台风预报
+ (void) getStormForecast:(id)param result:(FlutterResult)result;
@end
