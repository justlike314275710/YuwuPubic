//
//  PSLocalMeetingViewModel.h
//  PrisonService
//
//  Created by calvin on 2018/5/15.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBasePrisonerViewModel.h"
#import "PSLocalMeeting.h"
#import "YYText.h"

@interface PSLocalMeetingViewModel : PSBasePrisonerViewModel

@property (nonatomic, strong, readonly) NSArray *introduceTexts;
@property (nonatomic, strong, readonly) PSLocalMeeting *localMeeting;
@property (nonatomic, strong, readonly) NSAttributedString *routeString;
@property (nonatomic, strong, readonly) YYTextLayout *routeTextLayout;
@property (nonatomic, strong) NSDate *appointDate;
@property (nonatomic, strong) NSString *cancelReason;

- (void)requestLocalMeetingDetailCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;
- (void)addLocalMeetingDetailCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;
- (void)cancelLocalMeetingDetailCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;

- (void)requestPreLocalMeetingDetailCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback;

@end
