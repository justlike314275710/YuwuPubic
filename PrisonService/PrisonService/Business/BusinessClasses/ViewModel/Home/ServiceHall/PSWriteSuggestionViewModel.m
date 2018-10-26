//
//  PSWriteSuggestionViewModel.m
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSWriteSuggestionViewModel.h"
#import "PSWriteSuggestionRequest.h"
#import "PSSessionManager.h"

@interface PSWriteSuggestionViewModel ()

@property (nonatomic, strong) PSWriteSuggestionRequest *writeSuggestionRequest;

@end

@implementation PSWriteSuggestionViewModel

- (void)checkDataWithCallback:(CheckDataCallback)callback {
    if (self.title.length == 0) {
        if (callback) {
            callback(NO,@"请输入标题");
        }
        return;
    }
    if (self.contents.length == 0) {
        if (callback) {
            callback(NO,@"请输入内容");
        }
        return;
    }
    if (callback) {
        callback(YES,nil);
    }
}

- (void)sendSuggestionCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback {
    self.writeSuggestionRequest = [PSWriteSuggestionRequest new];
    self.writeSuggestionRequest.title = self.title;
    self.writeSuggestionRequest.contents = self.contents;
    self.writeSuggestionRequest.jailId = self.prisonerDetail.jailId;
    self.writeSuggestionRequest.familyId = [PSSessionManager sharedInstance].session.families.id;
    [self.writeSuggestionRequest send:^(PSRequest *request, PSResponse *response) {
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
