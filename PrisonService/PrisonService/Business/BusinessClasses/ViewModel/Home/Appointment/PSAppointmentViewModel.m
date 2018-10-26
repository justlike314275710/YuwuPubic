//
//  PSAppointmentViewModel.m
//  PrisonService
//
//  Created by calvin on 2018/4/21.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSAppointmentViewModel.h"
#import "PSMeetingsPageRequest.h"
#import "PSSessionManager.h"
#import "NSDate+Components.h"
#import "NSString+Date.h"
#import "PSMeetingAddRequest.h"

//#define meetingObjectsKey @"meetingObjectsKey"
//#define meetingTimesKey @"meetingTimesKey"
//#define meetingFinishedKey @"meetingFinishedKey"


static const NSString *meetingObjectsKey=@"meetingObjectsKey";
static const NSString *meetingTimesKey=@"meetingTimesKey";
static const NSString *meetingFinishedKey=@"meetingFinishedKey";

@interface PSAppointmentViewModel ()

@property (nonatomic, strong) PSMeetingsPageRequest *meetingsRequest;
@property (nonatomic, strong) NSMutableDictionary *meetingsData;
@property (nonatomic, strong) PSMeetingAddRequest *meetingAddRequest;

@end

@implementation PSAppointmentViewModel
- (id)init {
    self = [super init];
    if (self) {
        _meetingsData = [NSMutableDictionary dictionary];
    }
    return self;
}

- (PSMeeting *)meetingOfDate:(NSDate *)date {
    NSString *key1 = [date yearMonth];
    NSString *key2 = [date yearMonthDay];
    PSMeeting *meeting = nil;
    if (key1 && key2) {
        meeting = self.meetingsData[key1][meetingObjectsKey][key2];
    }
    return meeting;
}

- (PSMeeting *)latestFinishedMeetingOfDate:(NSDate *)date {
    NSString *key1 = [date yearMonth];
    return self.meetingsData[key1][meetingFinishedKey];
}

- (NSInteger)passedMeetingTimesOfDate:(NSDate *)date {
    NSString *key1 = [date yearMonth];
    NSInteger times = [self.meetingsData[key1][meetingTimesKey] integerValue];
    return times;
}


- (NSDictionary *)handleMeetings:(NSArray *)meetings  {
    NSMutableDictionary *bData = [NSMutableDictionary dictionary];
    NSMutableDictionary *mData = [NSMutableDictionary dictionary];
    [meetings enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(PSMeeting *meeting, NSUInteger idx, BOOL * _Nonnull stop) {

        NSInteger times = 0;
        PSMeeting *finishedMeeting = nil;
        NSDate *date = meeting.meetingDate ? meeting.meetingDate : [meeting.applicationDate stringToDateWithFormat:@"yyyy-MM-dd"];
        NSString *key = [date yearMonthDay];
       
        mData[key] = meeting;
        if ([meeting.status isEqualToString:@"PASSED"]) {
            times += 1;
        }
        else if ([meeting.status isEqualToString:@"FINISHED"]) {
            if (finishedMeeting) {
                if ([meeting.meetingDate compare:finishedMeeting.meetingDate] == NSOrderedAscending) {
                    finishedMeeting = meeting;
                }
            }else{
                finishedMeeting = meeting;
            }
        }

        bData[meetingObjectsKey] = mData;
        bData[meetingTimesKey] = @(times);
        bData[meetingFinishedKey] = finishedMeeting;

    }];

    return bData;
}

- (void)updateMeetingsOfYearMonth:(NSString *)yearMonth {
    if (yearMonth.length > 0) {
        NSDictionary *bData = self.meetingsData[yearMonth];
        self.meetingsData[yearMonth] = [self handleMeetings:[bData[meetingObjectsKey] allValues]];
    }
}

- (void)requestMeetingsOfYearMonth:(NSString *)yearMonth force:(BOOL)force completed:(RequestDataTaskCompleted)completedCallback {
    if (yearMonth) {
        NSArray *meetings = self.meetingsData[yearMonth][meetingObjectsKey];
        if (meetings && !force) {
            if (completedCallback) {
                completedCallback(meetings);
            }
        }else{
            PSUserSession *session = [PSSessionManager sharedInstance].session;
            self.meetingsRequest = [PSMeetingsPageRequest new];
            self.meetingsRequest.ym = yearMonth;
            self.meetingsRequest.page = 1;
            self.meetingsRequest.rows = 100;
            self.meetingsRequest.name = session.families.name;
            self.meetingsRequest.uuid = session.families.uuid;
            self.meetingsRequest.prisonerId = self.prisonerDetail.prisonerId;
            @weakify(self)
            [self.meetingsRequest send:^(PSRequest *request, PSResponse *response) {
                @strongify(self)
                if (response.code == 200) {
                    PSMeetingsPageResponse *meetingsResponse = (PSMeetingsPageResponse *)response;
                    NSDictionary *bData = [self handleMeetings:meetingsResponse.meetings];
                    self.meetingsData[yearMonth] = bData;
                    if (completedCallback) {
                        completedCallback(bData[meetingObjectsKey]);
                    }
                }else{
                    if (completedCallback) {
                        completedCallback(nil);
                    }
                }
            } errorCallback:^(PSRequest *request, NSError *error) {
                if (completedCallback) {
                    completedCallback(nil);
                }
            }];
        }
    }else{
        if (completedCallback) {
            completedCallback(nil);
        }
    }
}

- (void)addMeetingWithDate:(NSDate *)date completed:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback {
   // PSUserSession *session = [PSSessionManager sharedInstance].session;
    self.meetingAddRequest = [[PSMeetingAddRequest alloc] init];
    self.meetingAddRequest.familyId = self.familyId;
    self.meetingAddRequest.applicationDate = self.applicationDate;
    self.meetingAddRequest.prisonerId = self.prisonerId;
    self.meetingAddRequest.charge = self.charge;
    self.meetingAddRequest.jailId = self.prisonerDetail.jailId;
    self.meetingAddRequest.meetingMembers=self.meetingMembers;
    [self.meetingAddRequest send:^(PSRequest *request, PSResponse *response) {
        if (completedCallback) {
            completedCallback(response);
        }

    } errorCallback:^(PSRequest *request, NSError *error) {
        if (failedCallback) {
            failedCallback(error);
        }
    }];
}

@end
