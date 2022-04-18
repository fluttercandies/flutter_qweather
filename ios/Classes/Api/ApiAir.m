//
//  ApiAir.m
//  flutter_qweather
//
//  Created by CyJay on 2022/4/18.
//

#import "ApiAir.h"
#import "../DebugPrint/DebugPrint.h"
@implementation ApiAir

/// 获取实时空气质量
+ (void) getAirNow:(id _Nullable)param result:(FlutterResult)result{
    QWeatherConfigInstance.location = param;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_WEATHER_AIR_NOW WithSuccess:^(AirBaseClass *rep) {
        [DebugPrint print:[@"getAirNow WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSDictionary *now = @{@"pubTime": rep.now.pubTime, @"aqi": rep.now.aqi, @"level": rep.now.level, @"category": rep.now.category,
                              @"primary": rep.now.primary,  @"pm10": rep.now.pm10, @"pm2p5": rep.now.pm2p5, @"no2": rep.now.no2,
                              @"so2": rep.now.so2, @"co": rep.now.co, @"o3": rep.now.o3};
        NSMutableArray<NSDictionary*> *stations = [NSMutableArray new];
        for (AirStation *one in rep.airStation)  {
            NSDictionary *oneStation = @{
                @"name": one.name, @"id": one.cid, @"pubTime":one.pubTime,@"aqi":one.aqi, @"level": one.level,
                @"category": one.category, @"primary": one.primary, @"pm10": one.pm10, @"pm2p5": one.pm2p5,
                @"no2": one.no2, @"so2": one.so2, @"co": one.co, @"o3": one.o3};
            [stations addObject:oneStation];
        }
        
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:now forKey:@"now"];
        [dic setValue:stations forKey:@"airNowStationBean"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getAirNow faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}

/// 空气质量5天预报
+ (void) getAir5Day:(id _Nullable)param result:(FlutterResult)result{
    QWeatherConfigInstance.location = param;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_WEATHER_AIR_5D WithSuccess:^(AirBaseClass *rep) {
        [DebugPrint print:[@"getAir5Day WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSMutableArray<NSDictionary*> *daily = [NSMutableArray new];
        for (AirDaily *one in rep.airStation)  {
            NSDictionary *oneDaily = @{
                @"fxDate": one.fxDate, @"aqi": one.aqi, @"level":one.level,@"category":one.category, @"primary": one.primary};
            [daily addObject:oneDaily];
        }
        
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:daily forKey:@"airDailyBeans"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getAir5Day faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}
@end
