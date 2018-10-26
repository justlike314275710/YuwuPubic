//
//  PSPinmoneyTableViewCell.m
//  PrisonService
//
//  Created by 狂生烈徒 on 2018/7/25.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSPinmoneyTableViewCell.h"

@implementation PSPinmoneyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        CGFloat sidePadding = 15;
        CGFloat verPadding = 6;
        CGFloat labelHeight = 40;
        CGFloat widthLab=(SCREEN_WIDTH-15-4*verPadding)/4;
        _dateLabel = [UILabel new];
        _dateLabel.font = FontOfSize(30);
        _dateLabel.textColor = AppBaseTextColor1;
        _dateLabel.textAlignment = NSTextAlignmentLeft;
        
        [self.contentView addSubview:_dateLabel];
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(sidePadding);
            make.width.mas_equalTo(widthLab);
            make.bottom.mas_equalTo(self.contentView).offset(-sidePadding);
            make.height.mas_equalTo(labelHeight);
        }];
        
        _expenditureLabel=[UILabel new];
        _expenditureLabel.font=AppBaseTextFont2;
        _expenditureLabel.textAlignment=NSTextAlignmentLeft;
        [self.contentView addSubview:_expenditureLabel];
        _expenditureLabel.numberOfLines=0;
        [ _expenditureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_dateLabel.mas_right).offset(verPadding);
            make.width.mas_equalTo(widthLab);
            make.bottom.mas_equalTo(self.contentView).offset(-verPadding);
            make.height.mas_equalTo(labelHeight);
        }];
        
        _incomeLabel=[UILabel new];
        _incomeLabel.font=AppBaseTextFont2;
        _incomeLabel.textAlignment=NSTextAlignmentLeft;
        [self.contentView addSubview:_incomeLabel];
        _incomeLabel.numberOfLines=0;
        [ _incomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_expenditureLabel.mas_right).offset(verPadding);
            make.width.mas_equalTo(widthLab);
            make.bottom.mas_equalTo(self.contentView).offset(-verPadding);
            make.height.mas_equalTo(labelHeight);
        }];
        
        
        _balanceLabel=[UILabel new];
        _balanceLabel.font=AppBaseTextFont2;
        _balanceLabel.textAlignment=NSTextAlignmentLeft;
        [self.contentView addSubview:_balanceLabel];
        [ _balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_incomeLabel.mas_right).offset(verPadding);
            make.width.mas_equalTo(widthLab);
            make.bottom.mas_equalTo(self.contentView).offset(-verPadding);
            make.height.mas_equalTo(labelHeight);
        }];
        _balanceLabel.numberOfLines=0;
        
        UIView*lineView=[UIView new];
        lineView.backgroundColor=UIColorFromRGB(229, 229, 229);
        [self.contentView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-sidePadding);
            make.left.mas_equalTo(sidePadding);
            make.bottom.mas_equalTo(2);
            make.height.mas_equalTo(1);
        }];


    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
