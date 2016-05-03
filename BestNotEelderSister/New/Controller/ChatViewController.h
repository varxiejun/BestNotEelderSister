//
//  ChatViewController.h
//  Text-Chat
//
//  Created by 看楼听雨 on 16/5/1.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>

@interface ChatViewController : RCConversationViewController

/**
 *  会话数据模型
 */
@property (strong,nonatomic) RCConversationModel *conversation;
@end
