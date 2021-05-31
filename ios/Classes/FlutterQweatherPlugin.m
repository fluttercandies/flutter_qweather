#import "FlutterQweatherPlugin.h"
#import "MethodConstants.h"
#import "DebugPrint/DebugPrint.h"
#import "Api/ApiGeo.h"
#import "Api/ApiWeather.h"


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
