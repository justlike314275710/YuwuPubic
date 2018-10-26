//
//  PSLocalMeetingRouteCell.m
//  PrisonService
//
//  Created by calvin on 2018/5/17.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSLocalMeetingRouteCell.h"
#import "PSDashiLine.h"

#define HorSidePadding 15
#define VerSidePadding 10
#define TopContentHeight 64

@implementation PSLocalMeetingRouteCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        [self renderContents];
    }
    return self;
}

+ (CGFloat)cellHeightWithRouteString:(NSAttributedString *)routeString {
    YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(SCREEN_WIDTH - 4 * HorSidePadding, MAXFLOAT) insets:UIEdgeInsetsZero];
    YYTextLayout *textLayout = [YYTextLayout layoutWithContainer:container text:routeString];
    return textLayout.textBoundingSize.height + 4 * VerSidePadding + TopContentHeight + 10;
}

- (void)updateRouteString:(NSAttributedString *)routeString {
    YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(SCREEN_WIDTH - 4 * HorSidePadding, MAXFLOAT) insets:UIEdgeInsetsZero];
    YYTextLayout *textLayout = [YYTextLayout layoutWithContainer:container text:routeString];
    self.routeLabel.attributedText = routeString;
    self.routeLabel.textLayout = textLayout;
}

- (void)renderContents {
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"localMeetingRouteBg"] stretchImage]];
    [self addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(HorSidePadding);
        make.right.mas_equalTo(-HorSidePadding);
        make.top.mas_equalTo(VerSidePadding);
        make.bottom.mas_equalTo(-VerSidePadding);
    }];
    PSDashiLine *line = [PSDashiLine new];
    line.lineColor = UIColorFromHexadecimalRGB(0x666666);
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(bgImageView.mas_left).offset(HorSidePadding);
        make.right.mas_equalTo(bgImageView.mas_right).offset(-HorSidePadding);
        make.top.mas_equalTo(bgImageView.mas_top).offset(64);
        make.height.mas_equalTo(1);
    }];
    UIView *topView = [UIView new];
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(line.mas_left);
        make.right.mas_equalTo(line.mas_right);
        make.top.mas_equalTo(bgImageView.mas_top);
        make.bottom.mas_equalTo(line.mas_top);
    }];
    UIImageView *locateImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"localMeetingLocateIcon"]];
    [topView addSubview:locateImageView];
    [locateImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.centerY.mas_equalTo(topView);
        make.size.mas_equalTo(locateImageView.frame.size);
    }];
    CGSize bSize = CGSizeMake(60, 24);
    _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelButton.titleLabel.font = FontOfSize(10);
    [_cancelButton setTitleColor:AppBaseTextColor3 forState:UIControlStateNormal];
    NSString*cancel_meeting=NSLocalizedString(@"cancel_meeting", @"取消预约");
    [_cancelButton setTitle:cancel_meeting forState:UIControlStateNormal];
    _cancelButton.layer.cornerRadius = bSize.height / 2;
    _cancelButton.layer.borderWidth = 1.0;
    _cancelButton.layer.borderColor = UIColorFromHexadecimalRGB(0x264C90).CGColor;
    [topView addSubview:_cancelButton];
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-HorSidePadding);
        make.centerY.mas_equalTo(topView);
        make.size.mas_equalTo(bSize);
    }];
    _prisonLabel = [UILabel new];
    _prisonLabel.font = FontOfSize(12);
    _prisonLabel.textColor = UIColorFromHexadecimalRGB(0x333333);
    [topView addSubview:_prisonLabel];
    [_prisonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(locateImageView.mas_right).offset(10);
        make.right.mas_equalTo(self.cancelButton.mas_left).offset(-10);
        make.bottom.mas_equalTo(topView.mas_centerY);
        make.height.mas_equalTo(18);
    }];
    _locateLabel = [UILabel new];
    _locateLabel.font = FontOfSize(10);
    _locateLabel.textColor = UIColorFromHexadecimalRGB(0x333333);
    [topView addSubview:_locateLabel];
    [_locateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(locateImageView.mas_right).offset(10);
        make.right.mas_equalTo(self.cancelButton.mas_left).offset(-10);
        make.top.mas_equalTo(topView.mas_centerY);
        make.height.mas_equalTo(16);
    }];
    _routeLabel = [YYLabel new];
    _routeLabel.numberOfLines = 0;
    [self addSubview:_routeLabel];
    [_routeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(line.mas_left);
        make.right.mas_equalTo(line.mas_right);
        make.top.mas_equalTo(line.mas_bottom).offset(VerSidePadding);
        make.bottom.mas_equalTo(bgImageView.mas_bottom).offset(-VerSidePadding-3);
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
