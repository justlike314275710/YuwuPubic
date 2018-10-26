//
//  PSAppointmentPrisonerCell.m
//  PrisonService
//
//  Created by calvin on 2018/4/20.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSAppointmentPrisonerCell.h"
#import "PSPrisonerCell.h"

@interface PSAppointmentPrisonerCell ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *prisonerCollectionView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation PSAppointmentPrisonerCell
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self renderContents];
    }
    return self;
}

- (void)reloadData {
    [self.prisonerCollectionView setContentOffset:CGPointZero];
    self.pageControl.currentPage = 0;
    [self.prisonerCollectionView reloadData];
}

- (NSInteger)currentPage {
    CGFloat pageWidth = CGRectGetWidth(self.prisonerCollectionView.frame);
    NSInteger currentPage = floor((self.prisonerCollectionView.contentOffset.x - pageWidth/ 2) / pageWidth)+ 1;
    return currentPage;
}

- (void)renderContents {
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    self.prisonerCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.prisonerCollectionView.showsHorizontalScrollIndicator = NO;
    self.prisonerCollectionView.showsVerticalScrollIndicator = NO;
    self.prisonerCollectionView.backgroundColor = AppBaseBackgroundColor2;
    self.prisonerCollectionView.dataSource = self;
    self.prisonerCollectionView.delegate = self;
    self.prisonerCollectionView.pagingEnabled = YES;
    self.prisonerCollectionView.bounces = NO;
    [self.prisonerCollectionView registerClass:[PSPrisonerCell class] forCellWithReuseIdentifier:@"PSPrisonerCell"];
    [self addSubview:self.prisonerCollectionView];
    [self.prisonerCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    self.pageControl = [UIPageControl new];
    self.pageControl.enabled = NO;
    self.pageControl.numberOfPages = 4;
    self.pageControl.pageIndicatorTintColor = AppBaseTextColor2;
    self.pageControl.currentPageIndicatorTintColor = AppBaseTextColor3;
    self.pageControl.hidesForSinglePage = YES;
    self.pageControl.currentPage = 0;
    [self addSubview:self.pageControl];
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-10);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(20);
    }];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger rows = 0;
    if (self.numberOfPrisoner) {
        rows = self.numberOfPrisoner();
    }
    self.pageControl.numberOfPages = rows;
    return rows;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(SCREEN_WIDTH, 135);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PSPrisonerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PSPrisonerCell" forIndexPath:indexPath];
    @weakify(self)
    @weakify(cell)
    [cell.appointmentButton bk_whenTapped:^{
        @strongify(self)
        @strongify(cell)
        if (self.appointIndex) {
            self.appointIndex([collectionView indexPathForCell:cell].row);
        }
    }];
    [cell.operationView bk_whenTapped:^{
        @strongify(self)
        if (self.bindAction) {
            self.bindAction();
        }
    }];
    if (self.nameOfPrisoner) {
        cell.prisonerLabel.text = self.nameOfPrisoner(indexPath.row);
    }
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageControl.currentPage = [self currentPage];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    self.pageControl.currentPage = [self currentPage];
    if (self.scrollToIndex) {
        self.scrollToIndex(self.pageControl.currentPage);
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.pageControl.currentPage = [self currentPage];
    if (self.scrollToIndex) {
        self.scrollToIndex(self.pageControl.currentPage);
    }
}

@end
