//
//  PSLocalMeetingIntroduceCell.m
//  PrisonService
//
//  Created by calvin on 2018/5/16.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSLocalMeetingIntroduceCell.h"
#import "SDCycleScrollView.h"
#import "PSIntroduceTextCell.h"

@interface PSLocalMeetingIntroduceCell()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *introduceScrollView;

@end

@implementation PSLocalMeetingIntroduceCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self renderContents];
    }
    return self;
}

- (void)renderContents {
//    _introduceScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:nil];
//    _introduceScrollView.localizationImageNamesGroup = @[@"",@"",@""];
//    _introduceScrollView.backgroundColor = [UIColor whiteColor];
//    _introduceScrollView.autoScrollTimeInterval = 5.0;
//    _introduceScrollView.pageDotImage = [UIImage imageNamed:@"localMeetingDotNormal"];
//    _introduceScrollView.currentPageDotImage = [UIImage imageNamed:@"localMeetingDotSelected"];
//    [self addSubview:_introduceScrollView];
//    [_introduceScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(UIEdgeInsetsZero);
//    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - SDCycleScrollViewDelegate
- (Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view {
    return [PSIntroduceTextCell class];
}

- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view {
    PSIntroduceTextCell *textCell = (PSIntroduceTextCell *)cell;
    if (self.textAtIndex) {
        textCell.textLabel.text = self.textAtIndex(index);
    }
}

@end
