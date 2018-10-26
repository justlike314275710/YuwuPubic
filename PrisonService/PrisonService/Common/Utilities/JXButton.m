//
//  JXButton.m
//  JXButtonDemo
//
//  Created by pconline on 2016/11/28.
//  Copyright © 2016年 pconline. All rights reserved.
//

#import "JXButton.h"

@implementation JXButton

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

-(void)commonInit{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.titleLabel.font = [UIFont systemFontOfSize:12];
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleX = 0;
    CGFloat titleY = contentRect.size.height *0.5+45;
    CGFloat titleW = contentRect.size.width;
    return CGRectMake(titleX, titleY, titleW, 15);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageH = 64;
    return CGRectMake(CGRectGetMidX(contentRect)-32, CGRectGetMidY(contentRect)-32, imageH, imageH);
}

@end
