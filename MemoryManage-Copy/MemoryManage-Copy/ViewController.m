//
//  ViewController.m
//  MemoryManage-Copy
//
//  Created by chenshuang on 2018/9/25.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // copy属性
    [self test1];
}

// 下面方法会奔溃 - 因为data是copy属性,执行set方法后会变成不可变对象
- (void)test1 {
    Person *p = [[Person alloc] init];
    
    // 会奔溃
    p.data = [NSMutableArray array];
    [p.data addObject:@"jack"];
    [p.data addObject:@"rose"];
    NSLog(@"end");
}

@end
