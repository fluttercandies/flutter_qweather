//
//  DebugPrint.h
//  qweather
//
//  Created by CyJay on 2021/4/19.
//
#import <Foundation/Foundation.h>

@interface DebugPrint : NSObject
+ (void)setDebug:(BOOL)debug;
+ (void)print:(NSString*)value;
@end
