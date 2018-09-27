//
//  ViewController.m
//  MemoryManager_Tagged
//
//  Created by chenshuang on 2018/9/24.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

// 如果是iOS平台（指针的最高有效位是1，就是Tagged Pointer）
#   define _OBJC_TAG_MASK (1UL<<63)

// 如果是Mac平台（指针的最低有效位是1，就是Tagged Pointer）
#   define _OBJC_TAG_MASK 1UL


int a = 10;
int b;

@interface ViewController ()
/** name*/
@property(nonatomic,strong)NSString *name;
//@property(nonatomic,copy)NSString *name;
@end

@implementation ViewController

//- (void)setName:(NSString *)name
//{
//    if (_name != name) {
//        [_name release];
//        _name = [name retain];
//    }
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 内存管理布局
//    [self test1];
    
    // 面试题
//    [self test2];
    
    // 是否是tagger point
    [self test3];
}

- (BOOL)isTaggedPointer:(id)pointer {
    return ((uintptr_t)pointer & _OBJC_TAG_MASK) == _OBJC_TAG_MASK;
}

// 是否是tagger pointer
- (void)test3 {
    NSNumber *number1 = @4;
    NSNumber *number2 = @5;
    NSNumber *number3 = @(0xFFFFFFFFFFFFFFF);
    
    NSLog(@"%d %d %d", [self isTaggedPointer:number1], [self isTaggedPointer:number2], [self isTaggedPointer:number3]);
    NSLog(@"%p %p %p", number1, number2, number3);
}

// 面试题
- (void)test2 {
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    for (int i = 0; i < 1000; i++) {
//        dispatch_async(queue, ^{
//            // 加锁
//            self.name = [NSString stringWithFormat:@"abcdefghijk"];
//            // 解锁
//        });
//    }

//    for (int i = 0; i < 1000; i++) {
//        dispatch_async(queue, ^{
//            self.name = [NSString stringWithFormat:@"abc"];
//        });
//    }
    
    NSString *str1 = [NSString stringWithFormat:@"abc"];
    NSString *str2 = [NSString stringWithFormat:@"123abc11111111"];

    NSLog(@"%@ %@", [str1 class], [str2 class]);
    NSLog(@"%p %p", str1,str2);

}

- (void)test1 {
    static int c = 20;
    
    static int d;
    
    int e;
    int f = 20;
    
    NSString *str = @"123";
    
    NSObject *obj = [[NSObject alloc] init];
    
    NSLog(@"\n&a=%p\n&b=%p\n&c=%p\n&d=%p\n&e=%p\n&f=%p\nstr=%p\nobj=%p\n",
          &a, &b, &c, &d, &e, &f, str, obj);
}

/*
 字符串常量
 str=0x1029a4068
 
 已初始化的全局变量、静态变量
 &a =0x1029a4db8
 &c =0x1029a4dbc
 
 未初始化的全局变量、静态变量
 &d =0x1029a4e80
 &b =0x1029a4e84
 
 堆
 obj=0x60400001b510
 
 栈
 &f =0x7ffeed25a990
 &e =0x7ffeed25a994
 */


@end
