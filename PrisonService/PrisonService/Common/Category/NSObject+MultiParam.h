//
//  NSObject+MultiParam.h
//  Common
//
//  Created by calvin on 15/11/17.
//  Copyright © 2015年 calvin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MultiParam)

- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr waitUntilDone:(BOOL)wait withObjects:(id)object1, ...;
- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObjects:(NSArray *)objects waitUntilDone:(BOOL)wait;

@end
