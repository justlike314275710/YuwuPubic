//
// Created by William Zhao on 13-11-13.
// Copyright (c) 2013 Vipshop Holdings Limited. All rights reserved.
//


#import "PSObserverVector.h"
#import "NSObject+MultiParam.h"

@interface PSObserver : NSObject

@property (nonatomic, weak) id observer;

@end

@implementation PSObserver

@end

@interface PSObserverVector ()

@property(nonatomic, strong) NSMutableArray *vector;

@end

@implementation PSObserverVector
- (id)init {
    self = [super init];
    if(self){
        _vector = [NSMutableArray array];
    }
    return self;
}

- (void)dealloc {
    
}

- (BOOL)addObserver:(id)observer {
    PSObserver *myObserver = [PSObserver new];
    myObserver.observer = observer;
    [self.vector addObject:myObserver];
    return YES;
}

- (BOOL)removeObserver:(id)observer {
    BOOL result = NO;
    NSMutableArray *copyVector = [NSMutableArray arrayWithArray:self.vector];
    for (PSObserver *myObserver in copyVector) {
        if (myObserver.observer) {
            if (myObserver.observer == observer) {
                result = YES;
                [self.vector removeObject:myObserver];
            }
        }else{
            [self.vector removeObject:myObserver];
        }
    }
    return result;
}

- (BOOL)isExistObserver:(id)observer {
    BOOL result = NO;
    for (PSObserver *myObserver in self.vector) {
        if (myObserver.observer == observer) {
            result = YES;
            break;
        }
    }
    return result;
}

- (void)clearAllObserver{
    [self.vector removeAllObjects];
}


- (void)notifyObserver:(SEL)selector {
    [self notifyObserver:selector object:nil];
}

- (void)notifyObserver:(SEL)selector object:(id)object {
    for (PSObserver *myObserver in self.vector) {
        if ([myObserver.observer respondsToSelector:selector]) {
            [myObserver.observer performSelector:selector onThread:[NSThread currentThread] withObject:object waitUntilDone:YES];
        }
    }
}

- (void)notifyObserver:(SEL)selector objects:(id)object1, ... {
    NSMutableArray *objects = [NSMutableArray arrayWithObjects:object1, nil];
    va_list otherObjects;
    id anotherObject;
    if (object1) {
        va_start(otherObjects, object1);
        while ((anotherObject = va_arg(otherObjects, id))) {
            [objects addObject:anotherObject];
        }
    }
    va_end(otherObjects);
    for (PSObserver *myObserver in self.vector) {
        if ([myObserver.observer respondsToSelector:selector]) {
            [myObserver.observer performSelector:selector onThread:[NSThread currentThread] withObjects:objects waitUntilDone:YES];
        }
    }
}

@end
