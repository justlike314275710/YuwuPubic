//
//  PSPrisonsManager.m
//  PrisonService
//
//  Created by calvin on 2018/4/3.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSVisitorManager.h"
#import "PSVisitorHandler.h"
#import "PSCache.h"
#import "PSContentManager.h"
#import "PSDefaultJailRequest.h"
#import "PSDefaultJailResponse.h"
#define VisitorSelectPrisonCacheKey @"VisitorSelectPrisonCacheKey"

typedef void(^VisitorSelectedFinished)(void);

@interface PSVisitorManager ()

@property (nonatomic, strong) id<PSVisitorHandler> handler;
@property (nonatomic, strong) PSDefaultJailRequest*jailRequest;

@end

@implementation PSVisitorManager

+ (PSVisitorManager *)sharedInstance {
    static PSVisitorManager *visitorManager = nil;
    static dispatch_once_t oncetoken;
    dispatch_once(&oncetoken, ^{
        if (!visitorManager) {
            visitorManager = [[PSVisitorManager alloc] init];
        }
    });
    return visitorManager;
}
/*
- (id)init {
    self = [super init];
    if (self) {
        self.visitorJail = [PSCache queryCache:VisitorSelectPrisonCacheKey];
    }
    return self;
}

- (void)visitorSelectJail:(VisitorSelectedFinished)finished {
    if (self.visitorJail) {
        if (finished) {
            finished();
        }
    }else{
        
        UIViewController *rootViewController = [PSContentManager sharedInstance].rootViewController;
        if ([rootViewController conformsToProtocol:@protocol(PSVisitorHandler)]) {
            self.handler = (id<PSVisitorHandler>)rootViewController;
            [self.handler initialize];
            @weakify(self)
            [self.handler setCallback:^(PSJail *selectedJail) {
                @strongify(self)
                self.visitorJail = selectedJail;
                self.handler = nil;
                //[[PSContentManager sharedInstance] resetContent];
                if (finished) {
                    finished();
                }
            }];
        }
         
    }
}

- (void)setVisitorJail:(PSJail *)visitorJail {
    _visitorJail = visitorJail;
    [PSCache addCache:VisitorSelectPrisonCacheKey obj:visitorJail];
}
 */
- (void)synchronizeDefaultJailConfigurations {
    self.jailRequest=[PSDefaultJailRequest new];
    [self.jailRequest send:^(PSRequest *request, PSResponse *response) {
        NSLog(@"%@",response);
        if (response.code == 200) {
            PSDefaultJailResponse *jailResponse = (PSDefaultJailResponse *)response;
            self.defaultJailId = jailResponse.jailId;
            self.defaultJailName = jailResponse.jailName;
            [self saveDefaults];
        }
    }];
    
    
}
- (void)saveDefaults{
    [LXFileManager removeUserDataForkey:@"vistorId"];
    [LXFileManager removeUserDataForkey:@"vistorTitle"];
    [LXFileManager removeUserDataForkey:@"isVistor"];
    [LXFileManager saveUserData:self.defaultJailId forKey:@"vistorId"];
    [LXFileManager saveUserData:self.defaultJailName forKey:@"vistorTitle"];
    [LXFileManager saveUserData:@"YES" forKey:@"isVistor"];
}
#pragma mark - STLaunchTask
- (void)launchTaskWithCompletion:(LaunchTaskCompletion)completion {
//    [self visitorSelectJail:^{
//        if (completion) {
//            completion(YES);
//        }
//    }];
    [self synchronizeDefaultJailConfigurations];
    if (completion) {
        completion(YES);
    }
}

@end
