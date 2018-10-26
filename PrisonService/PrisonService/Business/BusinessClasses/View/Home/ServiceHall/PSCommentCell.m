//
//  PSCommentCell.m
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSCommentCell.h"

@implementation PSCommentCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        [self renderContents];
    }
    return self;
}

- (void)renderContents {
    UIImageView *bgImageView = [UIImageView new];
    bgImageView.image = [[UIImage imageNamed:@"serviceHallServiceBg"] stretchImage];
    [self addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-15);
        make.bottom.mas_equalTo(0);
    }];
    UIView *mainView = [UIView new];
    mainView.backgroundColor = [UIColor clearColor];
    [self addSubview:mainView];
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(bgImageView.mas_left);
        make.top.mas_equalTo(bgImageView.mas_top);
        make.bottom.mas_equalTo(bgImageView.mas_bottom);
        make.right.mas_equalTo(bgImageView.mas_right);
    }];
    
    CGFloat horSideSpace = 10;
    CGFloat verSideSpace = 10;
    UILabel *titleLabel = [UILabel new];
    titleLabel.font = AppBaseTextFont1;
    titleLabel.textColor = AppBaseTextColor1;
    titleLabel.text = @"监狱长回复";
    [mainView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(horSideSpace);
        make.top.mas_equalTo(verSideSpace);
        make.right.mas_equalTo(mainView.mas_centerX);
        make.height.mas_equalTo(16);
    }];
    
    _dateLabel = [UILabel new];
    _dateLabel.font = AppBaseTextFont1;
    _dateLabel.textColor = AppBaseTextColor2;
    _dateLabel.textAlignment = NSTextAlignmentRight;
    [mainView addSubview:_dateLabel];
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(mainView.mas_centerX);
        make.top.mas_equalTo(titleLabel.mas_top);
        make.right.mas_equalTo(-horSideSpace);
        make.bottom.mas_equalTo(titleLabel.mas_bottom);
    }];
    
    _contentsLabel = [UILabel new];
    _contentsLabel.numberOfLines = 0;
    _contentsLabel.font = AppBaseTextFont1;
    _contentsLabel.textColor = AppBaseTextColor1;
    [mainView addSubview:_contentsLabel];
    [_contentsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(horSideSpace);
        make.top.mas_equalTo(titleLabel.mas_bottom).offset(10);
        make.right.mas_equalTo(-horSideSpace);
        make.bottom.mas_equalTo(-verSideSpace);
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
