//
//  SecondViewController.m
//  MemoryManage-CADisplayLink+Timer
//
//  Created by chenshuang on 2018/9/24.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "SecondViewController.h"
#import "Proxy.h"
#import "Proxy1.h"

@interface SecondViewController ()
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"%s", __func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1.会内存泄露
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTest) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    // 2.使用Block避免内存泄露
//    __weak typeof(self) weakSelf = self;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [weakSelf timerTest];
//    }];
    
    // 3.使用Proxy避免内存泄露
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[Proxy proxyWithTarget:self] selector:@selector(timerTest) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    // 4.使用NSProxy避免内存泄露
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[Proxy1 proxyWithTarget:self] selector:@selector(timerTest) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)timerTest {
    NSLog(@"%s", __func__);
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    [self.timer invalidate];
}


@end
