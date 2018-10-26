//
//  PSBalanceTopView.m
//  PrisonService
//
//  Created by calvin on 2018/4/12.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBalanceTopView.h"
#import "PSHomeViewModel.h"
#import "PSBusinessViewController.h"
@implementation PSBalanceTopView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        CGFloat sidePadding = 25;
        
        UIImage *bgImage = [UIImage imageNamed:@"userCenterBalanceTopBg"];
        CGFloat bgRate = bgImage.size.height/bgImage.size.width;
        _topRate = bgRate;
        UIImageView *bgImageView = [UIImageView new];
        bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        bgImageView.image = bgImage;
        [self addSubview:bgImageView];
        [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(bgImageView.mas_width).multipliedBy(bgRate);
        }];
        _balanceLabel = [UILabel new];
        _balanceLabel.font = FontOfSize(54);
        _balanceLabel.textAlignment = NSTextAlignmentCenter;
        _balanceLabel.textColor = [UIColor whiteColor];
        //_balanceLabel.text = @"¥0";
        [bgImageView addSubview:_balanceLabel];
        [_balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(sidePadding);
            make.right.mas_equalTo(-sidePadding);
            make.centerY.mas_equalTo(bgImageView);
            make.height.mas_equalTo(50);
        }];
     
        UILabel *tipsLabel = [UILabel new];
        tipsLabel.font = FontOfSize(12);
        tipsLabel.textAlignment = NSTextAlignmentCenter;
        tipsLabel.textColor = [UIColor whiteColor];
        //tipsLabel.text = @"我的可用余额";
        [bgImageView addSubview:tipsLabel];
        PSHomeViewModel *homeViewModel = [[PSHomeViewModel alloc]init];
        PSPrisonerDetail *prisonerDetail = homeViewModel.passedPrisonerDetails.count > 0 ? homeViewModel.passedPrisonerDetails[homeViewModel.selectedPrisonerIndex] : nil;
        NSString*Available_balance=NSLocalizedString(@"Available_balance", @"%@可用余额");
        tipsLabel.text = [NSString stringWithFormat:Available_balance, prisonerDetail.jailName ];
        [tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(sidePadding);
            make.right.mas_equalTo(-sidePadding);
            make.top.mas_equalTo(_balanceLabel.mas_bottom).offset(20);
            make.height.mas_equalTo(20);
        }];
        
        UIImage *infoBgImage = [UIImage imageNamed:@"userCenterBalanceInfoBg"];
        CGFloat infoBgRate = infoBgImage.size.height/infoBgImage.size.width;
        _infoRate = infoBgRate;
        UIImageView *infoBgImageView = [UIImageView new];
        infoBgImageView.userInteractionEnabled = YES;
        infoBgImageView.contentMode = UIViewContentModeScaleAspectFill;
        infoBgImageView.image = infoBgImage;
        [self addSubview:infoBgImageView];
        [infoBgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(sidePadding);
            make.right.mas_equalTo(-sidePadding);
            make.top.mas_equalTo(bgImageView.mas_bottom).offset(-65);
            make.height.mas_equalTo(infoBgImageView.mas_width).multipliedBy(infoBgRate);
        }];
        UIImageView *cartoonImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"userCenterBalanceCartoon"]];
        [infoBgImageView addSubview:cartoonImageView];
        [cartoonImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(30);
            make.centerX.mas_equalTo(infoBgImageView.mas_centerX);
            make.size.mas_equalTo(cartoonImageView.frame.size);
        }];
        
        _refundButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _refundButton.titleLabel.font = AppBaseTextFont1;
        [_refundButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_refundButton setTitle:@"申请退款" forState:UIControlStateNormal];
        [_refundButton setBackgroundImage:[UIImage imageNamed:@"universalBtGradientBg"] forState:UIControlStateNormal];
        [infoBgImageView addSubview:_refundButton];
        [_refundButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(sidePadding);
            make.right.mas_equalTo(-sidePadding);
            make.bottom.mas_equalTo(-sidePadding);
            make.height.mas_equalTo(40);
        }];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
