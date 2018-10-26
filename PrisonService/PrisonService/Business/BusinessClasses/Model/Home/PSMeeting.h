//
//  PSMeeting.h
//  PrisonService
//
//  Created by calvin on 2018/4/20.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "JSONModel.h"

@protocol PSMeeting<NSObject>

@end

@interface PSMeeting : JSONModel

@property (nonatomic, strong) NSString<Optional> *id;
@property (nonatomic, strong) NSString<Optional> *applicationDate;
@property (nonatomic, strong) NSString<Optional> *status;
@property (nonatomic, strong) NSString<Optional> *meetingTime;
@property (nonatomic, strong) NSDate<Ignore> *meetingDate;
@property (nonatomic, strong) NSString<Ignore> *meetingPeriod;

@end
