//
// Created by William Zhao on 13-7-9.
// Copyright (c) 2013 Vipshop Holdings Limited. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class PSRequest;
@class PSResponse;

/*!
 *  网络请求委托
 */
@protocol PSRequestDelegate <NSObject>
@required
/*!
 *  网络请求完成
 *
 *  @param request  PSRequest
 *  @param response PSResponse
 */
- (void)requestCompleted:(PSRequest *)request response:(PSResponse *)response;

/*!
 *  网络请求出错
 *
 *  @param request PSRequest
 *  @param error   NSError
 */
- (void)requestError:(PSRequest *)request error:(NSError *)error;
@end

typedef void (^PSRequestCompletedCallback)(PSRequest *request, PSResponse *response);

typedef void (^PSRequestErrorCallback)(PSRequest *request, NSError *error);
