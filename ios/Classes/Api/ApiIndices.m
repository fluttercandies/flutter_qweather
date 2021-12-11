//
//  ApiIndices.m
//  flutter_qweather
//
//  Created by CyJay on 2021/6/5.
//

#import "ApiIndices.h"
#import "../DebugPrint/DebugPrint.h"
@implementation ApiIndices
/// 获取1天生活指数
+ (void) getIndices1Day:(id)param result:(FlutterResult)result{
    [ApiIndices getIndices:@"getIndices1Day" param:param result:result];
}
/// 获取3天生活指数
+ (void) getIndices3Day:(id)param result:(FlutterResult)result{
    [ApiIndices getIndices:@"getIndices3Day" param:param result:result];
}

/// 获取生活指数
+ (void) getIndices:(NSString*)name param:(id)param result:(FlutterResult)result{
    NSDictionary *paramDic = param;
    QWeatherConfigInstance.location = paramDic[@"location"];
    NSArray<NSString*> *indicesTypes = paramDic[@"indicesTypes"];
    NSMutableArray<NSNumber*> *indicesTypesTmp = [NSMutableArray new];
    for (int i = 0; i < indicesTypes.count; i++){
        NSString *str = [indicesTypes objectAtIndex:i];
        if ([str isEqualToString:@"SPT"]){
            [indicesTypesTmp addObject: @(INDICES_TYPE_spt)];
        } else if ([str isEqualToString:@"CW"]){
            [indicesTypesTmp addObject: @(INDICES_TYPE_cw)];
        } else if ([str isEqualToString:@"DRSG"]){
            [indicesTypesTmp addObject: @(INDICES_TYPE_drsg)];
        } else if ([str isEqualToString:@"FIS"]){
            [indicesTypesTmp addObject: @(INDICES_TYPE_fis)];
        } else if ([str isEqualToString:@"UV"]){
            [indicesTypesTmp addObject: @(INDICES_TYPE_uv)];
        } else if ([str isEqualToString:@"TRAV"]){
            [indicesTypesTmp addObject: @(INDICES_TYPE_trav)];
        } else if ([str isEqualToString:@"AG"]){
            [indicesTypesTmp addObject: @(INDICES_TYPE_ag)];
        } else if ([str isEqualToString:@"COMF"]){
            [indicesTypesTmp addObject: @(INDICES_TYPE_comf)];
        } else if ([str isEqualToString:@"FLU"]){
            [indicesTypesTmp addObject: @(INDICES_TYPE_flu)];
        } else if ([str isEqualToString:@"AP"]){
            [indicesTypesTmp addObject: @(INDICES_TYPE_ap)];
        } else if ([str isEqualToString:@"AC"]){
            [indicesTypesTmp addObject: @(INDICES_TYPE_ac)];
        } else if ([str isEqualToString:@"GL"]){
            [indicesTypesTmp addObject: @(INDICES_TYPE_gl)];
        } else if ([str isEqualToString:@"MU"]){
            [indicesTypesTmp addObject: @(INDICES_TYPE_mu)];
        } else if ([str isEqualToString:@"DC"]){
            [indicesTypesTmp addObject: @(INDICES_TYPE_dc)];
        } else if ([str isEqualToString:@"PTEC"]){
            [indicesTypesTmp addObject: @(INDICES_TYPE_ptfc)];
        } else if ([str isEqualToString:@"SPI"]){
            [indicesTypesTmp addObject: @(INDICES_TYPE_spi)];
        } else if ([str isEqualToString:@"SKI"]){
            [indicesTypesTmp addObject: @(INDICES_TYPE_ski)];
        } else {
            indicesTypesTmp = [NSMutableArray arrayWithObject:@(INDICES_TYPE_all)];
            break;
        }
    }
    QWeatherConfigInstance.indices = indicesTypesTmp;
    INQUIRE_TYPE inquireType = INQUIRE_TYPE_INDICES_1D;
    if ([name isEqualToString:@"getIndices3Day"]){
        inquireType = INQUIRE_TYPE_INDICES_3D;
    }
    [QWeatherConfigInstance weatherWithInquireType:inquireType WithSuccess:^(IndicesBaseClass *rep) {
        [DebugPrint print:[name stringByAppendingString:[@" WithSuccess: " stringByAppendingString:rep.description]]];
        if (![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSMutableArray<NSDictionary*> *dailyList = [NSMutableArray new];
        for (IndicesDaily *one in rep.daily) {
            NSDictionary *oneIndicesDaily = @{@"date": one.date, @"type": one.type, @"name":one.name,
                                              @"level":one.level, @"category": one.category, @"text": one.text};
            [dailyList addObject:oneIndicesDaily];
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:dailyList forKey:@"dailyList"];
        result(dic);
    } faileureForError:^(NSError *error) {
        [DebugPrint print:[name stringByAppendingString:[@" faileureForError: " stringByAppendingString:error.localizedDescription]]];
        result(NULL);
    }];
}
@end
