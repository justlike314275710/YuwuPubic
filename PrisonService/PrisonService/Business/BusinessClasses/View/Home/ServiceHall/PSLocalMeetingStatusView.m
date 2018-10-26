//
//  PSLocalMeetingStatusView.m
//  PrisonService
//
//  Created by calvin on 2018/5/16.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSLocalMeetingStatusView.h"

@implementation PSLocalMeetingStatusView
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.status = PSLocalMeetingWithoutAppointment;
    }
    return self;
}

- (void)setStatus:(PSLocalMeetingStatus)status {
    _status = status;
    [self renderContents];
}

- (void)renderContents {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIImage *bgImage = [UIImage imageNamed:@"localMeetingBg"];
    CGFloat rate = bgImage.size.height/bgImage.size.width;
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:bgImage];
    bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-10);
        make.height.mas_equalTo(bgImageView.mas_width).multipliedBy(rate);
    }];
    switch (self.status) {
        case PSLocalMeetingWithoutAppointment:
        {
            UIImageView *bottomIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"localMeetingBottomIcon"]];
            [self addSubview:bottomIcon];
            [bottomIcon mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(self);
                make.bottom.mas_equalTo(bgImageView.mas_bottom);
                make.size.mas_equalTo(bottomIcon.frame.size);
            }];
            UIImageView *appointIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"localMeetingAppointIcon"]];
            [self addSubview:appointIcon];
            [appointIcon mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(self);
                make.bottom.mas_equalTo(bottomIcon.mas_top).offset(-10);
                make.size.mas_equalTo(appointIcon.frame.size);
            }];
        }
            break;
        case PSLocalMeetingPending:
        {
            UIImageView *bottomIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"localMeetingBottomIcon"]];
            [self addSubview:bottomIcon];
            [bottomIcon mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(self);
                make.bottom.mas_equalTo(bgImageView.mas_bottom);
                make.size.mas_equalTo(bottomIcon.frame.size);
            }];
            UIImageView *pendingIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"localMeetingPendingIcon"]];
            [self addSubview:pendingIcon];
            [pendingIcon mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(self);
                make.bottom.mas_equalTo(bottomIcon.mas_top).offset(-10);
                make.size.mas_equalTo(pendingIcon.frame.size);
            }];
        }
            break;
        case PSLocalMeetingCountdown:
        case PSLocalMeetingOntime:
        {
            _clock = [PSClockView new];
            [self addSubview:_clock];
            [_clock mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(self);
                make.bottom.mas_equalTo(bgImageView.mas_bottom);
                make.width.height.mas_equalTo(133);
            }];
        }
            break;
        default:
            break;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
