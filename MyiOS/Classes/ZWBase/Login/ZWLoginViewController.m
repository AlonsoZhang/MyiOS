//
//  ZWLoginViewController.m
//  MyiOS
//
//  Created by Alonso on 2018/9/4.
//  Copyright © 2018 Alonso. All rights reserved.
//

#import "ZWLoginViewController.h"
#import "AppDelegate.h"
#import "NetworkTool.h"
#import "ZWRequestManager.h"
@interface ZWLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *ZWUserNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ZWUserPasswordTextField;

@end

@implementation ZWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ZWRGBColor(206, 218, 229);
    //    [(AppDelegate*)AppDelegateInstance setUpHomeViewController];
}
- (IBAction)loginButton:(UIButton *)sender {
    //[(AppDelegate*)AppDelegateInstance setUpHomeViewController];
    
    //    NSString *username = _ZWUserNameTextField.text;
    //    NSString *psd = _ZWUserPasswordTextField.text;
    //    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    //    NSDictionary *dic = @{
    //                          @"flowNo": @"111111",
    //                          @"object": @{
    //                                  @"username": username,
    //                                  @"password": psd
    //                                  }
    //                          };
    //
    //    [[ZWRequestManager sharedManager] POST:@"http://118.184.186.2:8088//auth_s/auth-user/login"
    //                                 parameters:dic completion:^(ZWBaseResponse *response) {
    //           [(AppDelegate*)AppDelegateInstance setUpHomeViewController];
    ////                                      NSLog(@"%@",response);
    //                                 }];
    
    
    //    NSDictionary *dic = @{
    //                          @"flowNo": @"111111",
    //                          @"object": @{
    //                                  @"username": username,
    //                                  @"password": psd
    //                                  }
    //                          };
    //
    //    if ([username isEqualToString:@""]) {
    //        [[NetworkTool shareNetwork] POST:@"http://118.184.186.2:8088//auth_s/auth-user/login" Params:dic Success:^(id responseObject) {
    //            NSLog(@"%@",responseObject);
    //
    //
    //
    //        } Failure:^(NSError *error) {
    //
    //            NSLog(@"%@",error);
    //
    //
    //        }];
    //    }
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
