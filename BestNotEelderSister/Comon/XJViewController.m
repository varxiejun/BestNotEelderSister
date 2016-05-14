//
//  XJViewController.m
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/28.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "XJViewController.h"
#import "XJNavigationController.h"
#import "EssenceViewController.h"
#import "NewViewController.h"
#import "AddViewController.h"
#import "FonsViewController.h"
#import "MineViewController.h"
#import "Common.h"
@interface XJViewController ()

@end

@implementation XJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildViewController];
    
}

- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    childVc.title = title;
    childVc.view.backgroundColor = [UIColor whiteColor];
    childVc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    if (title && title.length) {
        [childVc.tabBarItem setImageInsets:UIEdgeInsetsMake(-1, 0, 1, 0)];
        [childVc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -4)];
    }else{
        [childVc.tabBarItem setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];
    }
    
    [childVc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"999999" alpha:1.0],                                                                                                              NSForegroundColorAttributeName, nil] forState:(UIControlStateNormal)];
    [childVc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor normalBlue],                                                                                                              NSForegroundColorAttributeName, nil] forState:(UIControlStateSelected)];
    
    XJNavigationController *nav = [[XJNavigationController alloc] initWithRootViewController:childVc];
    nav.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:nav];
    
}

- (void)setupChildViewController
{
    EssenceViewController *essenceController = [[EssenceViewController alloc]init];
    [self setupChildViewController:essenceController title:@"精华" imageName:@"tarbar_infomation_normal" selectedImageName:@"tarbar_infomation_selected"];
    
    NewViewController *newController = [[NewViewController alloc]init];
    [self setupChildViewController:newController title:@"最新" imageName:@"tarbar_infomation_normal" selectedImageName:@"tarbar_infomation_selected"];
    
    AddViewController *addController = [[AddViewController alloc]init];
    [self setupChildViewController:addController title:@"" imageName:@"tarbar_infomation_normal" selectedImageName:@"tarbar_infomation_selected"];
    
    FonsViewController *fonsController = [[FonsViewController alloc]init];
    [self setupChildViewController:fonsController title:@"关注" imageName:@"tarbar_infomation_normal" selectedImageName:@"tarbar_infomation_selected"];
    
    MineViewController *mineController = [[MineViewController alloc]init];
    [self setupChildViewController:mineController title:@"我的" imageName:@"tarbar_infomation_normal" selectedImageName:@"tarbar_infomation_selected"];
    
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
