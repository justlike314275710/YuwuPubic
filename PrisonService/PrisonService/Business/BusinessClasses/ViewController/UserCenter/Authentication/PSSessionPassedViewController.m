//
//  PSSessionPassedViewController.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/9/7.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSSessionPassedViewController.h"
#import "PSPendingViewController.h"
#import "PSSessionManager.h"
@interface PSSessionPassedViewController ()<PSPendingDelegate,PSPendingDataSource>

@end

@implementation PSSessionPassedViewController

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
    
    return @"已认证";
}

- (NSString *)subTitleForPendingView {
    
    return @"";
}

- (NSString *)titleForOperationButton {
    
    return @"已认证";
}

- (void)pendingViewOperation {

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
