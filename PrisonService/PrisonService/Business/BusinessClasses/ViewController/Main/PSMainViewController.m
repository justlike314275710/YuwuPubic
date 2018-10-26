//
//  PSMainViewController.m
//  PrisonService
//
//  Created by calvin on 2018/4/3.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSMainViewController.h"
#import "PSHomeViewController.h"
#import "PSUserCenterViewController.h"
#import "PSNavigationController.h"
#import "PSContentManager.h"

@interface PSMainViewController ()

@end

@implementation PSMainViewController

- (id)init {
    PSHomeViewController *homeViewController = [[PSHomeViewController alloc] initWithViewModel:[[PSHomeViewModel alloc] init]];
    PSUserCenterViewController *userCenterViewController = [[PSUserCenterViewController alloc] initWithViewModel:[[PSUserCenterViewModel alloc] init]];
    PSNavigationController *homeNaviController = [[PSNavigationController alloc] initWithRootViewController:homeViewController];
    self = [super initWithCenterViewController:homeNaviController leftDrawerViewController:userCenterViewController];
    if (self) {
        self.maximumLeftDrawerWidth = 240;
        self.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    }
    return self;
}

- (BOOL)shouldAutorotate {
    return [PSContentManager sharedInstance].topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [PSContentManager sharedInstance].topViewController.supportedInterfaceOrientations;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
