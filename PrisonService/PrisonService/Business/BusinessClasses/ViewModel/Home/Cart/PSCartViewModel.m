//
//  PSCartViewModel.m
//  PrisonService
//
//  Created by calvin on 2018/5/14.
//  Copyright © 2018年 calvin. All rights reserved.
//

#import "PSCartViewModel.h"

@implementation PSCartViewModel
@synthesize phoneCard = _phoneCard;

- (void)setPhoneCard:(PSPhoneCard *)phoneCard {
    _phoneCard = phoneCard;
    _products = @[phoneCard];
    [self updateData];
}

- (void)selectedAllProducts:(BOOL)selected {
    CGFloat amount = 0.f;
    NSInteger quantity = 0;
    for (PSProduct *product in _products) {
        product.selected = selected;
        if (selected) {
            CGFloat price = product.price ;
            //> 0 ? product.price : product.defaultPrice;
            amount += price * product.quantity;
            quantity += product.quantity;
        }
    }
    _amount = amount;
    _totalQuantity = quantity;
    _totalSelected = selected;
}

- (void)updateData {
    CGFloat amount = 0.f;
    NSInteger quantity = 0;
    BOOL allSelected = YES;
    for (PSProduct *product in _products) {
        if (product.selected) {
            CGFloat price = product.price;
            //> 0 ? product.price : product.defaultPrice;
            amount += price * product.quantity;
            quantity += product.quantity;
        }else{
            allSelected = NO;
        }
    }
    _amount = amount;
    _totalQuantity = quantity;
    _totalSelected = allSelected;
}

- (void)selectOperationAtIndex:(NSInteger)index {
    if (index >= 0 && index < self.products.count) {
        PSProduct *product = self.products[index];
        product.selected = !product.selected;
        [self updateData];
    }
}

- (void)reduceOperationAtIndex:(NSInteger)index {
    if (index >= 0 && index < self.products.count) {
        PSProduct *product = self.products[index];
        if (product.quantity > 1) {
            product.quantity --;
            [self updateData];
        }
    }
}

- (void)increaseOperationAtIndex:(NSInteger)index {
    if (index >= 0 && index < self.products.count) {
        PSProduct *product = self.products[index];
        product.quantity ++;
        [self updateData];
    }
}

@end
