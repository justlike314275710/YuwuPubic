//
//  PSCancelLocalMeetingRequest.h
//  PrisonService
//
//  Created by calvin on 2018/5/17.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBaseLocalMeetingRequest.h"
#import "PSCancelLocalMeetingResponse.h"

@interface PSCancelLocalMeetingRequest : PSBaseLocalMeetingRequest

@property (nonatomic, strong) NSString *meetingID;
@property (nonatomic, strong) NSString *cause;

@end
