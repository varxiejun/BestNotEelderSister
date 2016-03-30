//
//  LoginViewController.m
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/30.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "LoginViewController.h"
#import "XJViewController.h"
#import "AppDelegate.h"
#import <ReactiveCocoa.h>

#define XJLog(x) (NSLog(@"x:%@",x))
#define kRegextestMobile    @"^1([3|5|7|8|])[0-9]{9}$"  //手机正则
#define weakify(...) \
rac_keywordify \
metamacro_foreach_cxt(rac_weakify_,, __weak, __VA_ARGS__)
@interface LoginViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
     NSPredicate *phonePred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",kRegextestMobile];
//    @weakify(self)
//    self.loginBtn.enabled = NO;
//    self.password.enabled = NO;
//    [[self.username.rac_textSignal filter:^BOOL(id value) {
//        if ([phonePred evaluateWithObject:value]) {
//            self_weak_.password.enabled = YES;
//        }else{
//            self_weak_.password.enabled = NO;
//            self_weak_.password.text = @"";
//        }
//        return [value length] == 11;
//    }] subscribeNext:^(id x) {
//       
//        [[self.password.rac_textSignal filter:^BOOL(id value) {
//            if ([value length] > 5) {
//                self.loginBtn.enabled = YES;
//            }else{
//                self.loginBtn.enabled = NO;
//            }
//            return [value length] > 5;
//        }] subscribeNext:^(id x) {
//           
//            XJLog(x);
//        }];
//    }];
    // 通过RAC进行模拟登陆
    [[RACSignal combineLatest:@[self.username.rac_textSignal, self.password.rac_textSignal]
      reduce:^(NSString *firstName, NSString *lastName){
          return @([phonePred evaluateWithObject:firstName] && lastName.length > 5);
      }] setKeyPath:@"enabled" onObject:self.loginBtn];
}
- (IBAction)login:(UIButton *)sender {
    XJViewController *xjVC = [[XJViewController alloc] init];
    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    app.window.rootViewController = xjVC;
    NSLog(@"aaaa");
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
