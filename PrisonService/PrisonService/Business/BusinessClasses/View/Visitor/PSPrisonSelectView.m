//
//  PSPrisonSelectView.m
//  PrisonService
//
//  Created by calvin on 2018/4/4.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSPrisonSelectView.h"

@implementation PSPrisonSelectView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self renderContents];
    }
    return self;
}

- (void)renderContents {
    
    UIFont *textFont = AppBaseTextFont1;
    UIColor *titleColor = AppBaseTextColor3;
    UIColor *commonColor = AppBaseTextColor2;
    UIColor *borderColor = AppBaseLineColor;
    CGFloat middleSideSpace = 15;
    CGFloat horSideSpace = 20;
    CGFloat buttonHeight = 43;
    CGFloat buttonTitleSpace = 15;
    CGFloat topSpace = 25;
    CGFloat buttonCornerRadius = 8.0;
    CGFloat buttonBorderWidth = 1.0;
    CGFloat titleHeight = 15;
    CGFloat textLeftMargin = 10;
    
    UILabel *provinceTitleLabel = [UILabel new];
    provinceTitleLabel.textAlignment = NSTextAlignmentLeft;
    provinceTitleLabel.font = textFont;
    provinceTitleLabel.textColor = titleColor;
    NSString*province=NSLocalizedString(@"province", @"省份");
    provinceTitleLabel.text = province;
    [self addSubview:provinceTitleLabel];
    [provinceTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(horSideSpace);
        make.top.mas_equalTo(topSpace);
        make.height.mas_equalTo(titleHeight);
        make.right.mas_equalTo(self.mas_centerX).offset(-middleSideSpace);
    }];
    _proviceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _proviceButton.layer.cornerRadius = buttonCornerRadius;
    _proviceButton.layer.borderWidth = buttonBorderWidth;
    _proviceButton.layer.borderColor = borderColor.CGColor;
    [_proviceButton setImage:[UIImage imageNamed:@"sessionSpreadIcon"] forState:UIControlStateNormal];
    _proviceButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    _proviceButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    [self addSubview:_proviceButton];
    [_proviceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(provinceTitleLabel.mas_left);
        make.top.mas_equalTo(provinceTitleLabel.mas_bottom).offset(buttonTitleSpace);
        make.right.mas_equalTo(provinceTitleLabel.mas_right);
        make.height.mas_equalTo(buttonHeight);
    }];
    _proviceLabel = [UILabel new];
    _proviceLabel.textAlignment = NSTextAlignmentLeft;
    _proviceLabel.backgroundColor = [UIColor clearColor];
    _proviceLabel.font = textFont;
    _proviceLabel.textColor = commonColor;
    [self addSubview:_proviceLabel];
    [_proviceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_proviceButton.mas_left).offset(textLeftMargin);
        make.top.mas_equalTo(_proviceButton.mas_top);
        make.bottom.mas_equalTo(_proviceButton.mas_bottom);
        make.right.mas_equalTo(_proviceButton.mas_right).offset(-45);
    }];
    
    UILabel *cityTitleLabel = [UILabel new];
    cityTitleLabel.textAlignment = NSTextAlignmentLeft;
    cityTitleLabel.font = textFont;
    cityTitleLabel.textColor = titleColor;
    NSString*city=NSLocalizedString(@"city", @"市/县");
    cityTitleLabel.text = city;
    [self addSubview:cityTitleLabel];
    [cityTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-horSideSpace);
        make.top.mas_equalTo(topSpace);
        make.height.mas_equalTo(titleHeight);
        make.left.mas_equalTo(self.mas_centerX).offset(middleSideSpace);
    }];
    _cityButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _cityButton.layer.cornerRadius = buttonCornerRadius;
    _cityButton.layer.borderWidth = buttonBorderWidth;
    _cityButton.layer.borderColor = borderColor.CGColor;
    [_cityButton setImage:[UIImage imageNamed:@"sessionSpreadIcon"] forState:UIControlStateNormal];
    _cityButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    _cityButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    [self addSubview:_cityButton];
    [_cityButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(cityTitleLabel.mas_left);
        make.top.mas_equalTo(cityTitleLabel.mas_bottom).offset(buttonTitleSpace);
        make.right.mas_equalTo(cityTitleLabel.mas_right);
        make.height.mas_equalTo(buttonHeight);
    }];
    _cityLabel = [UILabel new];
    _cityLabel.textAlignment = NSTextAlignmentLeft;
    _cityLabel.backgroundColor = [UIColor clearColor];
    _cityLabel.font = textFont;
    _cityLabel.textColor = commonColor;
    [self addSubview:_cityLabel];
    [_cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_cityButton.mas_left).offset(textLeftMargin);
        make.top.mas_equalTo(_cityButton.mas_top);
        make.bottom.mas_equalTo(_cityButton.mas_bottom);
        make.right.mas_equalTo(_cityButton.mas_right).offset(-45);
    }];
    
    UILabel *jailTitleLabel = [UILabel new];
    jailTitleLabel.textAlignment = NSTextAlignmentLeft;
    jailTitleLabel.font = textFont;
    jailTitleLabel.textColor = titleColor;
    NSString*prison=NSLocalizedString(@"prison", @"监狱");
    jailTitleLabel.text = prison;
    [self addSubview:jailTitleLabel];
    [jailTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-horSideSpace);
        make.top.mas_equalTo(_cityButton.mas_bottom).offset(topSpace);
        make.height.mas_equalTo(titleHeight);
        make.left.mas_equalTo(horSideSpace);
    }];
    _prisonButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _prisonButton.layer.cornerRadius = buttonCornerRadius;
    _prisonButton.layer.borderWidth = buttonBorderWidth;
    _prisonButton.layer.borderColor = borderColor.CGColor;
    [_prisonButton setImage:[UIImage imageNamed:@"sessionSpreadIcon"] forState:UIControlStateNormal];
    _prisonButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    _prisonButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    [self addSubview:_prisonButton];
    [_prisonButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(jailTitleLabel.mas_left);
        make.top.mas_equalTo(jailTitleLabel.mas_bottom).offset(buttonTitleSpace);
        make.right.mas_equalTo(jailTitleLabel.mas_right);
        make.height.mas_equalTo(buttonHeight);
    }];
    _prisonLabel = [UILabel new];
    _prisonLabel.textAlignment = NSTextAlignmentLeft;
    _prisonLabel.backgroundColor = [UIColor clearColor];
    _prisonLabel.font = textFont;
    _prisonLabel.textColor = commonColor;
    [self addSubview:_prisonLabel];
    [_prisonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_prisonButton.mas_left).offset(textLeftMargin);
        make.top.mas_equalTo(_prisonButton.mas_top);
        make.bottom.mas_equalTo(_prisonButton.mas_bottom);
        make.right.mas_equalTo(_prisonButton.mas_right).offset(-45);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
