//
//  PSBindPrisonerViewModel.m
//  PrisonService
//
//  Created by calvin on 2018/4/24.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBindPrisonerViewModel.h"
#import "PSBindPrisonerRequest.h"
#import "PSSessionManager.h"
#import "PSUploadAvatarRequest.h"
#import "PSUploadAvatarResponse.h"
@interface PSBindPrisonerViewModel ()

@property (nonatomic, strong) PSBindPrisonerRequest *bindRequest;
@property (nonatomic, strong) PSUploadAvatarRequest *uploadAvatarRequest;
@end

@implementation PSBindPrisonerViewModel

- (void)bindPrisonerCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback {
    self.bindRequest = [PSBindPrisonerRequest new];
    self.bindRequest.jailId = self.selectedJail.id;
    self.bindRequest.prisonerNumber = self.prisonerNumber;
    self.bindRequest.familyId = [PSSessionManager sharedInstance].session.families.id;
    self.bindRequest.relationship = self.relationShip;
    self.bindRequest.relationalProofUrl=self.relationalProofUrl;
    [self.bindRequest send:^(PSRequest *request, PSResponse *response) {
        if (completedCallback) {
            completedCallback(response);
        }
    } errorCallback:^(PSRequest *request, NSError *error) {
        if (failedCallback) {
            failedCallback(error);
        }
    }];
}

- (void)checkBindDataWithCallback:(CheckDataCallback)callback {
    if (self.prisonerNumber.length == 0) {
        if (callback) {
            NSString*enter_PrisonerNumber=NSLocalizedString(@"enter_PrisonerNumber", @"请输入囚号");
            callback(NO,enter_PrisonerNumber);
        }
        return;
    }
    if (self.relationShip.length == 0) {
        if (callback) {
            NSString*enter_Relationship=NSLocalizedString(@"enter_Relationship", @"请输入与服刑人员关系");
            callback(NO,enter_Relationship);
        }
        return;
    }
    if (!self.selectedJail) {
        if (callback) {
            NSString*enter_jail=NSLocalizedString(@"enter_jail", @"请选择服刑人员所在监狱");
            callback(NO,enter_jail);
        }
        return;
    }
    if (callback) {
        callback(YES,nil);
    }
}


- (void)uploadRelationCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback {
    //self.avatarUrl = nil;
    self.uploadAvatarRequest = [PSUploadAvatarRequest new];
    self.uploadAvatarRequest.avatarData = UIImageJPEGRepresentation(self.relationImage, 0.3);
    @weakify(self)
    [self.uploadAvatarRequest send:^(PSRequest *request, PSResponse *response) {
        @strongify(self)
        PSUploadAvatarResponse *avatarResponse = (PSUploadAvatarResponse *)response;
        self.relationalProofUrl = avatarResponse.url;
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
