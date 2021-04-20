//
//  ApiWeather.m
//  qweather
//
//  Created by CyJay on 2021/4/19.
//

#import "ApiWeather.h"
#import "DebugPrint.h"

@implementation ApiWeather

/// 获取当前天气
+ (void) getWeatherNow:(NSString*)location result:(FlutterResult)result{
    QWeatherConfigInstance.location = location;
    QWeatherConfigInstance.lang = @"";
    QWeatherConfigInstance.unit = @"";
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_WEATHER_NOW
      WithSuccess:^(id responseObject) {
        WeatherBaseClass *rep = responseObject;
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
        [dic setValue:now forKey:@"now"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getWeatherNow faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}

@end
