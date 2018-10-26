//
//  PSMeetingMembersResponse.h
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/9/18.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSPrisonerFamily.h"
@interface PSMeetingMembersResponse : PSResponse
@property (nonatomic , strong) NSArray<PSPrisonerFamily,Optional> *meetingMembers;
@end
