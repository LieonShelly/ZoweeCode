//
//  registerUserViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/25.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "registerUserViewController.h"
#import "reviceManViewController.h"
#import "clientSourceViewController.h"
#import "locationViewController.h"
#import "choiceAllViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "MGLocationViewController.h"
#import "writeTableViewCell.h"
#import "choiceTableViewCell.h"
#import "WorkingInterface.h"
#import "mapTableViewCell.h"
#import "remarkTableViewCell.h"
#import "floorTableViewCell.h"
#import "ZEnameTextTableViewCell.h"
#import "customerDetailViewController.h"

#import "customerManager.h"
#import "ZEXVoice.h"
#import "ZETHAlertView.h"
#import "ZEregisterRespone.h"


@interface registerUserViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,locationDelegate,MGLocationDelegate,UIAlertViewDelegate,IFlyRecognizerViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) ZEXVoice *voice;//带界面的识别对象
@end

@implementation registerUserViewController {
    UITextField *_nameTextField;
    UITextField *_phoneTextField;
    UITextField *_floorTextField;
    UITextField *_numberTextField;
    UITextField *_remarkTextField;
}

- (registerUser *)user {
    if (!_user) {
        _user = [[registerUser alloc]init];
        return _user;
    }
    return _user;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self uiInitSet];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //[self.tableView reloadData];
}

- (void)uiInitSet {
    self.tableView.rowHeight = 50;
    self.tableView.tableHeaderView = [UIView new];
    self.tableView.tableFooterView = [UIView new];
    
    UIButton *okBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [okBtn setTitle:@"完成" forState:UIControlStateNormal];
    [okBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [okBtn addTarget:self action:@selector(okBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem ItemWithBtn:okBtn];
    [self.tableView registerClass:[ZEnameTextTableViewCell class] forCellReuseIdentifier:@"nameCell"];
}

#pragma mark - uitextFieldDelegate 

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([textField isEqual:_phoneTextField]) {
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
    }else if ([textField isEqual:_nameTextField]){
        NSString *deleStr = [textField.text substringWithRange:range];
        NSString *newStr = [textField.text stringByReplacingOccurrencesOfString:deleStr withString:@""];
        newStr = [NSString stringWithFormat:@"%@%@",newStr,string];
        NSInteger bytLength = [self stringConvertToInt:newStr];
        NSLog(@"%li",(long)bytLength);
        if (bytLength > 20) {
            [self showToastWithMsg:@"姓名长度不能超过20"];
            return NO;
        }
    }
    return YES;
    
}
//得到字节数函数
-  (NSInteger)stringConvertToInt:(NSString*)strtemp
{
    int strlength = 0;
    char* p = (char*)[strtemp cStringUsingEncoding:NSUTF8StringEncoding];
    for (int i=0 ; i<[strtemp lengthOfBytesUsingEncoding:NSUTF8StringEncoding] ;i++)
    {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return strlength;
}
#pragma mark - uitableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self saveTextFieldText];
    if (indexPath.row == 2) {
        if ([customerType isEqualToString:@"皮阿诺"]) {
            locationViewController *locationController = [[locationViewController alloc]init];
            locationController.Locdelegate = self;
            [self.navigationController pushViewController:locationController animated:YES];
        }else if ([customerType isEqualToString:@"玛格"]){
            MGLocationViewController *MGLocation = [[MGLocationViewController alloc]init];
            MGLocation.delegate = self;
            [self presentViewController:MGLocation animated:YES completion:nil];
        }
        return;
    }
    if (indexPath.row == 4) {
        [self performSegueWithIdentifier:@"revice" sender:nil];
    }else if (indexPath.row == 5) {
        [self performSegueWithIdentifier:@"source" sender:nil];
    }else if (indexPath.row == 6){
        choiceAllViewController *controller = [[choiceAllViewController alloc]init];
        controller.titleName = @"装饰公司";
        controller.block = ^(NSNumber *ID,NSString *name){
            _user.decorate.ID = ID;
            _user.decorate.Title = name;
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:6 inSection:0],nil] withRowAnimation:UITableViewRowAnimationNone];
        };
        [self.navigationController pushViewController:controller animated:YES];
    }else if (indexPath.row == 7){
        if ([_user.decorate.ID isEqual:@0]) {
            [self showToastWithMsg:@"请选择装饰公司"];
            return;
        }
        choiceAllViewController *controller = [[choiceAllViewController alloc]init];
        controller.titleName = @"设计师";
        controller.ID = _user.decorate.ID;
        controller.block = ^(NSNumber *ID,NSString *type){
            _user.designer.ID = ID;
            _user.designer.Title = type;
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:7 inSection:0],nil] withRowAnimation:UITableViewRowAnimationNone];
        };
        [self.navigationController pushViewController:controller animated:YES];
    }
}

#pragma mark - uitableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        ZEnameTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nameCell" forIndexPath:indexPath];
        cell.title = @"客户姓名";
        cell.placeholderText= @"请输入客户姓名(必填)";
        cell.enable = YES;
        cell.rightIcon = @"Voice";
        cell.action = @selector(iflyBtnClick);
        cell.contentText = self.user.CustomerName;
        _nameTextField = cell.textField;
        _nameTextField.delegate = self;
        return cell;
        
    }else if (indexPath.row == 1) {
        writeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"writeCell" forIndexPath:indexPath];
        cell.title.text = @"联系电话";
        cell.textField.placeholder = @"请输入客户联系电话(必填)";
        cell.textField.text = self.user.Mobile;
        cell.textField.keyboardType = UIKeyboardTypeNumberPad;
        _phoneTextField = cell.textField;
        _phoneTextField.delegate = self;
        return cell;
    }else if (indexPath.row == 2) {
        mapTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mapCell" forIndexPath:indexPath];
        cell.address = self.user.Address;
        return cell;
    }else if (indexPath.row == 3) {
        floorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"floorCell" forIndexPath:indexPath];
        cell.floor = self.user.HouseName;
        cell.number = self.user.HouseNumber;
        
        _floorTextField = cell.floorTextField;
        _numberTextField = cell.numberTextField;
        return cell;
    }else if (indexPath.row == 4) {
        choiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"choiceCell" forIndexPath:indexPath];
        cell.title.text = @"接待人";
        cell.chocieText.text = @"选择客户的接待人";
        cell.chocieStr = self.user.receive.name;
        return cell;
    }else if (indexPath.row == 5) {
        choiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"choiceCell" forIndexPath:indexPath];
        cell.title.text = @"客户来源";
        cell.chocieText.text = @"选择客户来源";
        cell.chocieStr = self.user.source.source;
        return cell;
    }else if (indexPath.row == 6) {
        choiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"choiceCell" forIndexPath:indexPath];
        cell.title.text = @"装饰公司";
        cell.chocieText.text = @"选择装饰公司";
        cell.chocieStr = self.user.decorate.Title;
        return cell;
    }else if (indexPath.row == 7) {
        choiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"choiceCell" forIndexPath:indexPath];
        cell.title.text = @"家装设计师";
        cell.chocieText.text = @"选择家装设计师";
        cell.chocieStr = self.user.designer.Title;
        return cell;
    }
    else if (indexPath.row == 8) {
        remarkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"remarkCell" forIndexPath:indexPath];
        cell.remark = self.user.remark;
        _remarkTextField = cell.remarkText;
        return cell;
    }
    return nil;
}



- (void)saveTextFieldText {
    self.user.CustomerName = _nameTextField.text;
    self.user.Mobile = _phoneTextField.text;
    self.user.HouseName = _floorTextField.text;
    self.user.HouseNumber = _numberTextField.text;
    self.user.remark = _remarkTextField.text;
}

#pragma mark - 地图定位功能的代理返回

- (void)checkedWithLocationModel:(mapLocation *)model {
    [self.user addMapLocation:model];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:2 inSection:0],[NSIndexPath indexPathForRow:3 inSection:0],nil] withRowAnimation:UITableViewRowAnimationNone];
    floorTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
    // [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    [cell.numberTextField becomeFirstResponder];

}

- (void)selectMGLocation:(MGLocation *)location {
    [self.user addMGLocation:location];
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:2 inSection:0],[NSIndexPath indexPathForRow:3 inSection:0],nil] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - 按钮点击事件 

- (void)okBtnClick:(UIButton*) sender {
    [self saveTextFieldText];
    if ([self.user errorMessage]) {
        [self showToastWithMsg:[self.user errorMessage]];
        return;
    }
    THBaseRequestApi *api = [[THBaseRequestApi alloc]initWithAction:@"AddCustomer" Requestparameter:[_user dictionary] ModelClassName:@"ZEregisterRespone"];
    [api addAccessory:api];
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        if (request.responseJSONObject) {
            ZEregisterRespone *model = request.responseJSONObject;
            self.user.customerID = model.CustomerID;
            ZETHAlertView *alertView = [[ZETHAlertView alloc]initWithTitle:@"登记客户成功" customerID:model.CustomerID customerName:_user.CustomerName OptionCode:model.OptionCode];
            [alertView showInWindowWithBackgoundTapDismissEnable:NO];
        }else{
            
        }
    } failure:^(YTKBaseRequest *request) {
        [self showToastWithMsg:@"错误"];
    }];
}

#pragma mark - UIAlertView Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }else if (buttonIndex == 1){
        customerDetailViewController *controller = [[UIStoryboard storyboardWithName:@"CRM" bundle:nil] instantiateViewControllerWithIdentifier:@"customerDetail"];
        controller.ID = self.user.customerID;
        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
        [self.navigationController pushViewController:controller animated:YES];
        NSMutableArray * array =[[NSMutableArray alloc]initWithArray:self.navigationController.viewControllers];
        [array removeObjectAtIndex:array.count-2];
        self.navigationController.viewControllers = array;
    }
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"revice"]) {
        reviceManViewController *controller = [segue destinationViewController];
        SelectdReviceBlock block = ^(NSNumber *ID,NSString *Name) {
            self.user.receive.name = Name;
            self.user.receive.ID = ID;
            [self.tableView reloadData];
        };
        controller.block = block;
    }
    if ([segue.identifier isEqualToString:@"source"]) {
        clientSourceViewController *controller = [segue destinationViewController];
        SelectdSourceBlock block = ^(NSNumber *ID,NSString *Name) {
            self.user.source.source = Name;
            self.user.source.type = ID;
            [self.tableView reloadData];
        };
        controller.block = block;
    }
    
    
}

- (void)iflyBtnClick{
    if(_voice == nil)
    {
        _voice = [[ZEXVoice alloc]initWithDelegate:self];
    }
    
    [_nameTextField setText:@""];
    [_nameTextField resignFirstResponder];
    
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
    NSString *newStr = [NSString stringWithFormat:@"%@%@",_nameTextField.text,result];
    NSInteger bytLength = [self stringConvertToInt:newStr];
    NSLog(@"%li",(long)bytLength);
    if (bytLength > 20) {
        [self showToastWithMsg:@"姓名长度不能超过20"];
        return;
    }
    _nameTextField.text = newStr;

}

@end
