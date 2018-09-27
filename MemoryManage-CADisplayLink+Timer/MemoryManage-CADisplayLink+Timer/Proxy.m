//
//  Proxy.m
//  MemoryManage-CADisplayLink+Timer
//
//  Created by chenshuang on 2018/9/24.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "Proxy.h"

@implementation Proxy
+ (instancetype)proxyWithTarget:(id)target {
    Proxy *proxy = [[Proxy alloc] init];
    proxy.target = target;
    return proxy;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self.target;
}

@end
