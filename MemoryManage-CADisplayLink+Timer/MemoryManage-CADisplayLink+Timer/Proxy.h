//
//  Proxy.h
//  MemoryManage-CADisplayLink+Timer
//
//  Created by chenshuang on 2018/9/24.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Proxy : NSObject
+ (instancetype)proxyWithTarget:(id)target;
@property (weak, nonatomic) id target;
@end
