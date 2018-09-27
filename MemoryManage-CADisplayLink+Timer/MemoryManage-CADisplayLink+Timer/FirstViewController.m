//
//  FirstViewController.m
//  MemoryManage-CADisplayLink+Timer
//
//  Created by chenshuang on 2018/9/24.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "FirstViewController.h"
#import "Proxy.h"
#import "Proxy1.h"

@interface FirstViewController ()
@property (strong, nonatomic) CADisplayLink *link;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"%s", __func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 保证调用频率和屏幕的刷帧频率一致，60FPS
    // 1.发生内存泄露
//    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(linkTest)];
//    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    // 2.使用Proxy避免内存泄露
//    self.link = [CADisplayLink displayLinkWithTarget:[Proxy proxyWithTarget:self] selector:@selector(linkTest)];
//    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    // 2.使用NSProxy避免内存泄露
    self.link = [CADisplayLink displayLinkWithTarget:[Proxy1 proxyWithTarget:self] selector:@selector(linkTest)];
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)linkTest {
    NSLog(@"%s", __func__);
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    [self.link invalidate];
}


@end
