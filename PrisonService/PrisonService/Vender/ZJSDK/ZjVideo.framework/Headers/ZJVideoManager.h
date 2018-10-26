//
//  ZJVideoManager.h
//  iosRN
//
//  Created by starcwl on 8/31/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridgeModule.h>

/*******************
 分辨率宽和高
 
 minWidth:分辨率宽
 minHeight:分辨率高
 
 *******************/
struct ZJVideoSize{
  NSInteger minWidth;
  NSInteger minHeight;
}ZJVideoSize;


/*******************
 通话过程中状态返回
 
 返回object:NSDictionary类型
 callstate: (NSNumber -- CallState类型) 返回状态
 reason : (NSString类型) 发生当前状态的原因
 
 *******************/
typedef enum _CallState{
  CallConnected,      /** < 视屏通话建立连接成功 > **/
  CallError,          /** < 视频通话建立过程中出现的错误 > **/
  CallEnd,            /** < 视频通话结束 > **/
  CallStateMute,      /** < 视频被静音 >  **/
  CallHappenError,    /** < 视频通话过程中出现的错误 > **/
}CallState;

NSString *const ZJCallDeclinedNotification = @"ZJCallDeclined";



@interface ZJVideoManager : NSObject <RCTBridgeModule>

//单例
+ (id)sharedManager;

//展示本端视频与远端视频的视图
@property(nonatomic,strong) UIView *conferenceView;


// 所有选项必填
- (void)connectTarget:(NSString *)target
                 name:(NSString *)name
             password:(NSString *)pwd
            apiServer:(NSString *)server
          bandwidthIn:(NSInteger )input
         bandwidthOut:(NSInteger )output
     showFunctionItem:(BOOL )isShow
   isAutoPrepresentVC:(BOOL )isAuto
            videoSize:(struct ZJVideoSize)videoSize
         expectedSize:(struct ZJVideoSize)expectedSize;

//切换本端音频
- (void)toggleLocalAudio;

//切换本端视频
- (void)toggleLocalVideo;

//切换摄像头
- (void)toggleCamera;

//退出当前会议室
- (void)outOfCurrentMeeting;

//结束当前会议
- (void)endAllMeeting;

@end
