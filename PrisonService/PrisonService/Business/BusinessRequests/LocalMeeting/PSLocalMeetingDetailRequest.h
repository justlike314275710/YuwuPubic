//
//  PSLocalMeetingDetailRequest.h
//  PrisonService
//
//  Created by calvin on 2018/5/17.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBaseLocalMeetingRequest.h"
#import "PSLocalMeetingDetailResponse.h"

@interface PSLocalMeetingDetailRequest : PSBaseLocalMeetingRequest

@property (nonatomic, strong) NSString *familyId;
@property (nonatomic, strong) NSString *prisonerId;

@end
