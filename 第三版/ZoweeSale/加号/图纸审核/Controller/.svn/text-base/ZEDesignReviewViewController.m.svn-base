//
//  ZEDesignReviewViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/17.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEDesignReviewViewController.h"
#import "customerManager.h"
#import "NSDate+string.h"
#import "UIButton+Extension.h"
#import "ZEXVoice.h"
#import "BRPlaceholderTextView.h"
#import "ZETHAlertView.h"
#import "ZEpriceReviewViewController.h"

@interface ZEDesignReviewViewController ()<IFlyRecognizerViewDelegate>

@property (nonatomic)  BRPlaceholderTextView *textView;

@property (nonatomic) UIView *bottomView;

@property (nonatomic, strong) ZEXVoice *voice;//带界面的识别对象

@end

@implementation ZEDesignReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self uiSetup];
    self.interface = @"ProjectVerify";
    //self.title = @"填写备注";
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //注册键盘出现与隐藏时候的通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboadWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}

//键盘出现时候调用的事件
-(void) keyboadWillShow:(NSNotification *)note{
    NSDictionary *info = [note userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//键盘的frame
    CGFloat offY = SCREEN_HEIGHT - keyboardSize.height;//屏幕总高度-键盘高度-间距
    _bottomView.bottom = offY;
}
//键盘消失时候调用的事件
-(void)keyboardWillHide:(NSNotification *)note{
    _bottomView.bottom = SCREEN_HEIGHT ;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)uiSetup{
    self.view.backgroundColor = hexColorString(@"f5f2f3");
    _textView = [[BRPlaceholderTextView alloc]init];
    _textView.placeholder = @"说点什么.....";
    [_textView becomeFirstResponder];
    _textView.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_textView];
    _textView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(300);
    UIView *voiceView = [UIView new];
    voiceView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:voiceView];
    voiceView.sd_layout
    .topSpaceToView(_textView,0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(40);
    UIButton *voiceBtn = [UIButton new];
    voiceBtn.image = @"Voice";
    [voiceBtn addTarget:self action:@selector(iflyBtnClick)];
    [voiceView addSubview:voiceBtn];
    voiceBtn.sd_layout
    .topEqualToView(voiceView)
    .rightEqualToView(voiceView)
    .bottomEqualToView(voiceView)
    .widthIs(40);
    
    _bottomView = [UIView new];
   // _bottomView.backgroundColor = hexColorString(@"f0eded");
    [self.view addSubview:_bottomView];
    _bottomView.width = SCREEN_WIDTH;
    _bottomView.height = 45;
    _bottomView.bottom = SCREEN_HEIGHT;
    _bottomView.left = 0;
    
    UIButton *refuceBtn = [UIButton new];
    refuceBtn.backgroundColor = hexColorString(@"f0eded");
    [refuceBtn setImage:[UIImage imageNamed:@"拒绝审核"] forState:UIControlStateNormal];
    [refuceBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [refuceBtn setTitle:@"拒接审核" forState:UIControlStateNormal];
    [refuceBtn addTarget:self action:@selector(refuseBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_bottomView addSubview:refuceBtn];
    refuceBtn.sd_layout
    .leftEqualToView(_bottomView)
    .topEqualToView(_bottomView)
    .bottomEqualToView(_bottomView)
    .widthRatioToView(_bottomView,0.5);
    
    UIButton *agreeBtn = [UIButton new];
    agreeBtn.backgroundColor = hexColorString(@"f0eded");
    [agreeBtn setImage:[UIImage imageNamed:@"同意审核"] forState:UIControlStateNormal];
    [agreeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [agreeBtn setTitle:@"同意审核" forState:UIControlStateNormal];
    [agreeBtn addTarget:self action:@selector(agreeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_bottomView addSubview:agreeBtn];
    agreeBtn.sd_layout
    .rightEqualToView(_bottomView)
    .topEqualToView(refuceBtn)
    .bottomEqualToView(_bottomView)
    .widthRatioToView(_bottomView,0.5);
}
- (void)refuseBtnClick{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    THBaseRequestApi *api = [[THBaseRequestApi alloc]initWithAction:_interface Requestparameter:[self netWorkingDicWith:@1] ModelClassName:@"ZEOrderReponseModel"];
    [api addAccessory:api];
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        if (request.responseJSONObject) {
            ZEOrderReponseModel *model = request.responseJSONObject;
            ZETHAlertView *alertView = [[ZETHAlertView alloc]initWithTitle:@"审核成功" customerID:_customer.CustomerID customerName:_customer.CustomerName OptionCode:model.OptionCode];
            [alertView showInWindowWithBackgoundTapDismissEnable:YES];
        }else{
            
        }
    } failure:^(YTKBaseRequest *request) {
        [self showToastWithMsg:@"错误"];
    }];
}

- (void)agreeBtnClick{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    THBaseRequestApi *api = [[THBaseRequestApi alloc]initWithAction:_interface Requestparameter:[self netWorkingDicWith:@0] ModelClassName:@"ZEOrderReponseModel"];
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        if (request.responseJSONObject) {
            ZEOrderReponseModel *model = request.responseJSONObject;
            ZETHAlertView *alertView = [[ZETHAlertView alloc]initWithTitle:@"审核成功" customerID:_customer.CustomerID customerName:_customer.CustomerName OptionCode:model.OptionCode];
            [alertView showInWindowWithBackgoundTapDismissEnable:YES];
        }else{
            
        }
    } failure:^(YTKBaseRequest *request) {
        [self showToastWithMsg:@"错误"];
    }];
}
- (NSDictionary *)netWorkingDicWith:(NSNumber *)state{
    NSDictionary *dic = @{
                          @"OrderID":self.customer.CustomerID,
                          @"State":state,
                          @"Remark":self.textView.text
                          };
    return dic;
}
#pragma mark - getter

- (IntentionEntityClass *)customer
{
    if (_customer == nil) {
        _customer = [[IntentionEntityClass alloc]init];
    }
    return _customer;
}

- (void)iflyBtnClick{
    if(_voice == nil)
    {
        _voice = [[ZEXVoice alloc]initWithDelegate:self];
    }
    
    [_textView setText:@""];
    [_textView resignFirstResponder];
    
    [_voice start];
}


/**
 听写结束回调（注：无论听写是否正确都会回调）
 error.errorCode =
 0     听写正确
 other 听写出错
 ****/
- (void) onError:(IFlySpeechError *) error
{
}
/**
 有界面，听写结果回调
 resultArray：听写结果
 isLast：表示最后一次
 ****/
- (void)onResult:(NSArray *)resultArray isLast:(BOOL)isLast
{
    NSMutableString *result = [[NSMutableString alloc] init];
    NSDictionary *dic = [resultArray objectAtIndex:0];
    
    for (NSString *key in dic) {
        [result appendFormat:@"%@",key];
    }
    NSString *newStr = [NSString stringWithFormat:@"%@%@",_textView.text,result];
    _textView.text = newStr;
    
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
