//
//  PSWriteSuggestionViewModel.h
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBaseServiceViewModel.h"

@interface PSWriteSuggestionViewModel : PSBaseServiceViewModel

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *contents;

- (void)sendSuggestionCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;

@end
