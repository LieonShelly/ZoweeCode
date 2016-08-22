//
//  loginViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "loginViewController.h"
#import "userManager.h"
#import "THBaseRequestApi.h"
#import "THloginMessage.h"
#import "ZELoginModel.h"
#import "YTKNetworkPrivate.h"
#import "CYLTabBarController.h"
#import "HZURLNavigation.h"
#import "CYLTabBarController.h"

@interface loginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *phoneNumber;
@property (weak, nonatomic) IBOutlet UIView *passWord;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;

@end

@implementation loginViewController
-(BOOL)shouldAutorotate{
    
    return YES;
    
}//是否支持旋转

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskPortrait;
    
}//支持的方向

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUIInit];
    self.phoneTextField.text = [userManager sharedInstance].loginName;
    self.passWordTextField.text = [userManager sharedInstance].userPswd;
    // Do any additional setup after loading the view.
}
-  (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setUIInit {
    
    /**
     *  手机号输入框
     */
    self.phoneNumber.layer.masksToBounds = YES;
    self.phoneNumber.layer.cornerRadius = CGRectGetHeight(self.phoneNumber.frame) / 2;
    self.phoneNumber.layer.borderColor = [[UIColor colorWithHexString:@"cccbcb"] CGColor];
    self.phoneNumber.layer.borderWidth = 0.5;
    /**
     *  密码输入框
     */
    self.passWord.layer.masksToBounds = YES;
    self.passWord.layer.cornerRadius = CGRectGetHeight(self.passWord.frame) / 2;
    self.passWord.layer.borderColor = [[UIColor colorWithHexString:@"cccbcb"] CGColor];
    self.passWord.layer.borderWidth = 0.5;
    /**
     *  登录按钮
     */
    self.loginBtn.layer.masksToBounds = YES;
    self.loginBtn.layer.cornerRadius = CGRectGetHeight(self.loginBtn.frame) / 2;
}

#pragma mark - 手机号和密码输入框的代理方法

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField.tag == 100) {
        self.phoneNumber.layer.borderColor = [[UIColor colorWithHexString:@"ef403a"] CGColor];
    }else if (textField.tag == 101) {
        self.passWord.layer.borderColor = [[UIColor colorWithHexString:@"ef403a"] CGColor];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField.tag == 100) {
        self.phoneNumber.layer.borderColor = [[UIColor colorWithHexString:@"cccbcb"] CGColor];
    }else if (textField.tag == 101) {
        self.passWord.layer.borderColor = [[UIColor colorWithHexString:@"cccbcb"] CGColor];
    }
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.tag == 100) {
        NSInteger strLength = textField.text.length - range.length + string.length;
        if (strLength > 11){
            return NO;
        }
        NSCharacterSet *cs;
        cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
        NSString *filtered =
        [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""]; //按cs分离出数组,数组按@""分离出字符串
        BOOL basic = [string isEqualToString:filtered];
        return basic;
    }else if (textField.tag == 101) {
        NSCharacterSet *cs;
        cs = [[NSCharacterSet characterSetWithCharactersInString:kAlphaNum] invertedSet];
        NSString *filtered =
        [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""]; //按cs分离出数组,数组按@""分离出字符串
        BOOL basic = [string isEqualToString:filtered];
        return basic;
    }
    return YES;
}
#pragma mark - 按钮点击

- (IBAction)loginBtnClick:(id)sender {
    if (self.phoneTextField.text.length != 11) {
        [self showToastWithMsg:@"请输入正确的手机号"];
        return;
    }
    if (!(self.passWordTextField.text.length > 0)) {
        [self showToastWithMsg:@"请输入密码"];
        return;
    }
    [userManager sharedInstance].loginName = self.phoneTextField.text;
    [userManager sharedInstance].userPswd = self.passWordTextField.text;
    [self loagin];
}

- (void)loagin{
    NSDictionary *login =  @{
                             @"LoginName":[userManager sharedInstance].loginName,
                             @"PassWord":[YTKNetworkPrivate md5StringFromString:[userManager sharedInstance].userPswd],
                             @"UuID":[THloginMessage sharedInstance].uuid,
                             @"AppCode":@0,
                             @"DeviceCode":[THloginMessage sharedInstance].DeviceCode
                             };
    THBaseRequestApi *api = [[THBaseRequestApi alloc]initWithAction:@"LoginUser" Requestparameter:login];
    [api addAccessory:api];
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        if (request.responseJSONObject) {
            [self showToastWithMsg:@"登录成功"];
            ZELoginModel *model = [ZELoginModel mj_objectWithKeyValues:request.responseJSONObject];
            [[userManager sharedInstance] loginSuccessWith:model];
        }else{
            
        }
    } failure:^(YTKBaseRequest *request) {
         [self showToastWithMsg:@"错误"];
    }];
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
