//
//  PSGuideManager.m
//  PrisonService
//
//  Created by calvin on 2018/4/28.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSGuideManager.h"
#import "PSGuideViewController.h"

#define DID_GUIDE_KEY @"DID_GUIDE_KEY"

@implementation PSGuideManager

+ (PSGuideManager *)sharedInstance {
    static PSGuideManager *manager = nil;
    static dispatch_once_t oncetoken;
    dispatch_once(&oncetoken,^{
        if (!manager) {
            manager = [[self alloc] init];
        }
    });
    return manager;
}

- (void)guideAction:(LaunchTaskCompletion)completion {
    BOOL didGuide = [[[NSUserDefaults standardUserDefaults] objectForKey:DID_GUIDE_KEY] boolValue];
    if (didGuide) {
        if (completion) {
            completion(YES);
        }
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:@(YES) forKey:DID_GUIDE_KEY];
        [[NSUserDefaults standardUserDefaults] synchronize];
        PSGuideViewController *guideViewController = [PSGuideViewController new];
        NSString*guideOne=NSLocalizedString(@"guideOne", @"guideOne");
        NSString*guideTwo=NSLocalizedString(@"guideTwo", @"guideTwo");
        NSString*guideThree=NSLocalizedString(@"guideThree", @"guideThree");
        [guideViewController setNamesGroup:^NSArray *{
            return @[guideOne,guideTwo,guideThree];
        }];
        [guideViewController setCompleted:^{
            if (completion) {
                completion(YES);
            }
        }];
        [UIApplication sharedApplication].keyWindow.rootViewController = guideViewController;
    }
}

#pragma mark - PSLaunchTask
- (void)launchTaskWithCompletion:(LaunchTaskCompletion)completion {
    [self guideAction:^(BOOL completed) {
        if (completion) {
            completion(YES);
        }
    }];
}

@end
