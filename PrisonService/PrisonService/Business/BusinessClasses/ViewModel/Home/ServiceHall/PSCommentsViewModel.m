//
//  PSCommentsViewModel.m
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSCommentsViewModel.h"
#import "PSCommentsRequest.h"

@interface PSCommentsViewModel ()

@property (nonatomic, strong) PSCommentsRequest *commentsRequest;

@end

@implementation PSCommentsViewModel
- (instancetype)initWithSuggestion:(PSSuggestion *)suggestion {
    self = [super init];
    if (self) {
        _suggestion = suggestion;
    }
    return self;
}

- (void)setComments:(NSArray *)comments {
    _comments = comments;
}

- (void)requestCommentsCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback {
    self.commentsRequest = [PSCommentsRequest new];
    self.commentsRequest.suggestionID = self.suggestion.id;
    @weakify(self)
    [self.commentsRequest send:^(PSRequest *request, PSResponse *response) {
        @strongify(self)
        if (response.code == 200) {
            PSCommentsResponse *commentsResponse = (PSCommentsResponse *)response;
            self.comments = commentsResponse.comments;
        }
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
