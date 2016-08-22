//
//  MGLocationViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "MGLocationViewController.h"
#import "JSDropDownMenu.h"
#import "JSDropDownViewModel.h"


@interface MGLocationViewController ()<UITextFieldDelegate>


@property (nonatomic ,strong) NSArray *searchHistory;

@property (nonatomic ,strong) JSDropDownViewModel *dropViewModel;

@end

@implementation MGLocationViewController{
    UIView *_topView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewSetup];
    [self menuInit];
    [self tableViewInit];
    // Do any additional setup after loading the view.
}
-(BOOL)shouldAutorotate{
    
    return YES;
    
}//是否支持旋转

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskPortrait ;
    
}//支持的方向
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewSetup {
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    searchTextField.placeholder = @"请输入客户楼盘信息搜索";
    searchTextField.clearButtonMode = UITextFieldViewModeAlways;
    [_topView addSubview:searchTextField];
    searchTextField.sd_layout
    .topEqualToView(_topView)
    .leftSpaceToView(_topView,20)
    .heightIs(44)
    .rightSpaceToView(_topView,30);
    
    UIButton *cancelBtn = [UIButton new];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn setTitleColor:hexColorString(@"b2b2b2") forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_topView addSubview:cancelBtn];
    cancelBtn.sd_layout
    .topEqualToView(_topView)
    .heightIs(44)
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

- (void)menuInit{
    JSDropDownMenu * menu = [[JSDropDownMenu alloc]initWithOrigin:CGPointMake(0, 64) andHeight:40 andWidth:SCREEN_WIDTH];
    menu.indicatorColor = [UIColor colorWithRed:175.0f/255.0f green:175.0f/255.0f blue:175.0f/255.0f alpha:1.0];
    menu.separatorColor = [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0];
    menu.textColor = [UIColor colorWithRed:83.f/255.0f green:83.f/255.0f blue:83.f/255.0f alpha:1.0f];
    menu.hidden = YES;
    WS(weakself);
    _dropViewModel = [[JSDropDownViewModel alloc]initWithBlock:^(JSDropDownViewModel *viewModel){
        menu.hidden = NO;
        menu.dataSource = viewModel;
        menu.delegate = viewModel;
        [weakself.view addSubview:menu];
        viewModel = nil;
    }];
}

- (void)tableViewInit {
    self.tabView = [[MGLocationTabView alloc]init];
    [self.view addSubview:_tabView];
    _tabView.sd_layout
    .topSpaceToView(_topView,40)
    .leftEqualToView(self.view)
    .bottomEqualToView(self.view)
    .rightEqualToView(self.view);
    WS(weakself);
    _tabView.block = ^(MGLocation *location){
        if ([weakself.delegate respondsToSelector:@selector(selectMGLocation:)]) {
            [weakself.delegate selectMGLocation:location];
        }
    };
    
}

- (void)cancelBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSString *searchStr = textField.text;
    if (searchStr.length > 0) {
        [self.tabView searchLocation:searchStr];
    }
    [textField resignFirstResponder];
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

@end
