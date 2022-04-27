//
//  ApiTropical.m
//  flutter_qweather
//
//  Created by CyJay on 2022/4/20.
//

#import "ApiTropical.h"
#import "../DebugPrint/DebugPrint.h"
@implementation ApiTropical
/// 台风列表
+ (void) getStormList:(id)param result:(FlutterResult)result{
    NSDictionary *paramDic = param;
    QWeatherConfigInstance.year = paramDic[@"year"];
    NSString *basinStr = paramDic[@"basin"];
    QWeatherConfigInstance.basin = BASIN_TYPE_NP;
    if ([basinStr isEqualToString: @"AL"]){
        QWeatherConfigInstance.basin = BASIN_TYPE_AL;
    }else if ([basinStr isEqualToString: @"EP"]){
        QWeatherConfigInstance.basin = BASIN_TYPE_EP;
    }else if ([basinStr isEqualToString: @"SP"]){
        QWeatherConfigInstance.basin = BASIN_TYPE_SP;
    }else if ([basinStr isEqualToString: @"NI"]){
        QWeatherConfigInstance.basin = BASIN_TYPE_NI;
    }else if ([basinStr isEqualToString: @"SI"]){
        QWeatherConfigInstance.basin = BASIN_TYPE_SI;
    }
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_STORM_LIST WithSuccess:^(StormListBaseClass *rep) {
        [DebugPrint print:[@"getStormList WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSMutableArray<NSDictionary*> *stormList = [NSMutableArray new];
        for (Storm *one in rep.stormList) {
            NSMutableDictionary *oneStorm = [NSMutableDictionary new];
            [oneStorm setValue:one.stormId forKey:@"stormId"];
            [oneStorm setValue:one.name forKey:@"name"];
            [oneStorm setValue:one.basin forKey:@"basin"];
            [oneStorm setValue:one.year forKey:@"year"];
            [oneStorm setValue:@"0" forKey:@"active"];
            if (one.isActive) {
                [oneStorm setValue:@"1" forKey:@"active"];
            }
            [stormList addObject:oneStorm];
        }
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:stormList forKey:@"stormList"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getStormList faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
    
}

/// 台风实况和路径
+ (void) getStormTrack:(id)param result:(FlutterResult)result{
    QWeatherConfigInstance.stormID = param;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_STORM_TRACK WithSuccess:^(StormNowTrackBaseClass *rep) {
        [DebugPrint print:[@"getStormList WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSMutableDictionary *nowTrack = [NSMutableDictionary new];
        [nowTrack setValue:rep.now[0].pubTime forKey:@"pubTime"];
        [nowTrack setValue:rep.now[0].lat forKey:@"lat"];
        [nowTrack setValue:rep.now[0].lon forKey:@"lon"];
        [nowTrack setValue:rep.now[0].type forKey:@"type"];
        [nowTrack setValue:rep.now[0].pressure forKey:@"pressure"];
        [nowTrack setValue:rep.now[0].windSpeed forKey:@"windSpeed"];
        [nowTrack setValue:rep.now[0].moveSpeed forKey:@"moveSpeed"];
        [nowTrack setValue:rep.now[0].moveDir forKey:@"moveDir"];
        [nowTrack setValue:rep.now[0].move360 forKey:@"move360"];
        if (rep.now[0].windRadius30 != NULL){
            NSDictionary *windRadius30 = @{@"neRadius":rep.now[0].windRadius30.neRadius, @"seRadius":rep.now[0].windRadius30.seRadius,
                                           @"swRadius":rep.now[0].windRadius30.swRadius, @"nwRadius":rep.now[0].windRadius30.nwRadius};
            [nowTrack setValue:windRadius30 forKey:@"windRadius30"];
        }
        if (rep.now[0].windRadius50 != NULL){
            NSDictionary *windRadius50 = @{@"neRadius":rep.now[0].windRadius50.neRadius, @"seRadius":rep.now[0].windRadius50.seRadius,
                                           @"swRadius":rep.now[0].windRadius50.swRadius, @"nwRadius":rep.now[0].windRadius50.nwRadius};
            [nowTrack setValue:windRadius50 forKey:@"windRadius50"];
        }
        if (rep.now[0].windRadius64 != NULL){
            NSDictionary *windRadius64 = @{@"neRadius":rep.now[0].windRadius64.neRadius, @"seRadius":rep.now[0].windRadius64.seRadius,
                                           @"swRadius":rep.now[0].windRadius64.swRadius, @"nwRadius":rep.now[0].windRadius64.nwRadius};
            [nowTrack setValue:windRadius64 forKey:@"windRadius64"];
        }
        
        NSMutableArray<NSDictionary*> *trackList = [NSMutableArray new];
        for (Track *one in rep.track) {
            NSMutableDictionary *oneTrack = [NSMutableDictionary new];
            [oneTrack setValue:one.time forKey:@"time"];
            [oneTrack setValue:one.lat forKey:@"lat"];
            [oneTrack setValue:one.lon forKey:@"lon"];
            [oneTrack setValue:one.type forKey:@"type"];
            [oneTrack setValue:one.pressure forKey:@"pressure"];
            [oneTrack setValue:one.windSpeed forKey:@"windSpeed"];
            [oneTrack setValue:one.moveSpeed forKey:@"moveSpeed"];
            [oneTrack setValue:one.moveDir forKey:@"moveDir"];
            [oneTrack setValue:one.move360 forKey:@"move360"];
            if (one.windRadius30 != NULL){
                NSDictionary *windRadius30 = @{@"neRadius":one.windRadius30.neRadius, @"seRadius":one.windRadius30.seRadius,
                                               @"swRadius":one.windRadius30.swRadius, @"nwRadius":one.windRadius30.nwRadius};
                [oneTrack setValue:windRadius30 forKey:@"windRadius30"];
            }
            if (one.windRadius50 != NULL){
                NSDictionary *windRadius50 = @{@"neRadius":one.windRadius50.neRadius, @"seRadius":one.windRadius50.seRadius,
                                               @"swRadius":one.windRadius50.swRadius, @"nwRadius":one.windRadius50.nwRadius};
                [oneTrack setValue:windRadius50 forKey:@"windRadius50"];
            }
            if (one.windRadius64 != NULL){
                NSDictionary *windRadius64 = @{@"neRadius":one.windRadius64.neRadius, @"seRadius":one.windRadius64.seRadius,
                                               @"swRadius":one.windRadius64.swRadius, @"nwRadius":one.windRadius64.nwRadius};
                [oneTrack setValue:windRadius64 forKey:@"windRadius64"];
            }
            [trackList addObject:oneTrack];
        }
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:nowTrack forKey:@"now"];
        [dic setValue:trackList forKey:@"trackList"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getStormTrack faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}

/// 台风预报
+ (void) getStormForecast:(id)param result:(FlutterResult)result{
    QWeatherConfigInstance.stormID = param;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_STORM_FORECAST WithSuccess:^(StormForecastBaseClass *rep) {
        [DebugPrint print:[@"getStormList WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSMutableArray<NSDictionary*> *forecastList = [NSMutableArray new];
        for (StormForecast *one in rep.forecast) {
            NSDictionary *oneForecast = @{@"fxTime":one.fxTime, @"lat":one.lat, @"lon":one.lon, @"type":one.type, @"pressure":one.pressure,
                                          @"windSpeed":one.windSpeed, @"moveSpeed":one.moveSpeed, @"moveDir":@"", @"move360":one.move360};
            [forecastList addObject:oneForecast];
        }
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:forecastList forKey:@"forecastList"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getStormForecast faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}
@end

