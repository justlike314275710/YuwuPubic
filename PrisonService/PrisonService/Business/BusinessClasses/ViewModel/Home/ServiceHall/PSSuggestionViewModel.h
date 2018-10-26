//
//  PSSuggestionViewModel.h
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBaseServiceViewModel.h"
#import "PSSuggestion.h"

@interface PSSuggestionViewModel : PSBaseServiceViewModel

@property (nonatomic, strong, readonly) NSArray *suggestions;

- (void)refreshSuggestionsCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;
- (void)loadMoreSuggestionsCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;

@end
