//
//  ApiOcean.m
//  flutter_qweather
//
//  Created by CyJay on 2022/4/19.
//

#import "ApiOcean.h"
#import "../DebugPrint/DebugPrint.h"
@implementation ApiOcean

/// 获取潮汐
+ (void) getOceanTide:(id)param result:(FlutterResult)result{
    NSDictionary *paramDic = param;
    QWeatherConfigInstance.location = paramDic[@"location"];
    QWeatherConfigInstance.date = paramDic[@"date"];
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_OCEAN_TIDE WithSuccess:^(OceanTideBaseClass *rep) {
        [DebugPrint print:[@"getOceanTide WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }

        NSMutableArray<NSDictionary*> *tideList = [NSMutableArray new];
        for (TideTable *one in rep.tideTable)  {
            NSDictionary *oneTide = @{@"fxTime":one.fxTime, @"height":one.height, @"type": one.type};
            [tideList addObject:oneTide];
        }
        NSMutableArray<NSDictionary*> *tideHourlyList = [NSMutableArray new];
        for (TideHourly *one in rep.tideHourly)  {
            NSDictionary *oneTideHourly = @{@"fxTime":one.fxTime, @"height":one.height};
            [tideHourlyList addObject:oneTideHourly];
        }

        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime":rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:tideList forKey:@"tideTable"];
        [dic setValue:tideHourlyList forKey:@"tideHourlyList"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getOceanTide faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}

/// 获取潮流
+ (void) getOceanCurrents:(id)param result:(FlutterResult)result{
    NSDictionary *paramDic = param;
    QWeatherConfigInstance.location = paramDic[@"location"];
    QWeatherConfigInstance.date = paramDic[@"date"];
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_OCEAN_CURRENTS WithSuccess:^(OceanCurrentsBaseClass *rep) {
        [DebugPrint print:[@"getOceanCurrents WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        
        NSMutableArray<NSDictionary*> *currentsList = [NSMutableArray new];
        for (CurrentsTable *one in rep.currentsTable)  {
            NSDictionary *oneCurrents = @{@"fxTime":one.fxTime, @"speedMax":one.speedMax, @"dir360": one.dir360};
            [currentsList addObject:oneCurrents];
        }
        NSMutableArray<NSDictionary*> *currentsHourlyList = [NSMutableArray new];
        for (CurrentsHourly *one in rep.currentsHourly)  {
            NSDictionary *oneCurrentsHourly = @{@"fxTime":one.fxTime, @"speed":one.speed, @"dir360": one.dir360};
            [currentsHourlyList addObject:oneCurrentsHourly];
        }

        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime":rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:currentsList forKey:@"tableList"];
        [dic setValue:currentsHourlyList forKey:@"hourlyList"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getOceanCurrents faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}
@end
