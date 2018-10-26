//
//  PSLocalMeetingAppointCell.m
//  PrisonService
//
//  Created by calvin on 2018/5/17.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSLocalMeetingAppointCell.h"

@implementation PSLocalMeetingAppointCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self renderContents];
    }
    return self;
}

- (void)renderContents {
    CGSize bSize = CGSizeMake(89, 34);
    _appointButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _appointButton.titleLabel.font = FontOfSize(12);
    [_appointButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_appointButton setBackgroundImage:[[UIImage imageNamed:@"universalBtBg"] stretchImage] forState:UIControlStateNormal];
    NSString*reservation=NSLocalizedString(@"reservation", @"立即预约");
    [_appointButton setTitle:reservation forState:UIControlStateNormal];
    [self addSubview:_appointButton];
    [_appointButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(bSize);
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
