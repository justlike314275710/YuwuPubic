//
//  PSCommentsViewController.m
//  PrisonService
//
//  Created by calvin on 2018/4/27.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSCommentsViewController.h"
#import "PSCommentCell.h"
#import "PSCommentHeaderView.h"
#import "NSString+Date.h"

@interface PSCommentsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *commentsTableView;

@end

@implementation PSCommentsViewController
- (instancetype)initWithViewModel:(PSViewModel *)viewModel {
    self = [super initWithViewModel:viewModel];
    if (self) {
        self.title = @"监狱长回复";
    }
    return self;
}

- (void)refreshData {
    PSCommentsViewModel *commentsViewModel = (PSCommentsViewModel *)self.viewModel;
    [[PSLoadingView sharedInstance] show];
    @weakify(self)
    [commentsViewModel requestCommentsCompleted:^(PSResponse *response) {
        @strongify(self)
        [[PSLoadingView sharedInstance] dismiss];
        [self.commentsTableView.mj_header endRefreshing];
        [self.commentsTableView reloadData];
    } failed:^(NSError *error) {
        [[PSLoadingView sharedInstance] dismiss];
        [self.commentsTableView.mj_header endRefreshing];
    }];
}

- (void)renderContents {
    self.commentsTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.commentsTableView.dataSource = self;
    self.commentsTableView.delegate = self;
    self.commentsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.commentsTableView.backgroundColor = [UIColor clearColor];
    @weakify(self)
    self.commentsTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self)
        [self refreshData];
    }];
    [self.commentsTableView registerClass:[PSCommentCell class] forCellReuseIdentifier:@"PSCommentCell"];
    [self.commentsTableView registerClass:[PSCommentHeaderView class] forHeaderFooterViewReuseIdentifier:@"PSCommentHeaderView"];
    self.commentsTableView.tableFooterView = [UIView new];
    [self.view addSubview:self.commentsTableView];
    [self.commentsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = AppBaseBackgroundColor2;
    [self renderContents];
    [self refreshData];
}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 70;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    PSCommentHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"PSCommentHeaderView"];
    PSCommentsViewModel *commentsViewModel = (PSCommentsViewModel *)self.viewModel;
    headerView.titleLabel.text = [NSString stringWithFormat:@"主题：%@",commentsViewModel.suggestion.title];
    headerView.contentLabel.text = commentsViewModel.suggestion.contents;
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    PSCommentsViewModel *commentsViewModel = (PSCommentsViewModel *)self.viewModel;
    return commentsViewModel.comments.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PSCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PSCommentCell"];
    PSCommentsViewModel *commentsViewModel = (PSCommentsViewModel *)self.viewModel;
    PSComment *comment = commentsViewModel.comments[indexPath.row];
    cell.contentsLabel.text = comment.contents;
    cell.dateLabel.text = [comment.createdAt timestampToDateString];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
