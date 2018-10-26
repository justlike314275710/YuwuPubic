//
//  PSOperationQueue.h
//  Start
//
//  Created by calvin on 16/7/7.
//  Copyright © 2016年 DingSNS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSRequest.h"
#import "PSResponse.h"

typedef void (^OperationFinished)(PSRequest *request, PSResponse *response, NSError *error);

@interface PSOperationQueue : NSObject

/**
 *  最大请求开始数，默认为1
 */
@property (assign, nonatomic) NSInteger maxConcurrentOperation;
@property (readonly, nonatomic) NSUInteger currentOperationCount;
@property (nonatomic, copy) OperationFinished callback;

- (void)addOperation:(PSRequest *)operation;

@end
