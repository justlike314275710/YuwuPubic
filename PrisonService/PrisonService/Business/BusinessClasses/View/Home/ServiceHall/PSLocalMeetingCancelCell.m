//
//  PSLocalMeetingCancelCell.m
//  PrisonService
//
//  Created by calvin on 2018/5/17.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSLocalMeetingCancelCell.h"

@implementation PSLocalMeetingCancelCell
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
    _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelButton.titleLabel.font = FontOfSize(12);
    [_cancelButton setTitleColor:AppBaseTextColor3 forState:UIControlStateNormal];
    _cancelButton.layer.cornerRadius = bSize.height/2;
    _cancelButton.layer.borderWidth = 2.0;
    _cancelButton.layer.borderColor = UIColorFromHexadecimalRGB(0x264C90).CGColor;
    NSString*cancel_meeting=NSLocalizedString(@"cancel_meeting", @"取消预约");
    [_cancelButton setTitle:cancel_meeting forState:UIControlStateNormal];
    [self addSubview:_cancelButton];
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
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
