//
//  PSSelectDisplayViewController.h
//  PrisonService
//
//  Created by calvin on 2018/4/8.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSBusinessViewController.h"
#import "PSVisitorViewModel.h"

typedef void(^SelectedCallback)(NSInteger selectedIndex);

@interface PSSelectDisplayViewController : PSBusinessViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, copy) SelectedCallback callback;

- (UITableViewCell *)displayCell;

@end
