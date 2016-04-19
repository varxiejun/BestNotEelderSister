//
//  EssenceViewController.m
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/28.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "EssenceViewController.h"
#import "EssenceManager.h"
#import "EssenceHeader.h"
#import "XJNetWork.h"
#import "DataModels.h"
#import "EssenceVideoCell.h"
#import "MoviePlayerController.h"
#import "MovieHtmlViewController.h"
#import "AppDelegate.h"
#import "Common.h"

@interface EssenceViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

static NSString * const cellID = @"cellID";

@implementation EssenceViewController
{
    BOOL      _lastpage; // 尾页
    NSInteger _currpage; // 当前页
}
- (NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        self.dataSource = [NSMutableArray array];
    }return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self readData];
}

#pragma mark - 初始化
- (UITableView *)mainTableView
{
    if (!_mainTableView) {
        CGFloat naviH = CGRectGetMaxY(self.navigationController.navigationBar.frame);
        CGFloat tarbarH = CGRectGetHeight(self.tabBarController.tabBar.frame);
        self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, naviH, ScreenWidth, ScreenHeight - naviH - tarbarH) style:(UITableViewStylePlain)];
        self.mainTableView.delegate = self;
        self.mainTableView.dataSource = self;
        [self.mainTableView registerClass:[EssenceVideoCell class] forCellReuseIdentifier:cellID];
        self.mainTableView.tableFooterView = [UIView new];
        [self.view addSubview:_mainTableView];
    }return _mainTableView;
}

#pragma mark - 获取数据
- (void)readData
{
    [EssenceManager EssenceListCompleteBlock:^(id result) {
       BaseClass *base =[BaseClass modelObjectWithDictionary:result];
        for (List *list in base.list) {
            [self.dataSource addObject:list];
        }
        [self.mainTableView reloadData];
    } FailureBlock:^(id error) {
        
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EssenceVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    List *model = _dataSource[indexPath.row];
    cell.model = model;
    __weak typeof(self)weakSelf = self;
    cell.play = ^(NSString *url,NSString *title){
        [weakSelf ssssWithUrl:url title:title];
    };
    return cell;
}

- (void)ssssWithUrl:(NSString *)url title:(NSString *)title
{
    MoviePlayerController *movie = [[MoviePlayerController alloc] init];
    movie.url = url;
    movie.titleName = title;
//    MovieHtmlViewController *movie = [[MovieHtmlViewController alloc] init];
//    movie.url = url;
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    appDelegate.isRotation = YES;
    movie.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:movie animated:YES];
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
