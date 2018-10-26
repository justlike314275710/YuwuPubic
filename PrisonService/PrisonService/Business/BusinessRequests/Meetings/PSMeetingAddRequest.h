//
//  PSMeetingAddRequest.h
//  PrisonService
//
//  Created by calvin on 2018/4/20.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSMeetingsBaseRequest.h"
#import "PSMeetingAddResponse.h"

@interface PSMeetingAddRequest : PSMeetingsBaseRequest

@property (nonatomic, strong) NSString *familyId;
@property (nonatomic, strong) NSString *applicationDate;
@property (nonatomic, strong) NSString *prisonerId;
@property (nonatomic, strong) NSString *charge;
@property (nonatomic, strong) NSString *jailId;
@property (nonatomic , strong) NSArray *meetingMembers;

@end
