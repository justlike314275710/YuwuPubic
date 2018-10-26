//
//  PSWriteComplaintViewController.h
//  PrisonService
//
//  Created by calvin on 2018/4/16.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBusinessViewController.h"
#import "PSWriteSuggestionViewModel.h"

typedef void(^SendSuggestionCompleted)();

@interface PSWriteComplaintViewController : PSBusinessViewController

@property (nonatomic, copy) SendSuggestionCompleted sendCompleted;

@end
