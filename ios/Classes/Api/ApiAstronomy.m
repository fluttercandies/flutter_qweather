//
//  ApiAstronomy.m
//  flutter_qweather
//
//  Created by CyJay on 2022/4/19.
//

#import "ApiAstronomy.h"
#import "../DebugPrint/DebugPrint.h"

@implementation ApiAstronomy

/// 获取日出日落
+ (void) getSun:(id)param result:(FlutterResult)result{
    NSDictionary *paramDic = param;
    QWeatherConfigInstance.location = paramDic[@"location"];
    QWeatherConfigInstance.date = paramDic[@"date"];
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_ASTRONOMY_SUN WithSuccess:^(SunBaseModel *rep) {
        [DebugPrint print:[@"getSun WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:rep.sunrise forKey:@"sunrise"];
        [dic setValue:rep.sunset forKey:@"sunset"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getSun faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}

/// 获取月升月落月相
+ (void) getMoon:(id)param result:(FlutterResult)result{
    NSDictionary *paramDic = param;
    QWeatherConfigInstance.location = paramDic[@"location"];
    QWeatherConfigInstance.date = paramDic[@"date"];
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_ASTRONOMY_MOON WithSuccess:^(MoonBaseModel *rep) {
        [DebugPrint print:[@"getMoon WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSMutableArray<NSDictionary*> *moonPhaseList = [NSMutableArray new];
        for (MoonPhase *one in rep.moonPhases) {
            NSDictionary *oneMoonPhase = @{@"fxTime": one.fxTime, @"value": one.value, @"name":one.name,
                                           @"icon":one.icon, @"illumination": one.illumination};
            [moonPhaseList addObject:oneMoonPhase];
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:rep.moonrise forKey:@"moonrise"];
        [dic setValue:rep.moonset forKey:@"moonset"];
        [dic setValue:moonPhaseList forKey:@"moonPhaseBeanList"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getMoon faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}

/// 获取太阳高度角
+ (void) getSolarElevationAngle:(id)param result:(FlutterResult)result{
    NSDictionary *paramDic = param;
    QWeatherConfigInstance.location = paramDic[@"location"];
    QWeatherConfigInstance.date = paramDic[@"date"];
    QWeatherConfigInstance.time = paramDic[@"time"];
    QWeatherConfigInstance.tz = paramDic[@"tz"];
    QWeatherConfigInstance.alt = paramDic[@"alt"];
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_ASTRONOMY_SUN_ANGLE WithSuccess:^(SunAngleBaseModel *rep) {
        [DebugPrint print:[@"getSolarElevationAngle WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:rep.solarElevationAngle forKey:@"solarElevationAngle"];
        [dic setValue:rep.solarAzimuthAngle forKey:@"solarAzimuthAngle"];
        [dic setValue:rep.solarHour forKey:@"solarHour"];
        [dic setValue:rep.hourAngle forKey:@"hourAngle"];
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getSolarElevationAngle faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}

@end
