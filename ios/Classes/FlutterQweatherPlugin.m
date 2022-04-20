#import "FlutterQweatherPlugin.h"
#import "MethodConstants.h"
#import "DebugPrint/DebugPrint.h"
#import "Api/ApiAir.h"
#import "Api/ApiAstronomy.h"
#import "Api/ApiGeo.h"
#import "Api/ApiIndices.h"
#import "Api/ApiWeather.h"
#import "Api/ApiWarning.h"
#import "Api/ApiHistorical.h"
#import "Api/ApiOcean.h"
#import "Api/ApiTropical.h"

@implementation FlutterQweatherPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"com.fluttercandies.qweather" binaryMessenger:[registrar messenger]];
    FlutterQweatherPlugin* instance = [[FlutterQweatherPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([GetPlatformVersion isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }else if ([SetDebug isEqualToString:call.method]){  // 设置 Debug
      [self setDebug:call.arguments result:result];
  }else if ([Init isEqualToString:call.method]){  /// 初始化
      [self init:call.arguments result:result];
  }else if ([GeoCityLookup isEqualToString:call.method]){ /// 城市信息查询
      [ApiGeo geoCityLookup:call.arguments result:result];
  }else if ([GetGeoTopCity isEqualToString:call.method]){ /// 热门城市查询
      [ApiGeo getGeoTopCity:call.arguments result:result];
  }else if ([GeoPoiLookup isEqualToString:call.method]){ /// POI信息搜索
      [ApiGeo geoPoiLookup:call.arguments result:result];
  }else if ([GeoPoiRangeLookup isEqualToString:call.method]){ /// POI范围搜索
      [ApiGeo geoPoiRangeLookup:call.arguments result:result];
  }else if ([GetWeatherNow isEqualToString:call.method]){ /// 查询实时天气
      [ApiWeather getWeatherNow:call.arguments result:result];
  }else if ([GetWeatherDaily isEqualToString:call.method]){ /// 获取逐天预报
      [ApiWeather getWeatherDaily:call.arguments result:result];
  }else if ([GetWeatherHourly isEqualToString:call.method]){ /// 获取逐时预报
      [ApiWeather getWeatherHourly:call.arguments result:result];
  }else if ([GetWeatherMinuteLy isEqualToString:call.method]){ /// 获取中国地区未来2小时内每5分钟降水
      [ApiWeather getWeatherMinuteLy:call.arguments result:result];
  }else if ([GetIndices1Day isEqualToString:call.method]){ /// 获取1天生活指数
      [ApiIndices getIndices1Day:call.arguments result:result];
  }else if ([GetIndices3Day isEqualToString:call.method]){ /// 获取3天生活指数
      [ApiIndices getIndices3Day:call.arguments result:result];
  }else if ([GetWarning isEqualToString:call.method]){ /// 获取灾害预警
      [ApiWarning getWarning:call.arguments result:result];
  }else if ([GetWarningList isEqualToString:call.method]){ /// 获取灾害预警列表
      [ApiWarning getWarningList:call.arguments result:result];
  }else if ([GetAirNow isEqualToString:call.method]){ /// 获取实时空气质量
      [ApiAir getAirNow:call.arguments result:result];
  }else if ([GetAir5Day isEqualToString:call.method]){ /// 获取5天空气质量预报
      [ApiAir getAir5Day:call.arguments result:result];
  }else if ([GetHistoricalWeather isEqualToString:call.method]){ /// 获取历史天气
      [ApiHistorical getHistoricalWeather:call.arguments result:result];
  }else if ([GetHistoricalAir isEqualToString:call.method]){ /// 获取历史空气质量
      [ApiHistorical getHistoricalAir:call.arguments result:result];
  }else if ([GetSun isEqualToString:call.method]){ /// 获取日出日落
      [ApiAstronomy getSun:call.arguments result:result];
  }else if ([GetMoon isEqualToString:call.method]){ /// 获取月升月落月相
      [ApiAstronomy getMoon:call.arguments result:result];
  }else if ([GetSolarElevationAngle isEqualToString:call.method]){ /// 获取太阳高度角
      [ApiAstronomy getSolarElevationAngle:call.arguments result:result];
  }else if ([GetOceanTide isEqualToString:call.method]){ /// 获取潮汐
      [ApiOcean getOceanTide:call.arguments result:result];
  }else if ([GetOceanCurrents isEqualToString:call.method]){ /// 获取潮流
      [ApiOcean getOceanCurrents:call.arguments result:result];
  }else if ([GetStormList isEqualToString:call.method]){ /// 台风列表
      [ApiTropical getStormList:call.arguments result:result];
  }else if ([GetStormTrack isEqualToString:call.method]){ /// 台风实况和路径
      [ApiTropical getStormTrack:call.arguments result:result];
  }else if ([GetStormForecast isEqualToString:call.method]){ /// 台风预报
      [ApiTropical getStormForecast:call.arguments result:result];
  }else{
      result(FlutterMethodNotImplemented);
  }
}

///  初始化
- (void)init:(NSDictionary*)arguments result:(FlutterResult)result{
    NSNumber *debugNum  = arguments[@"debug"];
    [DebugPrint setDebug:[debugNum boolValue]];
    NSNumber *bizNum  = arguments[@"biz"];
    BOOL biz = [bizNum boolValue];
    QWeatherConfigInstance.publicID = arguments[@"publicId"];
    QWeatherConfigInstance.appKey = arguments[@"key"];
    if (biz){
        QWeatherConfigInstance.appType = APP_TYPE_BIZ;
    }else{
        QWeatherConfigInstance.appType = APP_TYPE_DEV;
    }
    result([NSNumber numberWithBool:YES]);
}

///  设置  Debug
- (void) setDebug:(NSNumber*)debugNum result:(FlutterResult)result{
    [DebugPrint setDebug:[debugNum boolValue]];
    result([NSNumber numberWithBool:YES]);
}

@end
