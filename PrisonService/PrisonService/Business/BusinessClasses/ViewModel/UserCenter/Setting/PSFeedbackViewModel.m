//
//  PSFeedbackViewModel.m
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSFeedbackViewModel.h"
#import "PSFeedbackRequest.h"
#import "PSSessionManager.h"

@interface PSFeedbackViewModel ()

@property (nonatomic, strong) PSFeedbackRequest *feedbackRequest;

@end

@implementation PSFeedbackViewModel

- (void)checkDataWithCallback:(CheckDataCallback)callback {
    if (self.content.length == 0) {
        if (callback) {
            callback(NO,@"请输入内容");
        }
        return;
    }
    if (callback) {
        callback(YES,nil);
    }
}

- (void)sendFeedbackCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback {
    self.feedbackRequest = [PSFeedbackRequest new];
    self.feedbackRequest.content = self.content;
    self.feedbackRequest.familyId = [PSSessionManager sharedInstance].session.families.id;
    [self.feedbackRequest send:^(PSRequest *request, PSResponse *response) {
        if (completedCallback) {
            completedCallback(response);
        }
    } errorCallback:^(PSRequest *request, NSError *error) {
        if (failedCallback) {
            failedCallback(error);
        }
    }];
}

@end
