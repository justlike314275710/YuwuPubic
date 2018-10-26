//
//  UIAlertController+supportedInterfaceOrientations.m
//  Start
//
//  Created by calvin on 2017/8/2.
//  Copyright © 2017年 DingSNS. All rights reserved.
//

#import "UIAlertController+supportedInterfaceOrientations.h"

@implementation UIAlertController (supportedInterfaceOrientations)

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
