//
//  STStartupAdManager.m
//  Start
//
//  Created by Glen on 16/8/24.
//  Copyright © 2016年 DingSNS. All rights reserved.
//

#import "PSStartupAdvManager.h"
#import "PSAdvertisementRequest.h"
#import "SDWebImageManager.h"
#import "PSStartupAdvViewController.h"
#import "PSBusinessConstants.h"
#import "PSLocateManager.h"

#define LAUNCHADVKEY @"launch_advertisement"

@interface PSStartupAdvManager ()

@property (nonatomic, strong) PSAdvertisementRequest *advRequest;
@property (nonatomic, strong) NSArray *canShowAdvertisements;
@property (nonatomic, strong) PSStartupAdvViewController *startupAdViewController;

@end

@implementation PSStartupAdvManager

+ (PSStartupAdvManager *)sharedInstance {
    static PSStartupAdvManager *advManager = nil;
    static dispatch_once_t oncetoken;
    dispatch_once(&oncetoken,^{
        if (!advManager) {
            advManager = [[self alloc] init];
        }
    });
    return advManager;
}

- (void)downloadImagesOfAdvertisements:(NSArray *)advUrls {
    [[SDWebImageManager sharedManager] cancelAll];
    for (NSString *url in advUrls) {
        [[SDWebImageManager sharedManager] diskImageExistsForURL:[NSURL URLWithString:url] completion:^(BOOL isInCache) {
            if (!isInCache){
                [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:url] options:SDWebImageContinueInBackground progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {

                } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
                    
                }];
            }
        }];
    }
}

- (void)showAdvertisements:(NSArray *)advUrls completion:(LaunchTaskCompletion)completion {
    if (advUrls.count > 0) {
        PSStartupAdvViewController *advViewController = [PSStartupAdvViewController new];
        [advViewController setUrlsGroup:^NSArray *{
            return advUrls;
        }];
        [advViewController setCompleted:^{
            if (completion) {
                completion(YES);
            }
        }];
        [UIApplication sharedApplication].keyWindow.rootViewController = advViewController;
    }else{
        if (completion) {
            completion(YES);
        }
    }
}

- (void)handleAdvertisements:(NSArray *)advertisements completion:(LaunchTaskCompletion)completion {
    NSMutableArray *showAdvUrls = [NSMutableArray array];
    NSMutableArray *downloadAdvUrls = [NSMutableArray array];
    for (PSAdvertisement *adv in advertisements) {
        NSString *advUrl = PICURL(adv.imageUrl);
        NSString *key = [[SDWebImageManager sharedManager] cacheKeyForURL:[NSURL URLWithString:advUrl]];
        UIImage *image = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:key];
        if (image) {
            [showAdvUrls addObject:advUrl];
        }else{
            [downloadAdvUrls addObject:advUrl];
        }
    }
    [self downloadImagesOfAdvertisements:downloadAdvUrls];
    [self showAdvertisements:showAdvUrls completion:completion];
}

- (void)launchAdvertisementsTaskWithCompletion:(LaunchTaskCompletion)completion {
    self.advRequest = [PSAdvertisementRequest new];
    self.advRequest.type = PSAdvLaunch;
    self.advRequest.province = [PSLocateManager sharedInstance].province;
    @weakify(self)
    [self.advRequest send:^(PSRequest *request, PSResponse *response) {
        @strongify(self)
        if (response.code == 200) {
            PSAdvertisementResponse *advResponse = (PSAdvertisementResponse *)response;
            [self handleAdvertisements:advResponse.advertisements completion:completion];
        }else{
            if (completion) {
                completion(YES);
            }
        }
    } errorCallback:^(PSRequest *request, NSError *error) {
        if (completion) {
            completion(YES);
        }
    }];
}

#pragma mark - STTask
- (void)launchTaskWithCompletion:(LaunchTaskCompletion)completion {
    [self launchAdvertisementsTaskWithCompletion:^(BOOL completed) {
        if (completion) {
            completion(completed);
        }
    }];
}

- (NSString *)taskName {
    return @"启动广告管理";
}

@end
