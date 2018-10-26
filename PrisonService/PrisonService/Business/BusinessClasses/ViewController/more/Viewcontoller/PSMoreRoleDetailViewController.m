//
//  PSMoreRoleDetailViewController.m
//  PrisonService
//
//  Created by kky on 2018/10/25.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSMoreRoleDetailViewController.h"
#import "MoreRoloCell.h"

@interface PSMoreRoleDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableview;

@end

@implementation PSMoreRoleDetailViewController

#pragma mark - CycleLife
- (instancetype)initWithViewModel:(PSViewModel *)viewModel {
    self = [super initWithViewModel:viewModel];
    if (self) {
        NSString *title = NSLocalizedString(@"legal_service", @"财务纠纷");
//        title = @"财产纠纷";
        self.title = title;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=UIColorFromRGBA(248, 247, 254, 1);
    [self p_setUI];
}
#pragma mark - PrivateMethods
- (void)p_setUI {
    
    [self.view addSubview:self.myTableview];
    [self.myTableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0,0,0,0));
    }];
    [self.myTableview registerClass:MoreRoloCell.class forCellReuseIdentifier:@"MoreRoloCell"];
    @weakify(self);
    self.myTableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        NSLog(@"heee");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.myTableview.mj_header endRefreshing];
            [self.myTableview.mj_footer endRefreshing];
            [self.myTableview reloadData];
        });
    }];
   
  
}

#pragma mark - Delegate
//MARK:UITableViewDelegate&UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MoreRoloCell *cell = [[MoreRoloCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MoreRoloCell"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

#pragma mark - Setting&&Getting
- (UITableView *)myTableview {
    if (!_myTableview) {
        _myTableview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _myTableview.tableFooterView = [UIView new];
        _myTableview.backgroundColor = [UIColor clearColor];
        _myTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _myTableview.dataSource = self;
        _myTableview.delegate = self;
    }
    return _myTableview;
}


@end
