//
//  ViewController.m
//  MemoryManage-CADisplayLink+Timer
//
//  Created by chenshuang on 2018/9/24.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "Proxy1.h"
#import "Proxy.h"
#import "CSTimer.h"

@interface ViewController ()
/** 任务标识*/
@property(nonatomic,strong)NSString *task;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [btn1 setTitle:@"CADisplayLink" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    btn1.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.25);
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [btn2 setTitle:@"NSTimer" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2Click) forControlEvents:UIControlEventTouchUpInside];
    btn2.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.5);
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [btn3 setTitle:@"开始定时器" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(startTimer) forControlEvents:UIControlEventTouchUpInside];
    btn3.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.75);
    [self.view addSubview:btn3];
}

- (void)btn1Click {
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    [self.navigationController pushViewController:firstVC animated:true];
}

- (void)btn2Click {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:true];
}

- (void)proxyTest {
    Proxy *proxy1 = [Proxy proxyWithTarget:self];
    
    Proxy1 *proxy2 = [Proxy1 proxyWithTarget:self];
    
    NSLog(@"%d %d",
          [proxy1 isKindOfClass:[ViewController class]],
          [proxy2 isKindOfClass:[ViewController class]]);
}

- (void)startTimer {
    // 1.使用block回调
    self.task = [CSTimer execTask:^{
        NSLog(@"111111 - %@", [NSThread currentThread]);
    } start:2.0 interval:1.0 repeats:YES async:YES];
    
    // 2.使用selector
//    self.task = [CSTimer execTask:self selector:@selector(doTask) start:2.0 interval:1.0 repeats:YES async:YES];
}

- (void)doTask {
    NSLog(@"doTask - %@", [NSThread currentThread]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [CSTimer cancelTask:self.task];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
