//
//  ApiIndices.h
//  flutter_qweather
//
//  Created by CyJay on 2021/6/5.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>


@interface ApiIndices : NSObject
/// 获取1天生活指数
+ (void) getIndices1Day:(id)param result:(FlutterResult)result;
/// 获取3天生活指数
+ (void) getIndices3Day:(id)param result:(FlutterResult)result;
/// 获取生活指数
//+ (void) getIndices:(NSString*)name param:(id)param result:(FlutterResult)result;
@end
