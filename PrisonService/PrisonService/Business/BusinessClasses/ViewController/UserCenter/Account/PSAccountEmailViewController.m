//
//  PSAccountEmailViewController.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/7/23.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSAccountEmailViewController.h"
#import "PSRoundRectTextField.h"
#import "PSUnderlineTextField.h"
#import "PSAccountEditEmailViewModel.h"
#import "PSLoadingView.h"
@interface PSAccountEmailViewController ()
@property (nonatomic , strong) PSUnderlineTextField *accountEmailTextfield;
@end

@implementation PSAccountEmailViewController

- (instancetype)initWithViewModel:(PSViewModel *)viewModel {
    self = [super initWithViewModel:viewModel];
    if (self) {
        NSString*Zip_code=NSLocalizedString(@"Zip_code", @"邮编");
       self.title = Zip_code;
    }
    return self;
}



- (void)renderContents {
    NSString*save=NSLocalizedString(@"save", @"保存");
    [self createRightBarButtonItemWithTarget:self action:@selector(SaveEmailAction) title:save];
    CGFloat horizontalSpace = 15;
    self.accountEmailTextfield=[[PSUnderlineTextField alloc]initWithFrame:CGRectMake(horizontalSpace, horizontalSpace, SCREEN_WIDTH-2*horizontalSpace, 30)];
    NSString*enter_Zipcode=NSLocalizedString(@"enter_Zipcode", @"请输入邮编");
    self.accountEmailTextfield.placeholder=enter_Zipcode;
    self.accountEmailTextfield.borderStyle=UITextBorderStyleRoundedRect;
    self.accountEmailTextfield.font=AppBaseTextFont3;
    
    [self.view addSubview:self.accountEmailTextfield];
    PSAccountEditEmailViewModel *accountEditViewModel = (PSAccountEditEmailViewModel *)self.viewModel;
    [self.accountEmailTextfield setBk_didEndEditingBlock:^(UITextField *textField) {
        accountEditViewModel.email=textField.text;
    }];

    
}

- (void)SaveEmailAction {
    [self.view endEditing:YES];
    [[PSLoadingView sharedInstance]show];
    PSAccountEditEmailViewModel*accountEditViewModel=(PSAccountEditEmailViewModel *)self.viewModel;
    if (accountEditViewModel.email.length==0) {
         [[PSLoadingView sharedInstance]dismiss];
        [PSTipsView showTips:@"请输入邮编"];
    } else {
        [accountEditViewModel requestAccountEmailCompleted:^(PSResponse *response) {
            [[PSLoadingView sharedInstance]dismiss];
            [PSTipsView showTips:accountEditViewModel.msg];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [self.navigationController popViewControllerAnimated:YES];
            });
        } failed:^(NSError *error) {
            [[PSLoadingView sharedInstance]dismiss];
            [self showNetError];
        }];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self renderContents];
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
