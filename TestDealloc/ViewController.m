//
//  ViewController.m
//  TestDealloc
//
//  Created by chenfenglong on 2017/7/17.
//  Copyright © 2017年 chenfenglong. All rights reserved.
//

#import "ViewController.h"
#import "YSViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    YSViewController *vc = [[YSViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
