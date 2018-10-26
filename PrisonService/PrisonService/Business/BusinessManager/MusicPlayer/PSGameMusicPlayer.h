//
//  STGameMusicPlayer.h
//  Start
//
//  Created by calvin on 2017/5/30.
//  Copyright © 2017年 DingSNS. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^GameSoundPlayerCompletionBlock)(void);

@interface PSGameMusicPlayer : NSObject

@property (nonatomic, assign) BOOL mute;

+ (PSGameMusicPlayer *)defaultPlayer;

/**
 * 播放音效
 * @param filename 音乐文件名
 * @param fileExtension 音乐文件扩展名
 * @param completionBlock 播放完成回调
 */
- (void)playSoundWithFilename:(NSString *_Nullable)filename
                fileExtension:(NSString *_Nullable)fileExtension
                   completion:(nullable GameSoundPlayerCompletionBlock)completionBlock;


/**
 * 播放背景音乐
 * @param filename 音乐文件名
 * @param fileExtension 文件扩展名
 * @param number 播放循环次数，小于0为无限循环
 */
- (void)playBackgroundMusicWithFilename:(NSString *_Nullable)filename
                          fileExtension:(NSString *_Nullable)fileExtension
                          numberOfLoops:(NSInteger)number;


/**
 * 播放背景音乐一次
 * @param filename 音乐文件名
 * @param fileExtension 文件扩展名
 */
- (void)playBackgroundMusicWithFilename:(NSString *_Nullable)filename
                          fileExtension:(NSString *_Nullable)fileExtension;

/**
 * 停止播放背景音乐
 */
- (void)stopBackgroundMusic;

@end
