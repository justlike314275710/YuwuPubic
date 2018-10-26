//
//  PSSuggestionViewModel.m
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSSuggestionViewModel.h"
#import "PSMailBoxesRequest.h"
#import "PSSessionManager.h"

@interface PSSuggestionViewModel ()

@property (nonatomic, strong) PSMailBoxesRequest *mailBoxesRequest;
@property (nonatomic, strong) NSMutableArray *suggestionsArray;

@end

@implementation PSSuggestionViewModel
@synthesize dataStatus = _dataStatus;
- (NSArray *)suggestions {
    return _suggestionsArray;
}

- (void)refreshSuggestionsCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback {
    self.page = 1;
    self.suggestionsArray = nil;
    self.hasNextPage = NO;
    self.dataStatus = PSDataInitial;
    [self requestSuggestionsCompleted:completedCallback failed:failedCallback];
}

- (void)loadMoreSuggestionsCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback {
    self.page ++;
    [self requestSuggestionsCompleted:completedCallback failed:failedCallback];
}

- (void)requestSuggestionsCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback {
    self.mailBoxesRequest = [PSMailBoxesRequest new];
    self.mailBoxesRequest.page = self.page;
    self.mailBoxesRequest.rows = self.pageSize;
    self.mailBoxesRequest.jailId = self.prisonerDetail.jailId;
    self.mailBoxesRequest.familyId = [PSSessionManager sharedInstance].session.families.id;
    @weakify(self)
    [self.mailBoxesRequest send:^(PSRequest *request, PSResponse *response) {
        @strongify(self)
        if (response.code == 200) {
            PSMailBoxesResponse *suggestionsResponse = (PSMailBoxesResponse *)response;
            if (self.page == 1) {
                self.suggestionsArray = [NSMutableArray array];
            }
            if (suggestionsResponse.mailBoxes.count == 0) {
                self.dataStatus = PSDataEmpty;
            }else{
                self.dataStatus = PSDataNormal;
            }
            self.hasNextPage = suggestionsResponse.mailBoxes.count >= self.pageSize;
            [self.suggestionsArray addObjectsFromArray:suggestionsResponse.mailBoxes];
        }else{
            if (self.page > 1) {
                self.page --;
                self.hasNextPage = YES;
            }else{
                self.dataStatus = PSDataError;
            }
        }
        if (completedCallback) {
            completedCallback(response);
        }
    } errorCallback:^(PSRequest *request, NSError *error) {
        @strongify(self)
        if (self.page > 1) {
            self.page --;
            self.hasNextPage = YES;
        }else{
            self.dataStatus = PSDataError;
        }
        if (failedCallback) {
            failedCallback(error);
        }
    }];
}

@end
