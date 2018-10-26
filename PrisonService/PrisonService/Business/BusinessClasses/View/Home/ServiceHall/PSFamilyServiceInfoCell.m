//
//  PSFamilyServiceInfoCell.m
//  PrisonService
//
//  Created by calvin on 2018/4/13.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSFamilyServiceInfoCell.h"

@implementation PSFamilyServiceInfoCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        self.textLabel.font = FontOfSize(10);
        self.textLabel.textColor = UIColorFromHexadecimalRGB(0x8095aa);
        self.detailTextLabel.font = FontOfSize(10);
        self.detailTextLabel.textColor = AppBaseTextColor1;
        self.indentationWidth = 5;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect frame = self.imageView.frame;
    frame.origin.x = self.indentationLevel * self.indentationWidth;
    self.imageView.frame = frame;
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
