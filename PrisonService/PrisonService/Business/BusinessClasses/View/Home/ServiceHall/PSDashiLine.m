//
//  PSPeriodDashiLine.m
//  PrisonService
//
//  Created by calvin on 2018/4/16.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSDashiLine.h"

@implementation PSDashiLine
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.lineColor = UIColorFromHexadecimalRGB(0xebebeb);
    }
    return self;
}

- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
    CGFloat lengths[] = {5,3};
    CGContextSetLineDash(context, 0, lengths, 2);
    CGContextMoveToPoint(context, 0, CGRectGetMidY(rect));
    CGContextAddLineToPoint(context, CGRectGetWidth(rect), CGRectGetMidY(rect));
    CGContextStrokePath(context);
}

@end
