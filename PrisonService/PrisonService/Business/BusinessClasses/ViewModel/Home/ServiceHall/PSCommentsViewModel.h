//
//  PSCommentsViewModel.h
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSViewModel.h"
#import "PSSuggestion.h"
#import "PSComment.h"

@interface PSCommentsViewModel : PSViewModel

@property (nonatomic, strong, readonly) PSSuggestion *suggestion;
@property (nonatomic, strong, readonly) NSArray *comments;

- (instancetype)initWithSuggestion:(PSSuggestion *)suggestion;
- (void)requestCommentsCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;

@end
