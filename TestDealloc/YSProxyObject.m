//
//  YSProxyObject.m
//  TestArc
//
//  Created by chenfenglong on 2017/7/17.
//  Copyright © 2017年 chenfenglong. All rights reserved.
//

#import "YSProxyObject.h"

@implementation YSProxyObject

- (void)dealloc
{
    NSLog(@"Proxy销毁了");
}

- (void)timerClick
{
    if (self.tick) {
        self.tick();
    }
}

@end
