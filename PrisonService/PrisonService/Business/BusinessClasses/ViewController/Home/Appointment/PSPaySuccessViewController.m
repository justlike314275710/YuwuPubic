//
//  PSPaySuccessViewController.m
//  PrisonService
//
//  Created by calvin on 2018/4/23.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSPaySuccessViewController.h"

@interface PSPaySuccessViewController ()

@end

@implementation PSPaySuccessViewController

- (void)renderContents {
    UIImageView *successView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"appointmentPaymentSuccess"]];
    [self.view addSubview:successView];
    [successView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(50);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(successView.frame.size);
    }];
    CGFloat btWidth = 89;
    CGFloat btHeight = 34;
    UIButton *finishButton = [UIButton buttonWithType:UIButtonTypeCustom];
    finishButton.titleLabel.font = FontOfSize(12);
    [finishButton setTitleColor:AppBaseTextColor1 forState:UIControlStateNormal];
    [finishButton setTitle:@"支付成功" forState:UIControlStateNormal];
    finishButton.layer.borderColor = AppBaseTextColor1.CGColor;
    finishButton.layer.cornerRadius = btHeight / 2;
    finishButton.layer.borderWidth = 1.0;
    @weakify(self)
    [finishButton bk_whenTapped:^{
        @strongify(self)
        if (self.closeAction) {
            self.closeAction();
        }
    }];
    [self.view addSubview:finishButton];
    [finishButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(successView.mas_bottom).offset(40);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(btWidth);
        make.height.mas_equalTo(btHeight);
    }];
}

- (BOOL)fd_interactivePopDisabled {
    return YES;
}

- (BOOL)fd_prefersNavigationBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.view.backgroundColor = [UIColor clearColor];
    [self renderContents];
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
