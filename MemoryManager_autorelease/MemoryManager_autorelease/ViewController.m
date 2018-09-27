//
//  ViewController.m
//  MemoryManager_autorelease
//
//  Created by chenshuang on 2018/9/27.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

extern void _objc_autoreleasePoolPrint(void);

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 这个Person什么时候调用release，是由RunLoop来控制的
    // 它可能是在某次RunLoop循环中，RunLoop休眠之前调用了release
    //    Person *person = [[[Person alloc] init] autorelease];
    
    Person *person = [[Person alloc] init];
    NSLog(@"%s", __func__);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"%s", __func__);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"%s", __func__);
}

/*
 typedef CF_OPTIONS(CFOptionFlags, CFRunLoopActivity) {
 kCFRunLoopEntry = (1UL << 0),  1
 kCFRunLoopBeforeTimers = (1UL << 1), 2
 kCFRunLoopBeforeSources = (1UL << 2), 4
 kCFRunLoopBeforeWaiting = (1UL << 5), 32
 kCFRunLoopAfterWaiting = (1UL << 6), 64
 kCFRunLoopExit = (1UL << 7), 128
 kCFRunLoopAllActivities = 0x0FFFFFFFU
 };
 */

/*
 kCFRunLoopEntry  push
 
 <CFRunLoopObserver 0x60000013f220 [0x1031c8c80]>{valid = Yes, activities = 0x1, repeats = Yes, order = -2147483647, callout = _wrapRunLoopWithAutoreleasePoolHandler (0x103376df2), context = <CFArray 0x60000025aa00 [0x1031c8c80]>{type = mutable-small, count = 1, values = (\n\t0 : <0x7fd0bf802048>\n)}}
 
 
 kCFRunLoopBeforeWaiting | kCFRunLoopExit
 kCFRunLoopBeforeWaiting pop、push
 kCFRunLoopExit pop
 
 <CFRunLoopObserver 0x60000013f0e0 [0x1031c8c80]>{valid = Yes, activities = 0xa0, repeats = Yes, order = 2147483647, callout = _wrapRunLoopWithAutoreleasePoolHandler (0x103376df2), context = <CFArray 0x60000025aa00 [0x1031c8c80]>{type = mutable-small, count = 1, values = (\n\t0 : <0x7fd0bf802048>\n)}}
 */


@end
