//
//  PSDateView.m
//  PrisonService
//
//  Created by calvin on 2018/4/17.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSDateView.h"
#import "YYText.h"

@interface PSDateView ()

@property (nonatomic, strong) UILabel *monthLabel;
@property (nonatomic, strong) YYLabel *extraLabel;

@end

@implementation PSDateView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self renderContents];
    }
    return self;
}

- (void)setNowDate:(NSDate *)nowDate selectedDate:(NSDate *)seletedDate {
    if (!nowDate || !seletedDate) {
        return;
    }
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *nowDateComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:nowDate];
    nowDateComponents.hour = 0;
    nowDateComponents.second = 0;
    NSDate *newNowDate = [calendar dateFromComponents:nowDateComponents];
    NSDateComponents *selectedDateComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:seletedDate];
    selectedDateComponents.hour = 0;
    selectedDateComponents.second = 0;
    NSDate *newSelectedDate = [calendar dateFromComponents:selectedDateComponents];
    NSTimeInterval timeInterval = [newSelectedDate timeIntervalSinceDate:newNowDate];
    NSInteger days = ceil(timeInterval / (24*60*60));
    NSString *extraText = nil;
    if (days == 0) {
        extraText =NSLocalizedString(@"today", @"今天");
        //@"今天";
    }else if (days > 0) {
        NSString*today_after=NSLocalizedString(@"today_after", @"%ld天后");
        extraText = [NSString stringWithFormat:today_after,(long)days];
    }else{
        NSString*today_before=NSLocalizedString(@"today_before",@"%ld天前" );
        extraText = [NSString stringWithFormat:today_before,(long)-days];
    }
    NSString*new_month=NSLocalizedString(@"new_month", @"%ld月");
    self.monthLabel.text = [NSString stringWithFormat:new_month,(long)selectedDateComponents.month];
    [self.monthLabel sizeToFit];
    [self.monthLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(self.monthLabel.frame.size);
    }];
    UIFont *textFont = FontOfSize(9);
    NSMutableAttributedString *dateString = [NSMutableAttributedString new];
    NSString*year_month_day=NSLocalizedString(@"year_month_day", @"%ld年\n %ld日  %@ ");
    [dateString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:year_month_day,(long)selectedDateComponents.year,(long)selectedDateComponents.day,extraText] attributes:@{NSFontAttributeName:textFont,NSForegroundColorAttributeName:[UIColor whiteColor]}]];
    UIImage *arrowImage = [UIImage imageNamed:@"appointmentArrowIcon"];
    [dateString appendAttributedString:[NSAttributedString yy_attachmentStringWithContent:arrowImage contentMode:UIViewContentModeCenter attachmentSize:arrowImage.size alignToFont:textFont alignment:YYTextVerticalAlignmentCenter]];
    self.extraLabel.attributedText = dateString;
}

- (void)renderContents {
    UIColor *textColor = [UIColor whiteColor];
    self.monthLabel = [UILabel new];
    self.monthLabel.textAlignment = NSTextAlignmentLeft;
    self.monthLabel.font = FontOfSize(24);
    self.monthLabel.textColor = textColor;
    self.monthLabel.text = @"3月";
    [self.monthLabel sizeToFit];
    [self addSubview:self.monthLabel];
    [self.monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(self.monthLabel.frame.size);
    }];
    UIFont *textFont = FontOfSize(9);
    self.extraLabel = [YYLabel new];
    self.extraLabel.numberOfLines = 0;
    NSMutableAttributedString *dateString = [NSMutableAttributedString new];
    [dateString appendAttributedString:[[NSAttributedString alloc] initWithString:@"2018年\n 5日  今天 " attributes:@{NSFontAttributeName:textFont,NSForegroundColorAttributeName:[UIColor whiteColor]}]];
    UIImage *arrowImage = [UIImage imageNamed:@"appointmentArrowIcon"];
    [dateString appendAttributedString:[NSAttributedString yy_attachmentStringWithContent:arrowImage contentMode:UIViewContentModeCenter attachmentSize:arrowImage.size alignToFont:textFont alignment:YYTextVerticalAlignmentCenter]];
    self.extraLabel.attributedText = dateString;
    [self addSubview:self.extraLabel];
    [self.extraLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.monthLabel.mas_right).offset(10);
        make.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(-15);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
