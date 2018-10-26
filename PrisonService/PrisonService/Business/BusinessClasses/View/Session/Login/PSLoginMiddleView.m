//
//  PSLoginMiddleView.m
//  PrisonService
//
//  Created by calvin on 2018/4/9.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSLoginMiddleView.h"

@interface PSLoginMiddleView ()

@end

@implementation PSLoginMiddleView


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];

        CGFloat sidePadding = RELATIVE_WIDTH_VALUE(15);

        _phoneTextField = [[PSUnderlineTextField alloc] initWithFrame:CGRectZero];
        _phoneTextField.font = AppBaseTextFont2;
        _phoneTextField.borderStyle = UITextBorderStyleNone;
        _phoneTextField.textColor = AppBaseTextColor1;
        _phoneTextField.textAlignment = NSTextAlignmentCenter;
       NSString*please_enter_phone_number=NSLocalizedString(@"please_enter_phone_number", nil);
        _phoneTextField.placeholder =please_enter_phone_number;
        _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
        [self addSubview:_phoneTextField];
        [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(sidePadding);
            make.right.mas_equalTo(-sidePadding);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(44);
        }];
        
        UILabel*phoneLable=[UILabel new];
        NSString*phonenumber=NSLocalizedString(@"phoneNumber", nil);
        phoneLable.text=phonenumber;
        phoneLable.font= AppBaseTextFont2;
        [self addSubview:phoneLable];
        [phoneLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_phoneTextField.mas_top);
            make.left.mas_equalTo(_phoneTextField.mas_left);
            make.bottom.mas_equalTo(_phoneTextField.mas_bottom);
            make.width.mas_equalTo(70);
        }];
        phoneLable.numberOfLines=0;
 
        _codeTextField = [[PSUnderlineTextField alloc] initWithFrame:CGRectZero];
        _codeTextField.font = AppBaseTextFont2;
        _codeTextField.borderStyle = UITextBorderStyleNone;
        _codeTextField.textColor = AppBaseTextColor1;
        _codeTextField.textAlignment = NSTextAlignmentCenter;
        NSString*please_enter_verify_code=NSLocalizedString(@"please_enter_verify_code", nil);
        _codeTextField.placeholder = please_enter_verify_code;
        _codeTextField.keyboardType =UIKeyboardTypeNumberPad;
        [self addSubview:_codeTextField];
        [_codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(sidePadding);
            make.right.mas_equalTo(-sidePadding);
            make.top.mas_equalTo(_phoneTextField.mas_bottom);
            //make.bottom.mas_equalTo(0);
            make.height.equalTo(_phoneTextField);
        }];

        _codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _codeButton.titleLabel.font = AppBaseTextFont2;
        [_codeButton setTitleColor:AppBaseTextColor3 forState:UIControlStateNormal];
        [_codeButton setTitleColor:AppBaseTextColor2 forState:UIControlStateDisabled];
        [_codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self addSubview:_codeButton];
        [_codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_codeTextField.mas_top);
            make.right.mas_equalTo(_codeTextField.mas_right);
            make.bottom.mas_equalTo(_codeTextField.mas_bottom);
            make.width.mas_equalTo(70);
        }];
        NSString*verifycode=NSLocalizedString(@"verifycode", nil);
        UILabel*codeLable=[UILabel new];
        codeLable.text=verifycode;
        codeLable.font= AppBaseTextFont2;
        [self addSubview:codeLable];
        [codeLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_codeTextField.mas_top);
            make.left.mas_equalTo(_codeTextField.mas_left);
            make.bottom.mas_equalTo(_codeTextField.mas_bottom);
            make.width.mas_equalTo(70);
        }];
        codeLable.numberOfLines=0;
        
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.titleLabel.font = AppBaseTextFont1;
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        NSString*login=NSLocalizedString(@"login", nil);
        [_loginButton setTitle:login forState:UIControlStateNormal];
//        [_loginButton setBackgroundImage:[[UIImage imageNamed:@"universalBtBg"] stretchImage] forState:UIControlStateNormal];
        [_loginButton setBackgroundColor:AppBaseTextColor3];
        [self addSubview:_loginButton];
        [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(_codeTextField.mas_bottom).offset(70);
            make.centerX.mas_equalTo(self);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-50, 44));
        }];
    }
    return self;
}
//- (id)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        self.backgroundColor = [UIColor clearColor];
//        UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sessionRectBg"]];
//        bgImageView.userInteractionEnabled = YES;
//        [self addSubview:bgImageView];
//        [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.center.mas_equalTo(self);
//            make.size.mas_equalTo(bgImageView.frame.size);
//        }];
//
//        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _loginButton.titleLabel.font = AppBaseTextFont1;
//        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
//        [_loginButton setBackgroundImage:[[UIImage imageNamed:@"universalBtBg"] stretchImage] forState:UIControlStateNormal];
//        [self addSubview:_loginButton];
//        [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.mas_equalTo(bgImageView.mas_bottom).offset(-18);
//            make.centerX.mas_equalTo(self);
//            make.size.mas_equalTo(CGSizeMake(90, 35));
//        }];
//
//        UIImageView *headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sessionDefaultHead"]];
//        [self addSubview:headImageView];
//        [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.mas_equalTo(self);
//            make.top.mas_equalTo(bgImageView.mas_top).offset(5);
//            make.size.mas_equalTo(headImageView.frame.size);
//        }];
//
//        CGFloat sidePadding = RELATIVE_WIDTH_VALUE(20);
//        UIView *contentView = [UIView new];
//        contentView.backgroundColor = [UIColor clearColor];
//        [self addSubview:contentView];
//        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(bgImageView.mas_left).offset(15);
//            make.right.mas_equalTo(bgImageView.mas_right).offset(-15);
//            make.top.mas_equalTo(headImageView.mas_bottom).offset(20);
//            make.bottom.mas_equalTo(_loginButton.mas_top).offset(-23);
//        }];
//
//        _phoneTextField = [[PSUnderlineTextField alloc] initWithFrame:CGRectZero];
//        _phoneTextField.font = AppBaseTextFont2;
//        _phoneTextField.borderStyle = UITextBorderStyleNone;
//        _phoneTextField.textColor = AppBaseTextColor1;
//        _phoneTextField.textAlignment = NSTextAlignmentCenter;
//        _phoneTextField.placeholder = @"请输入手机号";
//        _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
//        [contentView addSubview:_phoneTextField];
//        [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(sidePadding);
//            make.right.mas_equalTo(-sidePadding);
//            make.top.mas_equalTo(0);
//        }];
//        _cardTextField = [[PSUnderlineTextField alloc] initWithFrame:CGRectZero];
//        _cardTextField.font = AppBaseTextFont2;
//        _cardTextField.borderStyle = UITextBorderStyleNone;
//        _cardTextField.textColor = AppBaseTextColor1;
//        _cardTextField.textAlignment = NSTextAlignmentCenter;
//        _cardTextField.placeholder = @"请输入身份证号";
//        [contentView addSubview:_cardTextField];
//        [_cardTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(sidePadding);
//            make.right.mas_equalTo(-sidePadding);
//            make.top.mas_equalTo(_phoneTextField.mas_bottom);
//            make.height.equalTo(_phoneTextField);
//        }];
//        _codeTextField = [[PSUnderlineTextField alloc] initWithFrame:CGRectZero];
//        _codeTextField.font = AppBaseTextFont2;
//        _codeTextField.borderStyle = UITextBorderStyleNone;
//        _codeTextField.textColor = AppBaseTextColor1;
//        _codeTextField.textAlignment = NSTextAlignmentCenter;
//        _codeTextField.placeholder = @"请输入验证码";
//        _codeTextField.keyboardType = UIKeyboardTypeNumberPad;
//        [contentView addSubview:_codeTextField];
//        [_codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(sidePadding);
//            make.right.mas_equalTo(-sidePadding);
//            make.top.mas_equalTo(_cardTextField.mas_bottom);
//            make.bottom.mas_equalTo(0);
//            make.height.equalTo(_phoneTextField);
//        }];
//
//        _codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _codeButton.titleLabel.font = AppBaseTextFont2;
//        [_codeButton setTitleColor:AppBaseTextColor3 forState:UIControlStateNormal];
//        [_codeButton setTitleColor:AppBaseTextColor2 forState:UIControlStateDisabled];
//        [_codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
//        [contentView addSubview:_codeButton];
//        [_codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(_codeTextField.mas_top);
//            make.right.mas_equalTo(_codeTextField.mas_right);
//            make.bottom.mas_equalTo(_codeTextField.mas_bottom);
//            make.width.mas_equalTo(70);
//        }];
//    }
//    return self;
//}



//- (id)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        self.backgroundColor = [UIColor clearColor];
//        CGFloat sidePadding = RELATIVE_WIDTH_VALUE(20);
//        UIView *contentView = [UIView new];
//        contentView.userInteractionEnabled=YES;
//        contentView.backgroundColor = [UIColor clearColor];
//        [self addSubview:contentView];
//        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(self.mas_left).offset(5);
//            make.right.mas_equalTo(self.mas_right).offset(-5);
//            make.top.mas_equalTo(self.mas_bottom).offset(5);
//            make.bottom.mas_equalTo(self.mas_top).offset(-5);
//        }];
//
//        _phoneTextField = [[PSUnderlineTextField alloc] initWithFrame:CGRectZero];
//        _phoneTextField.font = AppBaseTextFont2;
//        _phoneTextField.borderStyle = UITextBorderStyleNone;
//        _phoneTextField.textColor = AppBaseTextColor1;
//        _phoneTextField.textAlignment = NSTextAlignmentCenter;
//        _phoneTextField.placeholder = @"请输入手机号";
//        _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
//        [contentView addSubview:_phoneTextField];
//        [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(sidePadding);
//            make.right.mas_equalTo(-sidePadding);
//            make.top.mas_equalTo(0);
//            make.height.mas_equalTo(44);
//        }];
//
//        _codeTextField = [[PSUnderlineTextField alloc] initWithFrame:CGRectZero];
//        _codeTextField.font = AppBaseTextFont2;
//        _codeTextField.borderStyle = UITextBorderStyleNone;
//        _codeTextField.textColor = AppBaseTextColor1;
//        _codeTextField.textAlignment = NSTextAlignmentCenter;
//        _codeTextField.placeholder = @"请输入验证码";
//        _codeTextField.keyboardType = UIKeyboardTypeNumberPad;
//        [contentView addSubview:_codeTextField];
//        [_codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(sidePadding);
//            make.right.mas_equalTo(-sidePadding);
//            make.top.mas_equalTo(_phoneTextField.mas_bottom);
//           // make.bottom.mas_equalTo(0);
//            make.height.equalTo(_phoneTextField);
//
//        }];
//
//        _codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _codeButton.titleLabel.font = AppBaseTextFont2;
//        [_codeButton setTitleColor:AppBaseTextColor3 forState:UIControlStateNormal];
//        [_codeButton setTitleColor:AppBaseTextColor2 forState:UIControlStateDisabled];
//        [_codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
//        [contentView addSubview:_codeButton];
//        [_codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(_codeTextField.mas_top);
//            make.right.mas_equalTo(_codeTextField.mas_right);
//            make.bottom.mas_equalTo(_codeTextField.mas_bottom);
//            make.width.mas_equalTo(70);
//        }];
//
//        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _loginButton.titleLabel.font = AppBaseTextFont1;
//        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
//        [_loginButton setBackgroundImage:[[UIImage imageNamed:@"universalBtBg"] stretchImage] forState:UIControlStateNormal];
//        [contentView addSubview:_loginButton];
//        [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
//                    make.top.mas_equalTo(_codeTextField.mas_bottom).offset(18);
//                    make.centerX.mas_equalTo(self);
//                    make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-20, 44));
//                }];
//
//    }
//    return self;
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
