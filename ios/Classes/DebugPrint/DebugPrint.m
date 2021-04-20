//
//  DebugPrint.m
//  qweather
//
//  Created by CyJay on 2021/4/19.
//


#import "DebugPrint.h"

@implementation DebugPrint
static BOOL _debug = NO;
+ (void)setDebug:(BOOL)debug{
    if (debug)debug = YES;
    if (!debug)debug= NO;
    if (_debug != debug){
        NSLog(@"设置调试模式：%@", debug?@"YES":@"NO");
        _debug = debug;
    }
}
+ (void)print:(NSString*)value{
    if (_debug){
        NSLog(@"com.fluttercandies.qweather：%@",value);
    }
}
@end
