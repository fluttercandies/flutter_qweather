//
//  ApiOcean.h
//  flutter_qweather
//
//  Created by CyJay on 2022/4/19.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>


@interface ApiOcean : NSObject
/// 获取潮汐
+ (void) getOceanTide:(id)param result:(FlutterResult)result;
/// 获取潮流
+ (void) getOceanCurrents:(id)param result:(FlutterResult)result;
@end

