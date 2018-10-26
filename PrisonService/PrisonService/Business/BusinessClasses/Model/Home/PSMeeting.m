//
//  PSMeeting.m
//  PrisonService
//
//  Created by calvin on 2018/4/20.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSMeeting.h"

@implementation PSMeeting

- (void)setMeetingTime:(NSString<Optional> *)meetingTime {
    _meetingTime = meetingTime;
    NSString *seperate = @"-";
    NSRange range = [meetingTime rangeOfString:seperate options:NSBackwardsSearch];
    if (range.length == seperate.length) {
        NSString *dateString = [meetingTime substringToIndex:range.location];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd H:mm"];
        _meetingDate = [formatter dateFromString:dateString];
    }
    NSInteger length = meetingTime.length;
    NSInteger cutLength = 11;
    if (length > cutLength) {
        _meetingPeriod = [meetingTime substringFromIndex:cutLength];
    }
}

@end
