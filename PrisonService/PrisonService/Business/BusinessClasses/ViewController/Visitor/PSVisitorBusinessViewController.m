//
//  PSVisitorBusinessViewController.m
//  PrisonService
//
//  Created by calvin on 2018/4/9.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSVisitorBusinessViewController.h"
#import "PSVisitorViewController.h"

@interface PSVisitorBusinessViewController ()

@end

@implementation PSVisitorBusinessViewController

- (void)initialize {
    PSVisitorViewController *visitorViewController = [[PSVisitorViewController alloc] initWithViewModel:[[PSVisitorViewModel alloc] init]];
    @weakify(self)
    [visitorViewController setCallback:^(PSJail *selectedJail) {
        @strongify(self)
        if (self.callback) {
            self.callback(selectedJail);
        }
    }];
    self.viewControllers = @[visitorViewController];
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
