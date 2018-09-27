//
//  Person.m
//  MemoryManager_autorelease
//
//  Created by chenshuang on 2018/9/27.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)person_test {
    NSLog(@"person - test");
}

- (void)dealloc {
    NSLog(@"%s", __func__);

    [super dealloc];
}

@end
