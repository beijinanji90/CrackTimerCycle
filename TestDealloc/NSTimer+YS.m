//
//  NSTimer+YS.m
//  TestDealloc
//
//  Created by chenfenglong on 2017/7/17.
//  Copyright © 2017年 chenfenglong. All rights reserved.
//

#import "NSTimer+YS.h"

@implementation NSTimer (YS)

+ (instancetype)timerWithTimeInterval:(NSTimeInterval)timeInterval
                                   block:(void (^)())timeBlock
                                 repeats:(BOOL)repeats
{
    return [self timerWithTimeInterval:timeInterval
                                target:self
                              selector:@selector(timeBlockInvoke:)
                              userInfo:[timeBlock copy]
                               repeats:repeats
            ];
}

+ (void)timeBlockInvoke:(NSTimer *)timer{
    void(^block)() = timer.userInfo;
    if (block) {
        block();
    }
}


@end
