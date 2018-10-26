//
//  PSLocalMeetingDetailResponse.h
//  PrisonService
//
//  Created by calvin on 2018/5/17.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSLocalMeeting.h"

@interface PSLocalMeetingDetailResponse : PSResponse

@property (nonatomic, strong) PSLocalMeeting<Optional> *visits;

@end
