//
//  PSRefundViewModel.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/6/4.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSRefundViewModel.h"
#import "PSRefundBalanceRequest.h"
#import "PSRefundBalanceRespense.h"
#import "PSCache.h"
#import "PSSessionManager.h"
#import "PSBusinessConstants.h"
@interface PSRefundViewModel()
@property(nonatomic ,strong) PSRefundBalanceRequest*refundBalanceRequest;
@end
@implementation PSRefundViewModel


- (void)requestRefundCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback{
    PSPrisonerDetail *prisonerDetail = nil;
    NSInteger index = [PSSessionManager sharedInstance].selectedPrisonerIndex;
    NSArray *details = [PSSessionManager sharedInstance].passedPrisonerDetails;
    if (index >= 0 && index < details.count) {
        prisonerDetail = details[index];
    }
    self.refundBalanceRequest=[PSRefundBalanceRequest new];
    self.refundBalanceRequest.jailId=prisonerDetail.jailId;
    self.session = [PSCache queryCache:AppUserSessionCacheKey];
    self.refundBalanceRequest.familyId=self.session.families.id;
    
    [self.refundBalanceRequest send:^(PSRequest *request, PSResponse *response) {
        PSRefundBalanceRespense*refundBalanceRespense=( PSRefundBalanceRespense *)response;
        self.msgData=refundBalanceRespense.data;
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
