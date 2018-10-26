//
//  PSMeetingViewModel.m
//  PrisonService
//
//  Created by calvin on 2018/4/25.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSMeetingViewModel.h"
#import "PSMeetingMembersResponse.h"
#import "PSMeetingMembersRequest.h"
#import "PSPrisonerFamily.h"
#import "PSSessionManager.h"

@interface PSMeetingViewModel()
@property (nonatomic , strong) PSMeetingMembersRequest *meetingMembersRequest;
@property (nonatomic , strong) NSMutableArray *items;

@end


@implementation PSMeetingViewModel

- (NSArray *)FamilyMembers{
    return _items;
}

- (void)requestFamilyMembersCompleted:(RequestDataCompleted)completedCallback failed:(RequestDataFailed)failedCallback{
    self.meetingMembersRequest=[PSMeetingMembersRequest new];
    self.meetingMembersRequest.meetingId=self.familymeetingID;
    [self.meetingMembersRequest send:^(PSRequest *request, PSResponse *response) {
        if (response.code==200) {
    PSMeetingMembersResponse*meetingMembersResponse=(PSMeetingMembersResponse*)response;
            self.items = [NSMutableArray new];
            [self.items addObjectsFromArray:meetingMembersResponse.meetingMembers];
            for (int i=0; i<self.items.count; i++) {
                PSPrisonerFamily*familesModel=self.items[i];
                if ([familesModel.familyName isEqualToString:[PSSessionManager sharedInstance].session.families.name]) {
                    [self.items exchangeObjectAtIndex:0 withObjectAtIndex:i];
                }
            }
            
        }
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
