//
//  YSViewController.m
//  TestDealloc
//
//  Created by chenfenglong on 2017/7/17.
//  Copyright © 2017年 chenfenglong. All rights reserved.
//

#import "YSViewController.h"
#import "YSProxyObject.h"
#import "NSTimer+YS.h"

@interface YSViewController ()

@property (nonatomic,strong) NSTimer *timer;

@end

@implementation YSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //其实开启一个NSTimer的时候，都会加入到当前的NSRunloop中，猜测是当前Runloop会强引用当前NSTimer，所有并不需要指向
    
    //1、第一种会发生循环引用，不过有一点，其实不用self.timer指向，这个time也可以执行，不知道为什么
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(sayHello) userInfo:nil repeats:YES];
    
    //2、通过中间类包一层，防止循环引用
//    __weak typeof(self) _weakSelf = self;
//    YSProxyObject *proxyObject = [[YSProxyObject alloc] init];
//    proxyObject.tick = ^(){
//        [_weakSelf sayHello];
//    };
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:proxyObject selector:@selector(timerClick) userInfo:nil repeats:YES];
    
    //3、通过NSTimer的分类，把target，selector
    __weak typeof(self) _weakSelf = self;
    YSProxyObject *proxyObject = [[YSProxyObject alloc] init];
    proxyObject.tick = ^(){
        [_weakSelf sayHello];
    };
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:proxyObject selector:@selector(timerClick) userInfo:nil repeats:YES];
    
    //4、iOS10的时候，Apple提供了一种Block方式，可以避免循环引用
//    if ([[UIDevice currentDevice].systemVersion floatValue] > 10.0) {
//        [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//            [_weakSelf sayHello];
//        }];
//    }
}

- (void)sayHello{
    NSLog(@"hello");
}

- (void)dealloc{
    NSLog(@"%@",NSStringFromClass([self class]));
    [self.timer invalidate];
}


@end
