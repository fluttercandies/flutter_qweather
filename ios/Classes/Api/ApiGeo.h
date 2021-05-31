//
//  ApiGeo.h
//  flutter_qweather
//
//  Created by CyJay on 2021/5/31.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>


@interface ApiGeo : NSObject
/// 城市信息查询
+ (void) geoCityLookup:(id)param result:(FlutterResult)result;
/// 热门城市查询
+ (void) getGeoTopCity:(id)param result:(FlutterResult)result;
/// POI信息搜索
+ (void) geoPoiLookup:(id)param result:(FlutterResult)result;
/// POI范围搜索
+ (void) geoPoiRangeLookup:(id)param result:(FlutterResult)result;
@end
