//
//  EssenceViewController.m
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/28.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "EssenceViewController.h"
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
}

#pragma mark - 初始化
- (UITableView *)mainTableView
{
    if (!_mainTableView) {
        CGFloat naviH = CGRectGetMaxY(self.navigationController.navigationBar.frame);
        CGFloat tarbarH = CGRectGetHeight(self.tabBarController.tabBar.frame);
        self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - naviH - tarbarH) style:(UITableViewStylePlain)];
        self.mainTableView.delegate = self;
        self.mainTableView.dataSource = self;
        [self.mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
        self.mainTableView.tableFooterView = [UIView new];
        [self.view addSubview:_mainTableView];
    }return _mainTableView;
}

#pragma mark - 获取数据
- (void)readData
{
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    return cell;
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
