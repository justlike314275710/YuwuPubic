//
//  PSPendingViewController.m
//  PrisonService
//
//  Created by calvin on 2018/4/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSPendingViewController.h"

@interface PSPendingViewController ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;

@end

@implementation PSPendingViewController

- (void)renderContents {
    CGFloat horSpace = 20;
    _titleLabel = [UILabel new];
    _titleLabel.font = AppBaseTextFont1;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = AppBaseTextColor1;
    if ([self.dataSource respondsToSelector:@selector(titleForPendingView)]) {
        _titleLabel.text = [self.dataSource titleForPendingView];
    }
    [self.view addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(horSpace);
        make.right.mas_equalTo(-horSpace);
        make.height.mas_equalTo(16);
        make.centerY.mas_equalTo(self.view);
    }];
    
    _subTitleLabel = [UILabel new];
    _subTitleLabel.font = AppBaseTextFont2;
    _subTitleLabel.textAlignment = NSTextAlignmentCenter;
    _subTitleLabel.textColor = AppBaseTextColor2;
    _subTitleLabel.numberOfLines=0;
    if ([self.dataSource respondsToSelector:@selector(subTitleForPendingView)]) {
        _subTitleLabel.text = [self.dataSource subTitleForPendingView];
    }
    [self.view addSubview:_subTitleLabel];
    [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(horSpace);
        make.right.mas_equalTo(-horSpace);
        make.height.mas_equalTo(34);
        make.top.mas_equalTo(_titleLabel.mas_bottom).offset(6);
    }];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sessionPendingIcon"]];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(_titleLabel.mas_top).offset(-35);
        make.size.mas_equalTo(imageView.frame.size);
    }];
    
//    CGFloat btWidth = 89;
//    CGFloat btHeight = 34;
//    UIButton *operationButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    operationButton.layer.borderWidth = 1.0;
//    operationButton.layer.borderColor = AppBaseTextColor1.CGColor;
//    operationButton.layer.cornerRadius = btHeight / 2;
//    operationButton.titleLabel.font = AppBaseTextFont1;
//    [operationButton setTitleColor:AppBaseTextColor1 forState:UIControlStateNormal];
//    if ([self.dataSource respondsToSelector:@selector(titleForOperationButton)]) {
//        [operationButton setTitle:[self.dataSource titleForOperationButton] forState:UIControlStateNormal];
//    }
//    @weakify(self)
//    [operationButton bk_whenTapped:^{
//        @strongify(self)
//        if ([self.delegate respondsToSelector:@selector(pendingViewOperation)]) {
//            [self.delegate pendingViewOperation];
//        }
//    }];
//    [self.view addSubview:operationButton];
//    [operationButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(_subTitleLabel.mas_bottom).offset(44);
//        make.centerX.mas_equalTo(self.view);
//        make.width.mas_equalTo(btWidth);
//        make.height.mas_equalTo(btHeight);
//    }];
//    operationButton.titleLabel.numberOfLines=0;
}

- (UIImage *)leftItemImage {
     return [UIImage imageNamed:@"universalBackIcon"];;
}

- (IBAction)actionOfLeftItem:(id)sender {

    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
