//
//  PSClockView.m
//  PrisonService
//
//  Created by calvin on 2018/5/16.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSClockView.h"

@interface PSProgressView : UIView

@property (nonatomic, assign) CGFloat progress;

@end

@implementation PSProgressView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGPoint center = CGPointMake(CGRectGetWidth(rect)/2, CGRectGetHeight(rect)/2);
    CGFloat radius = CGRectGetHeight(rect)/2;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, UIColorFromHexadecimalRGB(0x3ec592).CGColor);
    CGContextMoveToPoint(context, center.x, center.y);
    CGFloat startAngle = M_PI * 3 / 2;
    CGFloat endAngle = startAngle + M_PI * 2 * self.progress;
    CGContextAddArc(context, center.x, center.y, radius, startAngle, endAngle, 0);
    CGContextFillPath(context);
}

@end

@interface PSClockView()

@property (nonatomic, strong) UIImageView *hourHand;
@property (nonatomic, strong) PSProgressView *progressView;

@end

@implementation PSClockView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self renderContents];
    }
    return self;
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    _hourHand.layer.transform = CATransform3DMakeRotation(M_PI * 2 * progress, 0, 0, 1.0);
    _progressView.progress = progress;
}

- (void)renderContents {
    UIImageView *circleFourImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"localMeetingClockCircleFour"]];
    circleFourImageView.contentMode = UIViewContentModeCenter;
    [self addSubview:circleFourImageView];
    [circleFourImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    UIImageView *circleOneImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"localMeetingClockCircleOne"]];
    circleOneImageView.contentMode = UIViewContentModeCenter;
    [self addSubview:circleOneImageView];
    [circleOneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    UIImageView *circleTwoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"localMeetingClockCircleTwo"]];
    circleTwoImageView.contentMode = UIViewContentModeCenter;
    [self addSubview:circleTwoImageView];
    [circleTwoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    UIImageView *circleThreeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"localMeetingClockCircleThree"]];
    circleThreeImageView.contentMode = UIViewContentModeCenter;
    [self addSubview:circleThreeImageView];
    [circleThreeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    _hourHand = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"localMeetingClockHourHand"]];
    _hourHand.layer.anchorPoint = CGPointMake(0.5, 0.9);
    CGSize hSize = _hourHand.frame.size;
    [self addSubview:_hourHand];
    [_hourHand mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.mas_centerY).offset(hSize.height/2);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.size.mas_equalTo(hSize);
    }];
    _progressView = [PSProgressView new];
    [self insertSubview:_progressView belowSubview:_hourHand];
    [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(hSize.height * 2 * 0.9);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    self.progress = 0.f;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
 */

@end
