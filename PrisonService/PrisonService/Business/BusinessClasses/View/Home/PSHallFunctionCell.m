//
//  PSHallFunctionCell.m
//  PrisonService
//
//  Created by calvin on 2018/4/12.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSHallFunctionCell.h"

@implementation PSHallFunctionCell
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _functionImageView = [UIImageView new];
        _functionImageView.contentMode = UIViewContentModeCenter;
        [self addSubview:_functionImageView];
        [_functionImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(27, 27));
            make.bottom.mas_equalTo(self.mas_centerY).offset(-5);
            make.centerX.mas_equalTo(self);
        }];
        _functionNameLabel = [UILabel new];
        _functionNameLabel.font = AppBaseTextFont2;
        _functionNameLabel.textColor = AppBaseTextColor1;
        _functionNameLabel.textAlignment = NSTextAlignmentCenter;
        _functionNameLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _functionNameLabel.numberOfLines=0;
        [self addSubview:_functionNameLabel];
        [_functionNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(-15);
            make.height.mas_equalTo(40);
            make.top.mas_equalTo(self.mas_centerY).offset(5);
        }];
    }
    return self;
}

- (void)setItemPosition:(PSItemPosition)itemPosition {
    _itemPosition = itemPosition;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context, UIColorFromHexadecimalRGB(0xeaebee).CGColor);
    switch (self.itemPosition) {
        case PSPositionOther:
        {
            CGContextMoveToPoint(context, 0, height);
            CGContextAddLineToPoint(context, width, height);
            CGContextAddLineToPoint(context, width, 0);
        }
            break;
        case PSPositionRowRight:
        {
            CGContextMoveToPoint(context, 0, height);
            CGContextAddLineToPoint(context, width, height);
        }
            break;
        case PSPositionLastRowOther:
        {
            CGContextMoveToPoint(context, width, height);
            CGContextAddLineToPoint(context, width, 0);
        }
            break;
        default:
            break;
    }
    CGContextStrokePath(context);
}

@end
