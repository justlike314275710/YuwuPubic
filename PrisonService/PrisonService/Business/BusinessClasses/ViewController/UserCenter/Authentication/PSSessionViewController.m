//
//  PSSessionViewController.m
//  PrisonService
//
//  Created by calvin on 2018/4/9.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSSessionViewController.h"
#import "PSLoginViewController.h"
#import "PSPreLoginViewModel.h"
@interface PSSessionViewController ()

@end

@implementation PSSessionViewController

- (void)initialize {

   PSLoginViewController *loginViewController = [[PSLoginViewController alloc] initWithViewModel:[[PSLoginViewModel alloc] init]];
    
    [loginViewController setCallback:^(BOOL successful, id session) {
        if (self.callback) {
            self.callback(successful,session);
        }
    }];
    self.viewControllers = @[loginViewController];
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
