//
//  ZENewConnectionViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZENewConnectionViewController.h"
#import "registerUser.h"
#import "ZENewConnectionView.h"
#import "locationViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "reviceManViewController.h"
#import "clientSourceViewController.h"
#import "customerManager.h"
@interface ZENewConnectionViewController ()<UITextFieldDelegate,locationDelegate>

@property (nonatomic) registerUser *nClient;

@end

@implementation ZENewConnectionViewController{
    /**
     *  用户名输入框
     */
    UITextField *_customerNameText;
    /**
     *  联系电话
     */
    UITextField *_phoneText;
    /**
     *  楼盘信息
     */
    UITextField *_HousesText;
    /**
     *  楼盘地址
     */
    UITextField *_addressLab;
    /**
     *  楼盘门牌号
     */
    UITextField *_doorNUmberText;
    /**
     *  接待人
     */
    UITextField *_admitManText;
    /**
     *  呵护来源
     */
    UITextField *_sourceTextField;
    /**
     *  备注
     */
    UITextField *_markTextField;
    
}

- (registerUser *)nClient {
    if (!_nClient) {
        _nClient = [[registerUser alloc]init];
    }
    return _nClient;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];

    UIButton *btn = [[UIButton alloc]init];
    [self.view addSubview:btn];
    btn.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    [btn addTarget:self action:@selector(touch) forControlEvents:UIControlEventTouchUpInside];
    [self uiInit];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

}

- (void)uiInit{
    UIView *view = [UIView new];
    [self.view addSubview:view];
    view.backgroundColor = hexColorString(@"f0f0f0");
    view.sd_layout
    .widthIs(550)
    .heightIs(676)
    .centerYEqualToView(self.view)
    .centerXEqualToView(self.view);
    view.sd_cornerRadiusFromWidthRatio = @0.01;
    
    UILabel *newLabel = [UILabel new];
    newLabel.text = @"新建客户";
    [view addSubview:newLabel];
    newLabel.sd_layout
    .topSpaceToView(view,25)
    .centerXEqualToView(view)
    .heightIs(17)
    .widthIs(68);
    
    UILabel *customerName = [UILabel new];
    customerName.text = @"客户姓名";
    [view addSubview:customerName];
    customerName.sd_layout
    .topSpaceToView(view,65)
    .widthIs(68)
    .heightIs(17);
    
    UILabel *start = [UILabel new];
    start.text = @"✲";
    start.font = [UIFont systemFontOfSize:12];
    start.textColor = [UIColor redColor];
    [view addSubview:start];
    start.sd_layout
    .centerYEqualToView(customerName)
    .leftSpaceToView(customerName,5)
    .widthIs(12)
    .heightIs(12);
    
    _customerNameText = [[UITextField alloc]init];
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc]initWithString:@"请输入客户姓名 (必填)"];
    [placeholder addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(8, 4)];
    _customerNameText.clearButtonMode = UITextFieldViewModeAlways;
    _customerNameText.attributedPlaceholder = placeholder;
    _customerNameText.borderStyle = UITextBorderStyleRoundedRect;
    [view addSubview:_customerNameText];
    _customerNameText.sd_layout
    .centerXEqualToView(view)
    .widthIs(350)
    .heightIs(36)
    .topSpaceToView(view,95);
    
    customerName.sd_layout
    .leftEqualToView(_customerNameText);
    
    UILabel *phoneLab = [UILabel new];
    NSMutableAttributedString *phonelabStr = [[NSMutableAttributedString alloc]initWithString:@"联系电话 ✲"];
    [phonelabStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(5, 1)];
    [phonelabStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, 1)];
    phoneLab.attributedText =phonelabStr;
    [view addSubview:phoneLab];
    phoneLab.sd_layout
    .topSpaceToView(_customerNameText,10)
    .leftEqualToView(customerName)
    .widthIs(90)
    .heightIs(17);
    
    _phoneText = [[UITextField alloc]init];
    _phoneText.delegate = self;
    NSMutableAttributedString *phoneTextplaceholder = [[NSMutableAttributedString alloc]initWithString:@"请输入客户联系电话 (必填)"];
    [phoneTextplaceholder addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(10, 4)];
    _phoneText.attributedPlaceholder = phoneTextplaceholder;
    _phoneText.clearButtonMode = UITextFieldViewModeAlways;
    _phoneText.keyboardType = UIKeyboardTypeNumberPad;
    _phoneText.borderStyle = UITextBorderStyleRoundedRect;
    [view addSubview:_phoneText];
    _phoneText.sd_layout
    .centerXEqualToView(view)
    .widthIs(350)
    .heightIs(36)
    .topSpaceToView(phoneLab,13);
    
    UILabel *HousesLab = [UILabel new];
    NSMutableAttributedString *HousesLabStr = [[NSMutableAttributedString alloc]initWithString:@"楼盘信息 ✲"];
    [HousesLabStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(5, 1)];
    [HousesLabStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, 1)];
    HousesLab.attributedText =HousesLabStr;
    [view addSubview:HousesLab];
    HousesLab.sd_layout
    .topSpaceToView(_phoneText,10)
    .leftEqualToView(customerName)
    .widthIs(90)
    .heightIs(17);
    
    _HousesText = [[UITextField alloc]init];
    NSMutableAttributedString *HousesTextplaceholder = [[NSMutableAttributedString alloc]initWithString:@"选择客户楼盘地址"];
    _HousesText.attributedPlaceholder = HousesTextplaceholder;
    _HousesText.borderStyle = UITextBorderStyleRoundedRect;
    _HousesText.enabled = NO;
    [view addSubview:_HousesText];
    _HousesText.sd_layout
    .centerXEqualToView(view)
    .widthIs(350)
    .heightIs(36)
    .topSpaceToView(HousesLab,13);

    UIButton *mapBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 36, 36)];
    [mapBtn setImage:ImageWithName(@"icon_map") forState:UIControlStateNormal];
    UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 36, 36)];
    [rightView addSubview:mapBtn];
    _HousesText.rightView = rightView;
    _HousesText.rightViewMode = UITextFieldViewModeAlways;
    UIButton *locationBtn = [UIButton new];
    [locationBtn addTarget:self action:@selector(mapBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:locationBtn];
    locationBtn.sd_layout
    .topEqualToView(_HousesText)
    .bottomEqualToView(_HousesText)
    .leftEqualToView(_HousesText)
    .rightEqualToView(_HousesText);
    
    UILabel *doorNumberLab = [UILabel new];
    doorNumberLab.text = @"楼栋门牌";
    [view addSubview:doorNumberLab];
    doorNumberLab.sd_layout
    .topSpaceToView(_HousesText,10)
    .leftEqualToView(customerName)
    .widthIs(68)
    .heightIs(17);
    
    _addressLab = [UITextField new];
    _addressLab.text = @"武侯创业中心";
    _addressLab.enabled = NO;
    _addressLab.textAlignment = NSTextAlignmentCenter;
    _addressLab.borderStyle = UITextBorderStyleRoundedRect;
    [view addSubview:_addressLab];
    _addressLab.sd_layout
    .topSpaceToView(doorNumberLab,13)
    .leftEqualToView(customerName)
    .widthIs(130)
    .heightIs(36);
    
    UILabel *line = [UILabel new];
    line.backgroundColor = [UIColor darkGrayColor];
    [view addSubview:line];
    line.sd_layout
    .centerYEqualToView(_addressLab)
    .leftSpaceToView(_addressLab,5)
    .heightIs(1)
    .widthIs(10);
    
    _doorNUmberText = [UITextField new];
    _doorNUmberText.placeholder = @"输入楼栋门牌号";
    _doorNUmberText.clearButtonMode = UITextFieldViewModeAlways;;
    _doorNUmberText.borderStyle = UITextBorderStyleRoundedRect;
    [view addSubview:_doorNUmberText];
    _doorNUmberText.sd_layout
    .topSpaceToView(doorNumberLab,13)
    .leftSpaceToView(line,5)
    .rightEqualToView(_HousesText)
    .heightIs(36);
    
    UILabel *admitManLab = [UILabel new];
    admitManLab.text = @"接待人";
    [view addSubview:admitManLab];
    admitManLab.sd_layout
    .topSpaceToView(_doorNUmberText,10)
    .leftEqualToView(customerName)
    .widthIs(68)
    .heightIs(17);
    
    _admitManText = [UITextField new];
    _admitManText.placeholder = @"选择客户的接待人";
    _admitManText.enabled = NO;
    _admitManText.borderStyle = UITextBorderStyleRoundedRect;
    UIImageView *imageview = [[UIImageView alloc]initWithImage:ImageWithName(@"icon_arrow_right")];
    UIView *rigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 36, 36)];
    imageview.center = rightView.center;
    [rigView addSubview:imageview];
    _admitManText.rightView = rigView;
    _admitManText.rightViewMode = UITextFieldViewModeAlways;
    [view addSubview:_admitManText];
    _admitManText.sd_layout
    .topSpaceToView(admitManLab,13)
    .leftEqualToView(admitManLab)
    .widthIs(350)
    .heightIs(36);
    UIButton *admitBtn = [UIButton new];
    [admitBtn addTarget:self action:@selector(admitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:admitBtn];
    admitBtn.sd_layout
    .topEqualToView(_admitManText)
    .bottomEqualToView(_admitManText)
    .leftEqualToView(_admitManText)
    .rightEqualToView(_admitManText);
    
    UILabel *customersourceLab = [UILabel new];
    customersourceLab.text = @"客户来源";
    [view addSubview:customersourceLab];
    customersourceLab.sd_layout
    .topSpaceToView(_admitManText,10)
    .leftEqualToView(customerName)
    .widthIs(68)
    .heightIs(17);
    
    _sourceTextField = [UITextField new];
    _sourceTextField.placeholder = @"选择客户来源";
    _sourceTextField.enabled = NO;
    _sourceTextField.borderStyle = UITextBorderStyleRoundedRect;
    imageview = [[UIImageView alloc]initWithImage:ImageWithName(@"icon_arrow_right")];
    rigView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 36, 36)];
    imageview.center = rightView.center;
    [rigView addSubview:imageview];
    _sourceTextField.rightView = rigView;
    _sourceTextField.rightViewMode = UITextFieldViewModeAlways;
    [view addSubview:_sourceTextField];
    _sourceTextField.sd_layout
    .topSpaceToView(customersourceLab,13)
    .leftEqualToView(customerName)
    .heightIs(36)
    .widthIs(350);
    admitBtn = [UIButton new];
    [view addSubview:admitBtn];
    [admitBtn addTarget:self action:@selector(reviceBtnClick) forControlEvents:UIControlEventTouchUpInside];
    admitBtn.sd_layout
    .topEqualToView(_sourceTextField)
    .bottomEqualToView(_sourceTextField)
    .leftEqualToView(_sourceTextField)
    .rightEqualToView(_sourceTextField);
    
    UILabel *markLab = [UILabel new];
    markLab.text = @"备注";
    [view addSubview:markLab];
    markLab.sd_layout
    .topSpaceToView(_sourceTextField,10)
    .leftEqualToView(customerName)
    .widthIs(34)
    .heightIs(17);
    
    _markTextField = [UITextField new];
    _markTextField.borderStyle = UITextBorderStyleRoundedRect;
    _markTextField.placeholder = @"填写备注";
    _markTextField.clearButtonMode = UITextFieldViewModeAlways;;
    [view addSubview:_markTextField];
    _markTextField.sd_layout
    .topSpaceToView(markLab,13)
    .leftEqualToView(customerName)
    .widthIs(350)
    .heightIs(36);
    
    UIButton *okBtn = [UIButton new];
    [okBtn setTitle:@"完成" forState:UIControlStateNormal];
    okBtn.layer.masksToBounds = YES;
    okBtn.layer.cornerRadius = 5;
    okBtn.backgroundColor = hexColorString(@"CBCDCE");
    [okBtn setTitleColor:hexColorString(@"808080") forState:UIControlStateNormal];
    [view addSubview:okBtn];
    [okBtn addTarget:self action:@selector(okBtnClick) forControlEvents:UIControlEventTouchUpInside];
    okBtn.sd_layout
    .topSpaceToView(_markTextField,25)
    .leftEqualToView(customerName)
    .widthIs(350)
    .heightIs(36);
    
}
#pragma mark - uitextFieldDelegate

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 点击按钮
/**
 *  地图
 */
- (void)mapBtnClick{
    locationViewController *locationController = [[locationViewController alloc]init];
    locationController.Locdelegate = self;
    [self.navigationController pushViewController:locationController animated:YES];
}
- (void)checkedWithLocationModel:(mapLocation *)model{
    [self.nClient addMapLocation:model];
    _HousesText.text = model.Address;
    _addressLab.text = self.nClient.HouseName;
}
/**
 *  接待人
 */
- (void)admitBtnClick{
    reviceManViewController *controller = [[UIStoryboard storyboardWithName:@"Add" bundle:nil] instantiateViewControllerWithIdentifier:@"reviceman"];
    controller.block =  ^(NSNumber *ID,NSString *Name) {
        self.nClient.receive.name = Name;
        self.nClient.receive.ID = ID;
        _admitManText.text = Name;
    };
    [self.navigationController pushViewController:controller animated:YES];
}
/**
 *  来源
 */
- (void)reviceBtnClick{
    clientSourceViewController *controller =[[UIStoryboard storyboardWithName:@"Add" bundle:nil] instantiateViewControllerWithIdentifier:@"clientSource"];
    controller.block = ^(NSNumber *ID,NSString *Name){
        self.nClient.source.source = Name;
        self.nClient.source.type = ID;
        _sourceTextField.text = Name;
    };
    [self.navigationController pushViewController:controller animated:YES];
}
/**
 *  完成
 */
- (void)okBtnClick{
    self.nClient.CustomerName = _customerNameText.text;
    self.nClient.Mobile = _phoneText.text;
    self.nClient.HouseNumber = _doorNUmberText.text;
    if ([self.nClient errorMessage]) {
        [self showToastWithMsg:[self.nClient errorMessage]];
        return;
    }
    [[customerManager sharecustomerInstance] addCustomerWithController:self parmaDic:[self.nClient dictionary] block:^(THNetWorkError *error, NSNumber *customerID) {
        if (error) {
            NSLog(@"%@",error.errorDescription);
            [self showToastWithMsg:error.errorDescription];
        }else {
            NSLog(@"%@",customerID);
            [self showToastWithMsg:@"登记客户成功"];
            [self pushHomeDesiger:customerID];
        }
    }];

}
-(void)touch{
    ZENewConnectionView * window = (ZENewConnectionView *)[UIApplication sharedApplication].keyWindow;
    [window hidden];
}

- (void)pushHomeDesiger:(NSNumber *)orderID{
    ZENewConnectionView * window = (ZENewConnectionView *)[UIApplication sharedApplication].keyWindow;
    [window push:orderID customerName:self.nClient.CustomerName];
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
