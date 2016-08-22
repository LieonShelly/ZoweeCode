//
//  searchViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/21.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "searchViewController.h"
#import "searchTableView.h"
#import "THNetWork.h"
#import "Models.h"
#import "customerDetailViewController.h"
#import "UIButton+Extension.h"
#import "ZEXVoice.h"

@interface searchViewController ()<UITextViewDelegate,IFlyRecognizerViewDelegate>

@property (nonatomic,weak) searchTableView *tabView;

@property (nonatomic,weak) UITextField *textfield;

@property (nonatomic, strong) ZEXVoice *voice;//带界面的识别对象

@end

@implementation searchViewController {
    UIView *_topView;
   // searchTableView *_tabView;
}
-(BOOL)shouldAutorotate{
    
    return YES;
    
}//是否支持旋转

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskPortrait ;
    
}//支持的方向

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self ViewSetup];
    [self tableViewSetup];
    WS(weakself);
    _tabView.didTapSearchString = ^(NSString *search){
        [weakself searchcustomer:search];
        _tabView.searchHistory = [searchHistoryManage insertHistory:search];
    };
    _tabView.selectdCustomer = ^(searchResultModel *customer){
        customerDetailViewController *detaleController = [[UIStoryboard storyboardWithName:@"CRM" bundle:nil] instantiateViewControllerWithIdentifier:@"customerDetail"];
        detaleController.ID = customer.CustomerID;
        detaleController.hidesBottomBarWhenPushed = YES;
        [self dismissViewControllerAnimated:NO completion:nil];
        if (_navcontroller) {
            [_navcontroller pushViewController:detaleController animated:YES];
        }else if ([weakself.sdelegate respondsToSelector:@selector(choiceSearchCustomer:)]) {
            [weakself.sdelegate choiceSearchCustomer:customer];
        }
    };
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)ViewSetup {
    
    _topView = [UIView new];
    [self.view addSubview:_topView];
    //topView.backgroundColor = [UIColor yellowColor];
    _topView.sd_layout
    .topSpaceToView(self.view,20)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(44);
    UITextField *searchTextField = [[UITextField alloc]init];
    searchTextField.borderStyle = UITextBorderStyleNone;
    searchTextField.font = [UIFont systemFontOfSize:14];
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 21, 16)];
    UIImageView *seach = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_Search"]];
    [leftView addSubview:seach];
    seach.frame = CGRectMake(0, 0, 16, 16);
    searchTextField.leftView = leftView;
    searchTextField.leftViewMode = UITextFieldViewModeAlways;
    searchTextField.returnKeyType = UIReturnKeySearch;
    searchTextField.delegate = self;
    searchTextField.placeholder = @"搜索客户姓名、电话、地址";
    searchTextField.clearButtonMode = UITextFieldViewModeAlways;
    _textfield = searchTextField;
    [_topView addSubview:searchTextField];
    searchTextField.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(0, 20, 0, 80));
    
    UIButton *voiceBtn = [[UIButton alloc]init];
    [voiceBtn addTarget:self action:@selector(iflyBtnClick)];
    voiceBtn.image = @"Voice";
    [_topView addSubview:voiceBtn];
    voiceBtn.sd_layout
    .leftSpaceToView(searchTextField,0)
    .topEqualToView(_topView)
    .bottomEqualToView(_topView)
    .widthIs(40);

    UIButton *cancelBtn = [UIButton new];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn setTitleColor:hexColorString(@"b2b2b2") forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_topView addSubview:cancelBtn];
    cancelBtn.sd_layout
    .topEqualToView(_topView)
    .bottomEqualToView(_topView)
    .rightSpaceToView(_topView,15)
    .widthIs(30);
    
    UIView *line = [UIView new];
    line.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.2];
    [_topView addSubview:line];
    line.sd_layout
    .bottomEqualToView(_topView)
    .leftEqualToView(_topView)
    .rightEqualToView(_topView)
    .heightIs(0.5);
}

- (void)tableViewSetup {
    _tabView = [[searchTableView alloc]init];
    [self.view addSubview:_tabView];
    _tabView.sd_layout
    .topSpaceToView(_topView,0)
    .bottomEqualToView(self.view)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view);
    
    _tabView.searchHistory = [searchHistoryManage allHistory];
}

- (void)cancelBtnClick {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


- (void)searchcustomer:(NSString *)searchStr {
    [[THNetWork sharedInstance] accessServerWithUIViewController:self WithAction:@"SearchCustomer"WithParam:@{@"QueryKey":searchStr}WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
            if (error) {
                NSLog(@"%@",error.errorDescription);
            }else {
                NSArray * ReturnParList = [dataDic valueForKey:@"ReturnParList"];
                ReturnParList = [searchResultModel mj_objectArrayWithKeyValuesArray:ReturnParList];
                _tabView.searchResult = ReturnParList;
                if (ReturnParList.count == 0) {
                    [self showToastWithMsg:@"没找到相关数据"];
                }
                [_tabView reloadData];
                }
    }];
}
#pragma mark - textfieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSString *searchStr = textField.text;
    if (searchStr.length > 0) {
        [self searchcustomer:searchStr];
        _tabView.searchHistory = [searchHistoryManage insertHistory:searchStr];
    }
    [textField resignFirstResponder];
    return YES;
}

-(void)iflyBtnClick{
    if(_voice == nil)
    {
        _voice = [[ZEXVoice alloc]initWithDelegate:self];
    }
    [_textfield setText:@""];
    [_textfield resignFirstResponder];
    
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
    NSString *newStr = [NSString stringWithFormat:@"%@%@",_textfield.text,result];
    _textfield.text = newStr;
    if (newStr.length > 0) {
        [self searchcustomer:newStr];
        _tabView.searchHistory = [searchHistoryManage insertHistory:newStr];
    }

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
