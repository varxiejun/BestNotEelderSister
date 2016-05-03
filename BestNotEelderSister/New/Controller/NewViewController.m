//
//  NewViewController.m
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/28.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "NewViewController.h"
#import "ChatViewController.h"
#import "Common.h"
#import "AppDelegate.h"
@interface NewViewController ()

@end

static NSInteger  numberID = 10;
@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    numberID = app.number_id;
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(100, 100, 100, 50);
    button.backgroundColor = [UIColor normalGray];
    [button setTitle:[NSString stringWithFormat:@"与%ld聊天",(long)numberID] forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(doTap) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
}

- (void)doTap
{
    ChatViewController *chat = [[ChatViewController alloc] initWithConversationType:ConversationType_PRIVATE targetId:[NSString stringWithFormat:@"%ld",(long)numberID]];
    chat.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chat animated:YES];
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
