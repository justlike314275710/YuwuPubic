//
//  PSRingMeetingViewController.h
//  PrisonService
//
//  Created by calvin on 2018/4/25.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBusinessViewController.h"
#import "PSMeetingViewModel.h"

typedef NS_ENUM(NSInteger, PSMeetingOperation) {
    PSMeetingRefuse,
    PSMeetingAccept
};

typedef void(^MeetingOperation)(PSMeetingOperation operation);

@interface PSRingMeetingViewController : PSBusinessViewController

@property (nonatomic, copy) MeetingOperation userOperation;

@end
