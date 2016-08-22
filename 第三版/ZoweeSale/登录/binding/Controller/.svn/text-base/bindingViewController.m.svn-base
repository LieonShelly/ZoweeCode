//
//  bindingViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "bindingViewController.h"
#import "userManager.h"
#import "THBaseRequestApi.h"
#import "YTKNetworkPrivate.h"
#import "THloginMessage.h"
#import "HZURLNavigation.h"
#import "CYLTabBarController.h"
@interface bindingViewController ()
@property (weak, nonatomic) IBOutlet UITextField *joinNumber;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UIButton *bindingAndLoginBtn;

@end

@implementation bindingViewController
-(BOOL)shouldAutorotate{
    
    return YES;
    
}//是否支持旋转

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskPortrait;
    
}//支持的方向

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUIInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-  (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)setUIInit {
    self.bindingAndLoginBtn.layer.masksToBounds = YES;
    self.bindingAndLoginBtn.layer.cornerRadius = 5.0;
}


#pragma mark - UITextField 代理方法

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.tag == 100) {
//        NSInteger strLength = textField.text.length - range.length + string.length;
//        if (strLength > 11){
//            return NO;
//        }
        NSCharacterSet *cs;
        cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
        NSString *filtered =
        [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""]; //按cs分离出数组,数组按@""分离出字符串
        BOOL basic = [string isEqualToString:filtered];
        return basic;
    }else if (textField.tag == 101) {
//        NSCharacterSet *cs;
//        cs = [[NSCharacterSet characterSetWithCharactersInString:kAlphaNum] invertedSet];
//        NSString *filtered =
//        [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""]; //按cs分离出数组,数组按@""分离出字符串
//        BOOL basic = [string isEqualToString:filtered];
        return YES;
    }else if (textField.tag == 102) {
        NSCharacterSet *cs;
        cs = [[NSCharacterSet characterSetWithCharactersInString:kAlphaNum] invertedSet];
        NSString *filtered =
        [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""]; //按cs分离出数组,数组按@""分离出字符串
        BOOL basic = [string isEqualToString:filtered];
        return basic;
    }else if (textField.tag == 103) {
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
    }
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)bindAndLoginBtnClick:(id)sender {
    if (!(self.joinNumber.text.length > 0)) {
        [self showToastWithMsg:@"请输入加盟商编号"];
        return;
    }else if (!(self.userName.text.length > 0)) {
        [self showToastWithMsg:@"请输入用户名"];
        return;
    }else if (!(self.passWord.text.length > 0)) {
        [self showToastWithMsg:@"请输入密码"];
        return;
    }else if (self.phoneNumber.text.length != 11) {
        [self showToastWithMsg:@"请输入正确的手机号"];
        return;
    }
    
    [userManager sharedInstance].loginName = self.phoneNumber.text;
    [userManager sharedInstance].userPswd = self.passWord.text;
    
    NSDictionary *parmdic = @{
                              @"JoinNo":self.joinNumber.text,
                              @"LoginName":self.self.userName.text,
                              @"PassWord":[YTKNetworkPrivate md5StringFromString:self.passWord.text],
                              @"UserPhone":self.phoneNumber.text,
                              @"IdentifyingCode":@"",
                              @"UuID":[THloginMessage sharedInstance].uuid,
                              @"AppCode":@0,
                              @"DeviceCode":[THloginMessage sharedInstance].DeviceCode                              };
    THBaseRequestApi *api = [[THBaseRequestApi alloc]initWithAction:@"BindUser" Requestparameter:parmdic];
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        if (request.responseJSONObject) {
            [self showToastWithMsg:@"账号绑定成功"];
            ZELoginModel *model = [ZELoginModel mj_objectWithKeyValues:request.responseJSONObject];
            [[userManager sharedInstance] loginSuccessWith:model];
        }else{
            
        }
    } failure:^(YTKBaseRequest *request) {
        
    }];

}
@end
