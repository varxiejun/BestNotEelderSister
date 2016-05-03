//
//  LoginViewController.m
//  BestNotEelderSister
//
//  Created by 看楼听雨 on 16/3/30.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "LoginViewController.h"
#import "XJViewController.h"
#import "Common.h"
#import "AppDelegate.h"
#import <ReactiveCocoa.h>

#define kRegextestMobile    @"^1([3|5|7|8|])[0-9]{9}$"  //手机正则
#define weakify(...) \
rac_keywordify \
metamacro_foreach_cxt(rac_weakify_,, __weak, __VA_ARGS__)
@interface LoginViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

static NSString *userName = @"username";
static NSString *passWord = @"password";
@implementation LoginViewController
{
    BOOL _isLogin;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
     NSPredicate *phonePred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",kRegextestMobile];
    NSUserDefaults *userdef =[NSUserDefaults standardUserDefaults];
    NSString *user = [userdef objectForKey:userName];
    if (user && user.length == 11) {
        _isLogin = YES;
        [self login:self.loginBtn];
    }else{
        // 通过RAC进行模拟登陆
        [[RACSignal combineLatest:@[self.username.rac_textSignal, self.password.rac_textSignal]
                           reduce:^(NSString *firstName, NSString *lastName){
                               return @([phonePred evaluateWithObject:firstName] && lastName.length > 5);
                           }] setKeyPath:@"enabled" onObject:self.loginBtn];
    }
}
- (IBAction)login:(UIButton *)sender {
    XJViewController *xjVC = [[XJViewController alloc] init];
    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    [UIView animateWithDuration:0.5f animations:^{
        app.window.rootViewController = xjVC; 
    }];
    XJLog(@"login");
    NSUserDefaults *userdef =[NSUserDefaults standardUserDefaults];
    if (_isLogin) {
        NSLog(@"====");
    }else{
        [userdef setObject:self.username.text forKey:@"username"];
        [userdef setObject:self.password.text forKey:@"password"];
    }
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
