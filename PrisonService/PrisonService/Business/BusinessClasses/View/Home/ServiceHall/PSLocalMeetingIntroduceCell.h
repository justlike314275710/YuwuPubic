//
//  PSLocalMeetingIntroduceCell.h
//  PrisonService
//
//  Created by calvin on 2018/5/16.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSString*(^IntroduceTextAtIndex)(NSInteger index);

@interface PSLocalMeetingIntroduceCell : UITableViewCell

@property (nonatomic, copy) IntroduceTextAtIndex textAtIndex;

@end
