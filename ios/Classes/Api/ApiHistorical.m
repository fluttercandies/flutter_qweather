//
//  ApiHistorical.m
//  flutter_qweather
//
//  Created by CyJay on 2022/4/19.
//

#import "ApiHistorical.h"
#import "../DebugPrint/DebugPrint.h"

@implementation ApiHistorical
/// 获取历史天气
+ (void) getHistoricalWeather:(id)param result:(FlutterResult)result{
    NSDictionary *paramDic = param;
    QWeatherConfigInstance.location = paramDic[@"location"];
    QWeatherConfigInstance.date = paramDic[@"date"];
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_HISTORICAL_WEATHER WithSuccess:^(WeatherHistoricalBaseClass *rep) {
        [DebugPrint print:[@"getHistoricalWeather WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSDictionary *weatherDaily = @{@"date": rep.weatherDaily.date, @"sunrise": rep.weatherDaily.sunrise, @"sunset": rep.weatherDaily.sunset,
                              @"moonrise": rep.weatherDaily.moonrise, @"moonset": rep.weatherDaily.moonset, @"moonPhase": rep.weatherDaily.moonPhase,
                              @"tempMax": rep.weatherDaily.tempMax,  @"tempMin": rep.weatherDaily.tempMin,
                              @"precip": rep.weatherDaily.precip, @"pressure": rep.weatherDaily.pressure};
        NSMutableArray<NSDictionary*> *weatherHourlyList = [NSMutableArray new];
        for (HistoricalWeatherHourly *one in rep.weatherHourly)  {
            NSDictionary *oneWeatherHourly = @{
                @"time": one.time, @"temp": one.temp, @"icon":one.icon,@"text":one.text, @"wind360": one.wind360,
                @"windDir": one.windDir, @"windScale": one.windScale, @"windSpeed": one.windSpeed, @"humidity": one.humidity,
                @"precip": one.precip, @"pressure": one.pressure};
            [weatherHourlyList addObject:oneWeatherHourly];
        }
                
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:weatherDaily forKey:@"dailyBean"];
        [dic setValue:weatherHourlyList forKey:@"hourlyBeans"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getHistoricalWeather faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}

/// 获取历史空气质量
+ (void) getHistoricalAir:(id)param result:(FlutterResult)result{
    NSDictionary *paramDic = param;
    QWeatherConfigInstance.location = paramDic[@"location"];
    QWeatherConfigInstance.date = paramDic[@"date"];
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_HISTORICAL_AIR WithSuccess:^(WeatherHistoricalBaseClass *rep) {
        [DebugPrint print:[@"getHistoricalAir WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }

        NSMutableArray<NSDictionary*> *airHourlyList = [NSMutableArray new];
        for (HistoricalAirHourly *one in rep.airHourly)  {
            NSDictionary *oneAirHourly = @{
                @"pubTime":one.pubTime, @"aqi":one.aqi, @"level": one.level, @"category": one.category, @"primary": one.primary,
                @"pm10": one.pm10, @"pm2p5": one.pm2p5, @"no2": one.no2, @"so2": one.so2, @"co": one.co, @"o3": one.o3};
            [airHourlyList addObject:oneAirHourly];
        }        
        
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:airHourlyList forKey:@"airHourlyBeans"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getHistoricalAir faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}
@end
