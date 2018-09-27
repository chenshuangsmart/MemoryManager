//
//  main.m
//  MemoryManager_autorelease1
//
//  Created by chenshuang on 2018/9/27.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

extern void _objc_autoreleasePoolPrint(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool { //  r1 = push()
        
        Person *p1 = [[[Person alloc] init] autorelease];
        Person *p2 = [[[Person alloc] init] autorelease];
        
        @autoreleasepool { // r2 = push()
            for (int i = 0; i < 5; i++) {
                Person *p3 = [[[Person alloc] init] autorelease];
            }
            
            @autoreleasepool { // r3 = push()
                Person *p4 = [[[Person alloc] init] autorelease];
                _objc_autoreleasePoolPrint();
            } // pop(r3)
        } // pop(r2)
    } // pop(r1)
    return 0;
}

/*
 struct __AtAutoreleasePool {
 __AtAutoreleasePool() { // 构造函数，在创建结构体的时候调用
 atautoreleasepoolobj = objc_autoreleasePoolPush();
 }
 
 ~__AtAutoreleasePool() { // 析构函数，在结构体销毁的时候调用
 objc_autoreleasePoolPop(atautoreleasepoolobj);
 }
 
 void * atautoreleasepoolobj;
 };
 
 {
 __AtAutoreleasePool __autoreleasepool;
 Person *person = ((Person *(*)(id, SEL))(void *)objc_msgSend)((id)((Person *(*)(id, SEL))(void *)objc_msgSend)((id)((Person *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("Person"), sel_registerName("alloc")), sel_registerName("init")), sel_registerName("autorelease"));
 }
 
 
 atautoreleasepoolobj = objc_autoreleasePoolPush();
 
 Person *person = [[[Person alloc] init] autorelease];
 
 objc_autoreleasePoolPop(atautoreleasepoolobj);
 */

