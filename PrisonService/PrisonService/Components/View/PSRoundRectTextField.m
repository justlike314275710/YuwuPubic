//
//  PSRoundRectTextField.m
//  PrisonService
//
//  Created by calvin on 2018/4/10.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSRoundRectTextField.h"

@implementation PSRoundRectTextField
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 0)];
        self.leftViewMode = UITextFieldViewModeAlways;
        self.clearButtonMode =  UITextFieldViewModeWhileEditing;
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGFloat verOffset = 1.0;
    rect.origin.y += verOffset;
    rect.size.height -= 2 *verOffset;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context, UIColorFromHexadecimalRGB(0xebebeb).CGColor);
    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    CGFloat radius = height / 2;
    CGContextMoveToPoint(context, radius, CGRectGetMinY(rect));
    CGContextAddLineToPoint(context, width - radius,CGRectGetMinY(rect));
    CGContextAddArc(context, width - radius, radius + CGRectGetMinY(rect), radius, M_PI_2 * 3, M_PI * 2, 0);
    CGContextAddArc(context, width - radius, radius + CGRectGetMinY(rect), radius, 0, M_PI_2, 0);
    CGContextAddLineToPoint(context, radius, height + CGRectGetMinY(rect));
    CGContextAddArc(context, radius, radius + CGRectGetMinY(rect), radius, M_PI_2, M_PI, 0);
    CGContextAddArc(context, radius, radius + CGRectGetMinY(rect), radius, M_PI, M_PI_2 * 3, 0);
    CGContextStrokePath(context);
}

@end
