//
//  NSTimer+YS.h
//  TestDealloc
//
//  Created by chenfenglong on 2017/7/17.
//  Copyright © 2017年 chenfenglong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (YS)

+ (instancetype)timerWithTimeInterval:(NSTimeInterval)timeInterval
                                block:(void (^)())timeBlock
                              repeats:(BOOL)repeats;

@end
