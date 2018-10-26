//
//  UIImage+Color.h
//  Common
//
//  Created by calvin on 14-5-5.
//  Copyright (c) 2014年 BuBuGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)imageByApplyingAlpha:(CGFloat)alpha image:(UIImage*)image;

@end
