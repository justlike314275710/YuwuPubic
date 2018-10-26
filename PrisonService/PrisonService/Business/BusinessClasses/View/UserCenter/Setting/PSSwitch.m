//
//  PSSwitch.m
//  PrisonService
//
//  Created by calvin on 2018/4/12.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSSwitch.h"

@interface PSSwitch ()

@property (nonatomic, strong) UISwitch *mySwitch;

@end

@implementation PSSwitch
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.mySwitch = [UISwitch new];
        self.mySwitch.onTintColor = UIColorFromHexadecimalRGB(0x6FE46F);
        CGFloat scaleX = frame.size.width / CGRectGetWidth(self.mySwitch.frame);
        CGFloat scaleY = frame.size.height / CGRectGetHeight(self.mySwitch.frame);
        self.mySwitch.transform = CGAffineTransformMakeScale(scaleX, scaleY);
        self.mySwitch.layer.position = CGPointMake(frame.size.width * scaleX, frame.size.height * scaleY);
        [self addSubview:self.mySwitch];
    }
    return self;
}

- (void)setOn:(BOOL)on {
    self.mySwitch.on = on;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
