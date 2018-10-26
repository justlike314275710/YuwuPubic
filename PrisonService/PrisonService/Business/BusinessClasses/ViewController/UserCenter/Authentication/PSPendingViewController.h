//
//  PSPendingViewController.h
//  PrisonService
//
//  Created by calvin on 2018/4/19.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBusinessViewController.h"

@protocol PSPendingDataSource<NSObject>

@optional
- (NSString *)titleForPendingView;
- (NSString *)subTitleForPendingView;
- (NSString *)titleForOperationButton;

@end

@protocol PSPendingDelegate<NSObject>

@optional
- (void)pendingViewOperation;

@end

@interface PSPendingViewController : PSBusinessViewController

@property (nonatomic, weak) id<PSPendingDataSource> dataSource;
@property (nonatomic, weak) id<PSPendingDelegate> delegate;

@end
