//
//  ApiGeo.m
//  flutter_qweather
//
//  Created by CyJay on 2021/5/31.
//

#import "ApiGeo.h"
#import "../DebugPrint/DebugPrint.h"

@implementation ApiGeo
/// 城市信息查询
+ (void) geoCityLookup:(id)param result:(FlutterResult)result{
    NSDictionary *paramDic = param;
    QWeatherConfigInstance.location = paramDic[@"location"];
    QWeatherConfigInstance.number = paramDic[@"number"];
    QWeatherConfigInstance.range = paramDic[@"range"];
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_GEO_CITY_LOOKUP
      WithSuccess:^(GeoBaseClass *rep) {
        [DebugPrint print:[@"geoCityLookup WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSMutableArray<NSDictionary*> *locations = [NSMutableArray new];
        for (Location *one in rep.location) {
            NSDictionary *oneLocation = @{@"name":one.name, @"id":one.cid, @"lon":one.lon, @"lat":one.lat, @"adm2":one.adm2,
                                          @"adm1":one.adm1, @"country":one.country, @"tz":one.tz, @"utcOffset":one.utcOffset,
                                          @"isDst":one.isDst, @"type":one.type, @"rank":one.rank, @"fxLink":one.fxLink};
            [locations addObject:oneLocation];
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:locations forKey:@"locations"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"geoCityLookup faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
    
}
/// 热门城市查询
+ (void) getGeoTopCity:(id)param result:(FlutterResult)result{
    NSDictionary *paramDic = param;
    QWeatherConfigInstance.number = paramDic[@"number"];
    QWeatherConfigInstance.range = paramDic[@"range"];
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_GEO_TOPCITY
      WithSuccess:^(GeoBaseClass *rep) {
        [DebugPrint print:[@"geoCityLookup WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSMutableArray<NSDictionary*> *locations = [NSMutableArray new];
        for (Location *one in rep.location) {
            NSDictionary *oneLocation = @{@"name":one.name, @"id":one.cid, @"lon":one.lon, @"lat":one.lat, @"adm2":one.adm2,
                                          @"adm1":one.adm1, @"country":one.country, @"tz":one.tz, @"utcOffset":one.utcOffset,
                                          @"isDst":one.isDst, @"type":one.type, @"rank":one.rank, @"fxLink":one.fxLink};
            [locations addObject:oneLocation];
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:locations forKey:@"locations"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getGeoTopCity faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}
/// POI信息搜索
+ (void) geoPoiLookup:(id)param result:(FlutterResult)result{
    NSDictionary *paramDic = param;
    QWeatherConfigInstance.location = paramDic[@"location"];
    QWeatherConfigInstance.number = paramDic[@"number"];
    QWeatherConfigInstance.type = paramDic[@"type"];
    QWeatherConfigInstance.city = paramDic[@"city"];
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_GEO_POI_LOOKUP
      WithSuccess:^(GeoBaseClass *rep) {
        [DebugPrint print:[@"geoCityLookup WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSMutableArray<NSDictionary*> *locations = [NSMutableArray new];
        for (Location *one in rep.location) {
            NSDictionary *oneLocation = @{@"name":one.name, @"id":one.cid, @"lon":one.lon, @"lat":one.lat, @"adm2":one.adm2,
                                          @"adm1":one.adm1, @"country":one.country, @"tz":one.tz, @"utcOffset":one.utcOffset,
                                          @"isDst":one.isDst, @"type":one.type, @"rank":one.rank, @"fxLink":one.fxLink};
            [locations addObject:oneLocation];
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:locations forKey:@"locations"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"geoPoiLookup faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}
/// POI范围搜索
+ (void) geoPoiRangeLookup:(id)param result:(FlutterResult)result{
    NSDictionary *paramDic = param;
    QWeatherConfigInstance.location = paramDic[@"location"];
    QWeatherConfigInstance.radius = paramDic[@"radius"];
    QWeatherConfigInstance.number = paramDic[@"number"];
    QWeatherConfigInstance.type = paramDic[@"type"];
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_GEO_POI_RANGE
      WithSuccess:^(GeoBaseClass *rep) {
        [DebugPrint print:[@"geoCityLookup WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSMutableArray<NSDictionary*> *locations = [NSMutableArray new];
        for (Location *one in rep.location) {
            NSDictionary *oneLocation = @{@"name":one.name, @"id":one.cid, @"lon":one.lon, @"lat":one.lat, @"adm2":one.adm2,
                                          @"adm1":one.adm1, @"country":one.country, @"tz":one.tz, @"utcOffset":one.utcOffset,
                                          @"isDst":one.isDst, @"type":one.type, @"rank":one.rank, @"fxLink":one.fxLink};
            [locations addObject:oneLocation];
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:locations forKey:@"locations"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"geoPoiLookup faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
    
}
@end
