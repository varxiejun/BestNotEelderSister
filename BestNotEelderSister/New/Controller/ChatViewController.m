//
//  ChatViewController.m
//  Text-Chat
//
//  Created by 看楼听雨 on 16/5/1.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.enableSaveNewPhotoToLocalSystem = YES;
    
    //  默认No，如果Yes，开启右上角和右下角未读个数icon
    self.enableUnreadMessageIcon = YES;
    
    //  开启消息提醒
    self.enableNewComingMessageIcon=YES;
    
    //如果是单聊，不显示发送方昵称
    if (self.conversationType == ConversationType_PRIVATE) {
        self.displayUserNameInCell = YES;
    }
    
    //  删除自定义面板功能
    [self.pluginBoardView removeItemAtIndex:2];}

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
