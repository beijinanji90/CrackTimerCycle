//
//  YSProxyObject.h
//  TestArc
//
//  Created by chenfenglong on 2017/7/17.
//  Copyright © 2017年 chenfenglong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSProxyObject : NSObject

- (void)timerClick;

@property (nonatomic,copy) dispatch_block_t tick;

@end
