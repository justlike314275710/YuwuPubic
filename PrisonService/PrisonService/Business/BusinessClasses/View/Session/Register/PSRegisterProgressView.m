//
//  PSRegisterProgressView.m
//  PrisonService
//
//  Created by calvin on 2018/4/10.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSRegisterProgressView.h"
#import "NSArray+MASAdditions.h"

#define ProgressTagSize CGSizeMake(30,30)
#define ProgressSidePadding 40
#define ProgressSideLineWidth 27

@interface PSRegisterProgressView ()

@property (nonatomic, strong) UIButton *personalButton;
@property (nonatomic, strong) UIButton *memberButton;
@property (nonatomic, strong) UIButton *cardButton;
@property (nonatomic, strong) UIButton *messageButton;
@property (nonatomic,strong)  UIButton *relationButton;

@end

@implementation PSRegisterProgressView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.memberButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.memberButton.userInteractionEnabled = NO;
        [self.memberButton setImage:[UIImage imageNamed:@"sessionMemberIcon"] forState:UIControlStateNormal];
        [self.memberButton setBackgroundImage:[UIImage imageNamed:@"sessionTaskBgNormal"] forState:UIControlStateNormal];
        [self.memberButton setBackgroundImage:[UIImage imageNamed:@"sessionTaskBgSelected"] forState:UIControlStateSelected];
        [self addSubview:self.memberButton];
        [self.memberButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.height.mas_equalTo(ProgressTagSize.height);
        }];
        
        self.cardButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cardButton.userInteractionEnabled = NO;
        [self.cardButton setImage:[UIImage imageNamed:@"sessionCardIcon"] forState:UIControlStateNormal];
        [self.cardButton setBackgroundImage:[UIImage imageNamed:@"sessionTaskBgNormal"] forState:UIControlStateNormal];
        [self.cardButton setBackgroundImage:[UIImage imageNamed:@"sessionTaskBgSelected"] forState:UIControlStateSelected];
        [self addSubview:self.cardButton];
        [self.cardButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.height.mas_equalTo(ProgressTagSize.height);
        }];
        
        
        self.relationButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.relationButton.userInteractionEnabled = NO;
        [self.relationButton setImage:[UIImage imageNamed:@"sessionRelationIcon"] forState:UIControlStateNormal];
        [self.relationButton setBackgroundImage:[UIImage imageNamed:@"sessionTaskBgNormal"] forState:UIControlStateNormal];
        [self.relationButton setBackgroundImage:[UIImage imageNamed:@"sessionTaskBgSelected"] forState:UIControlStateSelected];
        [self addSubview:self.relationButton];
        [self.relationButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.height.mas_equalTo(ProgressTagSize.height);
        }];
        
        
//        self.messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        self.messageButton.userInteractionEnabled = NO;
//        [self.messageButton setImage:[UIImage imageNamed:@"sessionMessageIcon"] forState:UIControlStateNormal];
//        [self.messageButton setBackgroundImage:[UIImage imageNamed:@"sessionTaskBgNormal"] forState:UIControlStateNormal];
//        [self.messageButton setBackgroundImage:[UIImage imageNamed:@"sessionTaskBgSelected"] forState:UIControlStateSelected];
//        [self addSubview:self.messageButton];
//        [self.messageButton mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.mas_equalTo(self);
//            make.height.mas_equalTo(ProgressTagSize.height);
//        }];
//
//
        
        
        CGFloat sidePadding = ProgressSidePadding + ProgressSideLineWidth;
        [@[self.memberButton,self.cardButton,self.relationButton] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:ProgressTagSize.width leadSpacing:sidePadding tailSpacing:sidePadding];
        
        UIFont *labelFont = FontOfSize(8);
        UIColor *labelTextColor = AppBaseTextColor1;
        NSTextAlignment labelAlignment = NSTextAlignmentCenter;
        CGFloat sideOffset = 10;
        CGFloat bottomOffset = 6;
        
      
        
        UILabel *memberLabel = [UILabel new];
        memberLabel.font = labelFont;
        memberLabel.textColor = labelTextColor;
        memberLabel.textAlignment = labelAlignment;
        NSString*VI_member=NSLocalizedString(@"VI_member", @"服刑人员");
        memberLabel.text = VI_member;
        [self addSubview:memberLabel];
        [memberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.memberButton.mas_left).offset(-sideOffset);
            make.right.mas_equalTo(self.memberButton.mas_right).offset(sideOffset);
            make.top.mas_equalTo(self.memberButton.mas_bottom).offset(bottomOffset);
            make.height.mas_equalTo(20);
        }];
        memberLabel.numberOfLines=0;
        
        UILabel *cardLabel = [UILabel new];
        cardLabel.font = labelFont;
        cardLabel.textColor = labelTextColor;
        cardLabel.textAlignment = labelAlignment;
        NSString*VI_card=NSLocalizedString(@"VI_card", @"上传身份证");
        cardLabel.text = VI_card;
        [self addSubview:cardLabel];
        [cardLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.cardButton.mas_left).offset(-sideOffset);
            make.right.mas_equalTo(self.cardButton.mas_right).offset(sideOffset);
            make.top.mas_equalTo(self.cardButton.mas_bottom).offset(bottomOffset);
            make.height.mas_equalTo(20);//12
        }];
        cardLabel.numberOfLines=0;
        
        UILabel *relationLabel = [UILabel new];
        relationLabel.font = labelFont;
        relationLabel.textColor = labelTextColor;
        relationLabel.textAlignment = labelAlignment;
        NSString*VI_relation=NSLocalizedString(@"VI_relation", @"服刑关系");
        relationLabel.text = VI_relation;
        [self addSubview:relationLabel];
        [relationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.relationButton.mas_left).offset(-sideOffset);
            make.right.mas_equalTo(self.relationButton.mas_right).offset(sideOffset);
            make.top.mas_equalTo(self.relationButton.mas_bottom).offset(bottomOffset);
            make.height.mas_equalTo(20);//12
        }];
        relationLabel.numberOfLines=0;
        
//        UILabel *messageLabel = [UILabel new];
//        messageLabel.font = labelFont;
//        messageLabel.textColor = labelTextColor;
//        messageLabel.textAlignment = labelAlignment;
//        NSString*VI_message=NSLocalizedString(@"VI_message", @"短信验证");
//        messageLabel.text = VI_message;
//        [self addSubview:messageLabel];
//        [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(self.messageButton.mas_left).offset(-sideOffset);
//            make.right.mas_equalTo(self.messageButton.mas_right).offset(sideOffset);
//            make.top.mas_equalTo(self.messageButton.mas_bottom).offset(bottomOffset);
//            make.height.mas_equalTo(20);//12
//        }];
//        messageLabel.numberOfLines=0;
        
        
    }
    return self;
}

- (void)setProgress:(PSRegisterProgress)progress {
    _progress = progress;
    switch (progress) {
    
        case PSRegisterProgressMember:
        {
            // self.personalButton.selected = YES;
            self.memberButton.selected = YES;
            self.cardButton.selected = NO;
            self.messageButton.selected = NO;
            self.relationButton.selected=NO;
        }
            break;
        case PSRegisterProgressIDCard:
        {
            // self.personalButton.selected = YES;
            self.memberButton.selected = YES;
            self.cardButton.selected = YES;
            self.messageButton.selected = NO;
            self.relationButton.selected=NO;
        }
            break;
            
            
        case PSRegisterProgressrelation:
        {
            // self.personalButton.selected = YES;
            self.memberButton.selected = YES;
            self.cardButton.selected = YES;
            self.relationButton.selected=YES;
            self.messageButton.selected = NO;
        }
            break;
//        case PSRegisterProgressMessage:
//        {
//            //self.personalButton.selected = YES;
//            self.memberButton.selected = YES;
//            self.cardButton.selected = YES;
//            self.relationButton.selected=YES;
//            self.messageButton.selected = YES;
//        }
//            break;
            
        default:
            break;
    }
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (self.progress >= PSRegisterProgressMember && self.progress <= PSRegisterProgressrelation) {
        UIColor *progressFocusColor = UIColorFromHexadecimalRGB(0x264c90);
        UIColor *progressCommonColor = UIColorFromHexadecimalRGB(0xb7b7b7);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(context, progressFocusColor.CGColor);
        CGContextSetLineWidth(context, 1.0);
        CGFloat startX = ProgressSidePadding;
        CGFloat focusX = ProgressSidePadding + ProgressSideLineWidth;
        CGFloat focusY = CGRectGetMidY(rect);
        CGContextMoveToPoint(context, startX, focusY);
        switch (self.progress) {
                //            case PSRegisterProgressPersonal:
                //            {
                //                focusX = CGRectGetMaxX(self.personalButton.frame);
                //            }
                //                break;
            case PSRegisterProgressMember:
            {
                focusX = CGRectGetMaxX(self.memberButton.frame);
            }
                break;
            case PSRegisterProgressIDCard:
            {
                focusX = CGRectGetMaxX(self.cardButton.frame);
            }
                break;
            case PSRegisterProgressrelation:
            {
                focusX = CGRectGetMaxX(self.relationButton.frame);
            }
                break;
//            case PSRegisterProgressMessage:
//            {
//                focusX = CGRectGetMaxX(self.messageButton.frame);
//            }
//                break;
            default:
                //            {
                //                //focusX = CGRectGetMaxX(self.messageButton.frame);
                //                 focusX = CGRectGetMaxX(self.relationButton.frame);
                //            }
                break;
        }
        CGContextAddLineToPoint(context, focusX, focusY);
        CGContextStrokePath(context);
        CGContextSetStrokeColorWithColor(context, progressCommonColor.CGColor);
        CGFloat endX = CGRectGetWidth(rect) - ProgressSidePadding;
        CGContextMoveToPoint(context, focusX, focusY);
        CGContextAddLineToPoint(context, endX, focusY);
        CGContextStrokePath(context);
    }
}

@end
