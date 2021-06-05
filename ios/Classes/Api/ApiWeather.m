//
//  ApiWeather.m
//  flutter_qweather
//
//  Created by CyJay on 2021/4/19.
//

#import "ApiWeather.h"
#import "../DebugPrint/DebugPrint.h"

@implementation ApiWeather

/// 获取当前天气
+ (void) getWeatherNow:(id _Nullable)param result:(FlutterResult)result{
    QWeatherConfigInstance.location = param;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_WEATHER_NOW WithSuccess:^(WeatherBaseClass *rep) {
        [DebugPrint print:[@"getWeatherNow WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSDictionary *now = @{@"cloud": rep.now.cloud, @"dew": rep.now.dew, @"feelsLike": rep.now.feelsLike, @"humidity": rep.now.humidity,
                              @"icon": rep.now.icon,  @"obsTime": rep.now.obsTime, @"precip": rep.now.precip, @"pressure": rep.now.pressure,
                              @"temp": rep.now.temp, @"text": rep.now.text, @"vis": rep.now.vis, @"wind360": rep.now.wind360,
                              @"windDir": rep.now.windDir, @"windScale": rep.now.windScale, @"windSpeed": rep.now.windSpeed};
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:now forKey:@"now"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getWeatherNow faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}

/// 获取逐天预报
+ (void) getWeatherDaily:(id _Nullable)param result:(FlutterResult)result{
    NSDictionary *paramDic = param;
    NSNumber *dailyNum = paramDic[@"daily"];
    QWeatherConfigInstance.location = paramDic[@"location"];
    INQUIRE_TYPE inquireType = INQUIRE_TYPE_WEATHER_3D;
    if ([dailyNum isEqualToNumber: @7]){
        inquireType = INQUIRE_TYPE_WEATHER_7D;
    }else if ([dailyNum isEqualToNumber: @10]){
        inquireType = INQUIRE_TYPE_WEATHER_10D;
    }else if ([dailyNum isEqualToNumber: @15]){
        inquireType = INQUIRE_TYPE_WEATHER_15D;
    }
    [QWeatherConfigInstance weatherWithInquireType:inquireType WithSuccess:^(WeatherBaseClass *rep) {
        [DebugPrint print:[@"getWeatherDaily WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSMutableArray<NSDictionary*> *daily = [NSMutableArray new];
        for (Daily *one in rep.daily) {
            NSDictionary *oneDaily = @{
                @"cloud": one.cloud, @"fxDate": one.fxDate, @"humidity":one.humidity,@"iconDay":one.iconDay, @"iconNight": one.iconNight,
                @"moonPhase": one.moonPhase, @"moonset": one.moonset, @"moonrise": one.moonrise, @"precip": one.precip, @"pressure": one.pressure,
                @"sunrise": one.sunrise, @"sunset": one.sunset, @"tempMax": one.tempMax, @"tempMin": one.tempMin, @"textDay": one.textDay,
                @"textNight": one.textNight, @"uvIndex": one.uvIndex, @"vis": one.vis, @"wind360Day": one.wind360Day, @"wind360Night": one.wind360Night,
                @"windDirDay": one.windDirDay, @"windDirNight": one.WindDirNight, @"windScaleDay": one.windScaleDay, @"windScaleNight": one.windScaleNight,
                @"windSpeedDay": one.windSpeedDay, @"windSpeedNight": one.windSpeedNight
            };
            [daily addObject:oneDaily];
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:daily forKey:@"daily"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getWeatherDaily faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}
/// 获取逐时预报
+ (void) getWeatherHourly:(id _Nullable)param result:(FlutterResult)result{
    NSDictionary *paramDic = param;
    NSNumber *hourlyNum = paramDic[@"hourly"];
    QWeatherConfigInstance.location = paramDic[@"location"];
    INQUIRE_TYPE inquireType = INQUIRE_TYPE_WEATHER_24H;
    if ([hourlyNum isEqualToNumber: @72]){
        inquireType = INQUIRE_TYPE_WEATHER_72H;
    }else if ([hourlyNum isEqualToNumber: @168]){
        inquireType = INQUIRE_TYPE_WEATHER_168H;
    }
    [QWeatherConfigInstance weatherWithInquireType:inquireType WithSuccess:^(WeatherBaseClass *rep) {
        [DebugPrint print:[@"getWeatherHourly WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSMutableArray<NSDictionary*> *hourly = [NSMutableArray new];

        for (Hourly *one in rep.hourly) {
            NSDictionary *oneHourly = @{@"cloud": one.cloud, @"fxTime": one.fxTime, @"humidity":one.humidity,@"icon":one.icon, @"precip": one.precip,
                                        @"pressure": one.pressure, @"temp": one.temp, @"text": one.text, @"wind360": one.wind360, @"windDir": one.windDir,
                                        @"windScale": one.windScale, @"windSpeed":one.windSpeed, @"dew": one.dew, @"pop": one.pop};
            [hourly addObject:oneHourly];
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:hourly forKey:@"hourly"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getWeatherHourly faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}
/// 获取中国地区未来2小时内每5分钟降水
+ (void) getWeatherMinuteLy:(id _Nullable)param result:(FlutterResult)result{
    QWeatherConfigInstance.location = param;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_WEATHER_MINUTELY WithSuccess:^(WeatherMinutelyBaseClass *rep) {
            [DebugPrint print:[@"getWeatherMinuteLy WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSMutableArray<NSDictionary*> *minutely = [NSMutableArray new];
        for (Minutely *one in rep.minutely) {
            NSDictionary *oneMinutely = @{@"fxTime": one.fxTime, @"precip": one.precip, @"type": one.type};
            [minutely addObject:oneMinutely];
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:rep.summary forKey:@"summary"];
        [dic setValue:minutely forKey:@"minutely"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getWeatherMinuteLy faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}

@end
