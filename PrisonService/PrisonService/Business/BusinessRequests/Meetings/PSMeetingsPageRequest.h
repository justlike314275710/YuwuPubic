//
//  PSMeetingsPageRequest.h
//  PrisonService
//
//  Created by calvin on 2018/4/20.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSMeetingsBaseRequest.h"
#import "PSMeetingsPageResponse.h"

@interface PSMeetingsPageRequest : PSMeetingsBaseRequest

@property (nonatomic, assign) NSInteger rows;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *prisonerId;
@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) NSString *ym;
@property (nonatomic, strong) NSString *ymd;

@end
