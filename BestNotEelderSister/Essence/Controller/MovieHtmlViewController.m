//
//  MovieHtmlViewController.m
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/4/5.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "MovieHtmlViewController.h"
#import "Common.h"
@interface MovieHtmlViewController ()
@property (nonatomic, strong) UIWebView *mainWebView;
@end

@implementation MovieHtmlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_mainWebView];
    [self.mainWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
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
