//
//  PSMessageCell.m
//  PrisonService
//
//  Created by calvin on 2018/4/12.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSMessageCell.h"

#define DefaultLabelHeight 26
#define VerSidePadding 6

@implementation PSMessageCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        CGFloat sidePadding = 15;
        CGFloat verPadding = VerSidePadding;
        CGFloat labelHeight = DefaultLabelHeight;
        _dateLabel = [UILabel new];
        _dateLabel.font = AppBaseTextFont2;
        _dateLabel.textColor = AppBaseTextColor1;
        _dateLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_dateLabel];
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-sidePadding);
            make.width.mas_equalTo(80);
            make.top.mas_equalTo(verPadding);
            make.height.mas_equalTo(labelHeight);
        }];
        
        _titleLabel = [UILabel new];
        _titleLabel.font = AppBaseTextFont1;
        _titleLabel.textColor = [UIColor darkGrayColor];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(sidePadding);
            make.right.mas_equalTo(_dateLabel.mas_left).offset(20);
            make.top.mas_equalTo(_dateLabel.mas_top);
            make.bottom.mas_equalTo(_dateLabel.mas_bottom);
        }];
        
        _contentLabel = [UILabel new];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = AppBaseTextFont2;
        _contentLabel.textColor = AppBaseTextColor1;
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_contentLabel];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(sidePadding);
            make.right.mas_equalTo(-sidePadding);
            make.bottom.mas_equalTo(-verPadding);
            make.top.mas_equalTo(_dateLabel.mas_bottom).offset(verPadding);
        }];
    }
    return self;
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
