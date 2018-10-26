//
//  PSMeetingsPageResponse.h
//  PrisonService
//
//  Created by calvin on 2018/4/20.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSResponse.h"
#import "PSMeeting.h"

@interface PSMeetingsPageResponse : PSResponse

//@property (nonatomic, strong) NSArray<PSMeeting> *meetings;


@property (nonatomic, strong) NSMutableArray<PSMeeting> *meetings;
@end
