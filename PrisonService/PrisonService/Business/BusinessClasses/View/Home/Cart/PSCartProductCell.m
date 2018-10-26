//
//  PSCartProductCell.m
//  PrisonService
//
//  Created by calvin on 2018/5/14.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSCartProductCell.h"

@implementation PSCartProductCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self renderContents];
    }
    return self;
}

- (void)renderContents {
    CGFloat horSidePadding = 15;
    CGFloat verSidePadding = 15;
    UIView *mainView = [UIView new];
    [self addSubview:mainView];
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(horSidePadding);
        make.top.mas_equalTo(verSidePadding);
        make.right.mas_equalTo(-horSidePadding);
        make.bottom.mas_equalTo(0);
    }];
    UIImageView *bgImageView = [UIImageView new];
    bgImageView.image = [[UIImage imageNamed:@"serviceHallServiceBg"] stretchImage];
    [mainView addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    _selectStatusView = [UIButton buttonWithType:UIButtonTypeCustom];
    [_selectStatusView setImage:[UIImage imageNamed:@"cartProductNormal"] forState:UIControlStateNormal];
    [_selectStatusView setImage:[UIImage imageNamed:@"cartProductSelected"] forState:UIControlStateSelected];
    [mainView addSubview:_selectStatusView];
    [_selectStatusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(42);
    }];
    _productImageView = [UIImageView new];
    _productImageView.contentMode = UIViewContentModeScaleAspectFit;
    [mainView addSubview:_productImageView];
    [_productImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_selectStatusView.mas_right);
        make.centerY.mas_equalTo(mainView);
        make.width.height.mas_equalTo(54);
    }];
    CGFloat btWidth = 26;
    _increaseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _increaseButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_increaseButton setTitleColor:AppBaseTextColor2 forState:UIControlStateNormal];
    [_increaseButton setTitle:@"+" forState:UIControlStateNormal];
    [mainView addSubview:_increaseButton];
    [_increaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(btWidth);
    }];
    CGFloat qWidth = 34;
    CGFloat qHeight = 18;
    _quantityLabel = [UILabel new];
    _quantityLabel.font = FontOfSize(14);
    _quantityLabel.textAlignment = NSTextAlignmentCenter;
    _quantityLabel.textColor = AppBaseTextColor3;
    _quantityLabel.layer.borderColor = UIColorFromHexadecimalRGB(0x999999).CGColor;
    _quantityLabel.layer.borderWidth = 1.0;
    _quantityLabel.layer.cornerRadius = qHeight / 2;
    [mainView addSubview:_quantityLabel];
    [_quantityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_increaseButton.mas_left).offset(-5);
        make.centerY.mas_equalTo(_increaseButton);
        make.width.mas_equalTo(qWidth);
        make.height.mas_equalTo(qHeight);
    }];
    _reduceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _reduceButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_reduceButton setTitleColor:AppBaseTextColor2 forState:UIControlStateNormal];
    [_reduceButton setTitle:@"-" forState:UIControlStateNormal];
    [mainView addSubview:_reduceButton];
    [_reduceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_quantityLabel.mas_left).offset(-5);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(btWidth);
    }];
    CGFloat space = 10;
    _productNameLabel = [UILabel new];
    _productNameLabel.font = FontOfSize(10);
    _productNameLabel.textColor = AppBaseTextColor1;
    [mainView addSubview:_productNameLabel];
    [_productNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_productImageView.mas_right).offset(space);
        make.bottom.mas_equalTo(_productImageView.mas_centerY).offset(-5);
        make.right.mas_equalTo(_reduceButton.mas_left).offset(-space);
        make.height.mas_equalTo(11);
    }];
    _priceLabel = [UILabel new];
    _priceLabel.font = FontOfSize(14);
    _priceLabel.textColor = UIColorFromHexadecimalRGB(0xDC3B3B);
    [mainView addSubview:_priceLabel];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_productImageView.mas_right).offset(space);
        make.top.mas_equalTo(_productImageView.mas_centerY).offset(5);
        make.right.mas_equalTo(_reduceButton.mas_left).offset(-space);
        make.height.mas_equalTo(15);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
