//
//  PSBuyCardStepCell.m
//  PrisonService
//
//  Created by calvin on 2018/4/17.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBuyCardStepCell.h"
#import "PSTipsConstants.h"

//#define RectStartY 115
//#define RectStartX 30
static const CGFloat RectStartY=115;
static const CGFloat RectStartX=30;

@implementation PSBuyCardStepCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        [self renderContents];
    }
    return self;
}

- (void)renderContents {
    _titleLabel = [UILabel new];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = FontOfSize(16);
    _titleLabel.textColor = UIColorFromHexadecimalRGB(0x333333);
    NSString*shopping_cart=NSLocalizedString(@"shopping_cart", @"购物车");
    _titleLabel.text = shopping_cart;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(17);
    }];
    _moneyLabel = [UILabel new];
    _moneyLabel.textAlignment = NSTextAlignmentCenter;
    _moneyLabel.font = FontOfSize(14);
    _moneyLabel.textColor = UIColorFromHexadecimalRGB(0xff8a07);
    _moneyLabel.text = @"¥50";
    [self addSubview:_moneyLabel];
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel.mas_bottom).offset(13);
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(15);
    }];
    UILabel *intrLabel = [UILabel new];
    intrLabel.numberOfLines = 0;
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = 6;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSAttributedString *tipsString = [[NSAttributedString alloc] initWithString:BuyCardTips attributes:@{NSFontAttributeName:FontOfSize(10),NSForegroundColorAttributeName:AppBaseTextColor2,NSParagraphStyleAttributeName:paragraphStyle}];
    intrLabel.attributedText = tipsString;
    [self addSubview:intrLabel];
    [intrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_moneyLabel.mas_bottom).offset(13);
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(30);
    }];
    
    CGFloat startY = RectStartY;
    CGFloat horSpace = RectStartX + 20;
    UILabel *step1Label = [UILabel new];
    step1Label.numberOfLines = 0;
    paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = 5;
    NSMutableAttributedString *step1TipsString = [NSMutableAttributedString new];
    [step1TipsString appendAttributedString:[[NSAttributedString alloc] initWithString:@"० " attributes:@{NSFontAttributeName:FontOfSize(12),NSForegroundColorAttributeName:AppBaseTextColor3,NSParagraphStyleAttributeName:paragraphStyle}]];
    [step1TipsString appendAttributedString:[[NSAttributedString alloc] initWithString:BuyCardStep1 attributes:@{NSFontAttributeName:FontOfSize(10),NSForegroundColorAttributeName:AppBaseTextColor1,NSParagraphStyleAttributeName:paragraphStyle}]];
    step1Label.attributedText = step1TipsString;
    [self addSubview:step1Label];
    [step1Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(startY);
        make.left.mas_equalTo(horSpace);
        make.right.mas_equalTo(self.mas_centerX);
        make.height.mas_equalTo(105);
    }];
    UIImage *step1Image = [UIImage imageNamed:@"appointmentStepOne"];
    UIImageView *step1ImageView = [UIImageView new];
    step1ImageView.contentMode = UIViewContentModeRight;
    step1ImageView.image = step1Image;
    [self addSubview:step1ImageView];
    [step1ImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(startY);
        make.right.mas_equalTo(-horSpace);
        make.left.mas_equalTo(self.mas_centerX);
        make.height.mas_equalTo(105);
    }];
    
    startY += 105;
    UIImage *step2Image = [UIImage imageNamed:@"appointmentStepThree"];
    UIImageView *step2ImageView = [UIImageView new];
    step2ImageView.contentMode = UIViewContentModeLeft;
    step2ImageView.image = step2Image;
    [self addSubview:step2ImageView];
    [step2ImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(startY);
        make.left.mas_equalTo(horSpace);
        make.right.mas_equalTo(self.mas_centerX);
        make.height.mas_equalTo(100);
    }];
    UILabel *step2Label1 = [UILabel new];
    paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = 5;
    paragraphStyle.alignment = NSTextAlignmentRight;
    NSMutableAttributedString *step2TipsString1 = [NSMutableAttributedString new];
    [step2TipsString1 appendAttributedString:[[NSAttributedString alloc] initWithString:@"第2步" attributes:@{NSFontAttributeName:FontOfSize(10),NSForegroundColorAttributeName:AppBaseTextColor1,NSParagraphStyleAttributeName:paragraphStyle}]];
    [step2TipsString1 appendAttributedString:[[NSAttributedString alloc] initWithString:@" ०" attributes:@{NSFontAttributeName:FontOfSize(12),NSForegroundColorAttributeName:AppBaseTextColor3,NSParagraphStyleAttributeName:paragraphStyle}]];
    step2Label1.attributedText = step2TipsString1;
    [self addSubview:step2Label1];
    [step2Label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(step2ImageView.mas_centerY);
        make.right.mas_equalTo(-horSpace);
        make.left.mas_equalTo(self.mas_centerX);
        make.height.mas_equalTo(13);
    }];
    UILabel *step2Label2 = [UILabel new];
    paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = 5;
    paragraphStyle.alignment = NSTextAlignmentRight;
    NSMutableAttributedString *step2TipsString2= [NSMutableAttributedString new];
    [step2TipsString2 appendAttributedString:[[NSAttributedString alloc] initWithString:BuyCardStep2 attributes:@{NSFontAttributeName:FontOfSize(10),NSForegroundColorAttributeName:AppBaseTextColor1,NSParagraphStyleAttributeName:paragraphStyle}]];
    step2Label2.attributedText = step2TipsString2;
    [self addSubview:step2Label2];
    [step2Label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(step2ImageView.mas_centerY).offset(5);
        make.right.mas_equalTo(-horSpace-10);
        make.left.mas_equalTo(self.mas_centerX);
        make.height.mas_equalTo(13);
    }];
    
    startY += 100;
    UILabel *step3Label = [UILabel new];
    step3Label.numberOfLines = 0;
    paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = 5;
    NSMutableAttributedString *step3TipsString = [NSMutableAttributedString new];
    [step3TipsString appendAttributedString:[[NSAttributedString alloc] initWithString:@"० " attributes:@{NSFontAttributeName:FontOfSize(12),NSForegroundColorAttributeName:AppBaseTextColor3,NSParagraphStyleAttributeName:paragraphStyle}]];
    [step3TipsString appendAttributedString:[[NSAttributedString alloc] initWithString:BuyCardStep3 attributes:@{NSFontAttributeName:FontOfSize(10),NSForegroundColorAttributeName:AppBaseTextColor1,NSParagraphStyleAttributeName:paragraphStyle}]];
    step3Label.attributedText = step3TipsString;
    [self addSubview:step3Label];
    [step3Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(startY);
        make.left.mas_equalTo(horSpace);
        make.right.mas_equalTo(self.mas_centerX);
        make.height.mas_equalTo(100);
    }];
    UIImage *step3Image = [UIImage imageNamed:@"appointmentStepThree"];
    UIImageView *step3ImageView = [UIImageView new];
    step3ImageView.contentMode = UIViewContentModeRight;
    step3ImageView.image = step3Image;
    [self addSubview:step3ImageView];
    [step3ImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(startY);
        make.right.mas_equalTo(-horSpace);
        make.left.mas_equalTo(self.mas_centerX);
        make.height.mas_equalTo(100);
    }];
    
    startY += 100;
    UILabel *amountTitleLabel = [UILabel new];
    amountTitleLabel.font = FontOfSize(10);
    amountTitleLabel.textAlignment = NSTextAlignmentLeft;
    amountTitleLabel.textColor = AppBaseTextColor1;
    amountTitleLabel.text = @"购买数量";
    [self addSubview:amountTitleLabel];
    [amountTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(horSpace);
        make.top.mas_equalTo(startY);
        make.height.mas_equalTo(40);
        make.right.mas_equalTo(self.mas_centerX);
    }];
    CGFloat btWidth = RectStartX + 10;
    CGFloat btHeight = 40;
    _increaseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _increaseButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_increaseButton setImage:[UIImage imageNamed:@"appointmentIncrease"] forState:UIControlStateNormal];
    [self addSubview:_increaseButton];
    [_increaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(startY);
        make.right.mas_equalTo(-RectStartX);
        make.width.mas_equalTo(btWidth);
        make.height.mas_equalTo(btHeight);
    }];
    _quantityLabel = [UILabel new];
    _quantityLabel.font = FontOfSize(10);
    _quantityLabel.textAlignment = NSTextAlignmentCenter;
    _quantityLabel.textColor = UIColorFromHexadecimalRGB(0x333333);
    _quantityLabel.layer.borderColor = UIColorFromHexadecimalRGB(0xebebeb).CGColor;
    _quantityLabel.layer.borderWidth = 0.5;
    _quantityLabel.text = @"1";
    [self addSubview:_quantityLabel];
    [_quantityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_increaseButton.mas_left);
        make.centerY.mas_equalTo(_increaseButton.mas_centerY);
        make.height.mas_equalTo(18);
        make.width.mas_equalTo(27);
    }];
    _reduceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _reduceButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_reduceButton setImage:[UIImage imageNamed:@"appointmentReduce"] forState:UIControlStateNormal];
    [self addSubview:_reduceButton];
    [_reduceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_quantityLabel.mas_left);
        make.top.mas_equalTo(_increaseButton.mas_top);
        make.bottom.mas_equalTo(_increaseButton.mas_bottom);
        make.width.mas_equalTo(_increaseButton.mas_width);
    }];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, UIColorFromHexadecimalRGB(0xebebeb).CGColor);
    CGContextSetLineWidth(context, 1.0);
    CGFloat horSpace = RectStartX;
    CGFloat startY = RectStartY;
    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    CGContextMoveToPoint(context, horSpace, startY);
    CGContextAddLineToPoint(context, width - horSpace, startY);
    CGContextAddLineToPoint(context, width - horSpace, height);
    CGContextAddLineToPoint(context, horSpace, height);
    CGContextAddLineToPoint(context, horSpace, startY);
    CGContextStrokePath(context);
    
    horSpace += 20;
    startY += 105;
    CGContextMoveToPoint(context, horSpace, startY);
    CGContextAddLineToPoint(context, width - horSpace, startY);
    CGContextStrokePath(context);
    
    startY += 100;
    CGContextMoveToPoint(context, horSpace, startY);
    CGContextAddLineToPoint(context, width - horSpace, startY);
    CGContextStrokePath(context);
    
    startY += 100;
    CGContextMoveToPoint(context, horSpace, startY);
    CGContextAddLineToPoint(context, width - horSpace, startY);
    CGContextStrokePath(context);
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
