//
//  WarningApi.m
//  flutter_qweather
//
//  Created by CyJay on 2022/4/18.
//

#import "ApiWarning.h"
#import "../DebugPrint/DebugPrint.h"
@implementation ApiWarning

+ (void) getWarning:(id)param result:(FlutterResult)result{
    QWeatherConfigInstance.location = param;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_WARNING WithSuccess:^(WarningBaseClass *rep) {
        [DebugPrint print:[@"getWarning WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSMutableArray<NSDictionary*> *warningList = [NSMutableArray new];
        for (Warning *one in rep.warning)  {
            NSDictionary *oneWarning = @{
                @"id": one.warningId, @"sender": one.sender, @"pubTime":one.pubTime, @"title":one.title,
                @"startTime": one.startTime, @"endTime": one.endTime, @"status": one.status, @"level": one.level,
                @"type": one.type, @"typeName": one.typeName, @"text": one.text, @"related": one.related};
            [warningList addObject:oneWarning];
        }
        
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:warningList forKey:@"warningList"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getWarning faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}

/// 获取灾害预警列表
+ (void) getWarningList:(id)param result:(FlutterResult)result{
    QWeatherConfigInstance.range = param;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_WARNINGLIST WithSuccess:^(WarningListClass *rep) {
        [DebugPrint print:[@"getWarningList WithSuccess: " stringByAppendingString:rep.description]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSMutableArray<NSDictionary*> *warningLocList = [NSMutableArray new];
        for (WarningLoc *one in rep.warningLocList)  {
            NSDictionary *oneWarningLoc = @{@"locationId": one.locationId};
            [warningLocList addObject:oneWarningLoc];
        }
        
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:warningLocList forKey:@"warningBean"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[@"getWarningList faileureForError: " stringByAppendingString:error.localizedDescription]];
        result(NULL);
    }];
}
@end
