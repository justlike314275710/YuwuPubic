//
//  PSOperationQueue.m
//  Start
//
//  Created by calvin on 16/7/7.
//  Copyright © 2016年 DingSNS. All rights reserved.
//

#import "PSOperationQueue.h"

@interface PSOperationQueue ()

@property (nonatomic, strong) NSMutableArray *operationQueue;
@property (nonatomic, strong) NSMutableArray *activeQueue;
@property (nonatomic, assign) BOOL isOperationDoing;

@end

@implementation PSOperationQueue

- (id)init {
    self = [super init];
    if (self) {
        _operationQueue = [NSMutableArray array];
        _activeQueue = [NSMutableArray array];
        _maxConcurrentOperation = 1;
        _isOperationDoing = NO;
    }
    return self;
}

- (NSUInteger)currentOperationCount {
    return [_operationQueue count];
}

- (void)doOperations {
    if (_isOperationDoing) {
        return;
    }
    _isOperationDoing = YES;
    NSInteger canOperationCount = _maxConcurrentOperation == 0 ? [_operationQueue count] : _maxConcurrentOperation - [_activeQueue count];
    for (NSInteger i = 0; i < canOperationCount; i ++) {
        if (i < [_operationQueue count]) {
            id request = _operationQueue[i];
            if ([request isKindOfClass:[PSRequest class]]) {
                [_activeQueue addObject:request];
                [_operationQueue removeObject:request];
                [(PSRequest *)request send:^(PSRequest *request, PSResponse *response) {
                    if (self.callback) {
                        self.callback(request,response,nil);
                    }
                    
                    [_activeQueue removeObject:request];
                    [self doOperations];
                } errorCallback:^(PSRequest *request, NSError *error) {
                    if (self.callback) {
                        self.callback(request,nil,error);
                    }
                    [_activeQueue removeObject:request];
                    [self doOperations];
                }];
            }else {
                [_operationQueue removeObject:request];
            }
        }
    }
    _isOperationDoing = NO;
}

- (void)addOperation:(PSRequest *)operation {
    [_operationQueue addObject:operation];
    [self doOperations];
}

- (void)cancelAllOperations {
    for (PSRequest *request in _operationQueue) {
        [request cancelRequest];
        [_operationQueue removeObject:request];
    }
    [_activeQueue removeAllObjects];
}

- (void)dealloc {
    
}

@end
