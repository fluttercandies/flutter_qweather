//
//  WarningApi.h
//  flutter_qweather
//
//  Created by CyJay on 2022/4/18.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>


@interface ApiWarning : NSObject
/// 获取灾害预警
+ (void) getWarning:(id)param result:(FlutterResult)result;
/// 获取灾害预警列表
+ (void) getWarningList:(id)param result:(FlutterResult)result;
@end

