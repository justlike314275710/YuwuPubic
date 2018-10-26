//
// Created by William Zhao on 13-11-13.
// Copyright (c) 2013 Vipshop Holdings Limited. All rights reserved.
//


#import <Foundation/Foundation.h>


#define _TenthSecond    0.1
#define _OneSecond      1.0

@interface PSObserverVector : NSObject

-(BOOL)addObserver:(id)observer;

-(BOOL)removeObserver:(id)observer;

-(BOOL)isExistObserver:(id)observer;

-(void)clearAllObserver;

-(void)notifyObserver:(SEL)selector;

-(void)notifyObserver:(SEL)selector object:(id)object;

- (void)notifyObserver:(SEL)selector objects:(id)object1, ...;

@end
