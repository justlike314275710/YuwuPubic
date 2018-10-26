//
//  PSAppointmentInfoCell.m
//  PrisonService
//
//  Created by calvin on 2018/4/12.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSAppointmentInfoCell.h"

@implementation PSAppointmentInfoCell
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _appointmentView = [PSAppointmentView new];
        [self addSubview:self.appointmentView];
        [self.appointmentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
    }
    return self;
}

@end
