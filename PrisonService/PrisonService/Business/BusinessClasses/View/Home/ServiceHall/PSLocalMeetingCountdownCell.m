//
//  PSLocalMeetingCountdownCell.m
//  PrisonService
//
//  Created by calvin on 2018/5/16.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSLocalMeetingCountdownCell.h"

@implementation PSLocalMeetingCountdownCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self renderContents];
    }
    return self;
}

- (void)renderContents {
    _countdownLabel = [UILabel new];
    _countdownLabel.textAlignment = NSTextAlignmentCenter;
    _countdownLabel.font = FontOfSize(16);
    _countdownLabel.textColor = UIColorFromHexadecimalRGB(0x333333);
    [self addSubview:_countdownLabel];
    [_countdownLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
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
