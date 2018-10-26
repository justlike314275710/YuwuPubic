//
//  PSSessionPendingController.m
//  PrisonService
//
//  Created by calvin on 2018/4/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSSessionPendingController.h"
#import "PSPendingViewController.h"
#import "PSSessionManager.h"
#import "NSString+Date.h"
@interface PSSessionPendingController ()<PSPendingDataSource,PSPendingDelegate>

@end

@implementation PSSessionPendingController
- (id)init {
    self = [super init];
    if (self) {
        PSPendingViewController *pendingViewController = [PSPendingViewController new];
        pendingViewController.dataSource = self;
        pendingViewController.delegate = self;
        self.viewControllers = @[pendingViewController];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - PSPendingDataSource and PSPendingDelegate
- (NSString *)titleForPendingView {
    NSString*register_pending=NSLocalizedString(@"register_pending", @"审核中");
    return register_pending;
}

- (NSString *)subTitleForPendingView {
    NSString*Please_wait_review=NSLocalizedString(@"Please_wait_review", @"请等待监狱审核,通过后即可登入系统");
//    NSString*time=[[PSSessionManager sharedInstance].session.families.createdAt timestampToDateString];
//    NSString*pendingTitle=[NSString stringWithFormat:@"您于%@提交的认证申请正在审核,请耐心等待",time];
    return Please_wait_review;
}

- (NSString *)titleForOperationButton {
    NSString*register_switch=NSLocalizedString(@"register_switch", @"返回主页");
    return register_switch;
}

- (void)pendingViewOperation {
    [[PSSessionManager sharedInstance] doLogout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
