//
//  PSLocalMeetingRouteCell.h
//  PrisonService
//
//  Created by calvin on 2018/5/17.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYText.h"

@interface PSLocalMeetingRouteCell : UITableViewCell

@property (nonatomic, strong, readonly) UIButton *cancelButton;
@property (nonatomic, strong, readonly) UILabel *prisonLabel;
@property (nonatomic, strong, readonly) UILabel *locateLabel;
@property (nonatomic, strong, readonly) YYLabel *routeLabel;

+ (CGFloat)cellHeightWithRouteString:(NSAttributedString *)routeString;
- (void)updateRouteString:(NSAttributedString *)routeString;

@end
