//
//  ZEOrderAppointmentViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/4.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEOrderAppointmentViewController.h"
#import "ZETableView.h"
#import "UIBarButtonItem+Extension.h"
#import "customerManager.h"
#import "UIView+ShortCut.h"
#import "choiceAllViewController.h"
#import "UIButton+Extension.h"
#import "ZETHAlertView.h"


@interface ZEOrderAppointmentViewController ()<UIAlertViewDelegate>

@property(nonatomic) ZETableView *tableView;

@property(nonatomic) UIButton *NotifBossBtn;

@end

@implementation ZEOrderAppointmentViewController{
    orderAppointment *_orderAppoint;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self uiInit];
    [self setup];
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
    CGFloat offY = SCREEN_HEIGHT - keyboardSize.height-10;//屏幕总高度-键盘高度-间距
    _NotifBossBtn.bottom = offY;
}
//键盘消失时候调用的事件
-(void)keyboardWillHide:(NSNotification *)note{
    _NotifBossBtn.bottom = SCREEN_HEIGHT - 15;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (orderAppointment *)orderAppoint{
    if (!_orderAppoint) {
        _orderAppoint = [[orderAppointment alloc]init];
    }
    return _orderAppoint;
}

- (void)uiInit{
    self.tableView = [[ZETableView alloc]init];
    [self.view addSubview:_tableView];
    _tableView.orderAppoint = self.orderAppoint;
    _tableView.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem ItemWithTitle:@"提交" target:self action:@selector(submitBtnClick:)];
    
    _NotifBossBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-125-15, SCREEN_HEIGHT-20-15, 125, 30)];
    [_NotifBossBtn addTarget:self action:@selector(NotifBossBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    _NotifBossBtn.image = @"notice_nao";
    if (self.orderAppoint.shopOwnerName.isNoEmpty) {
        _NotifBossBtn.title = [NSString stringWithFormat:@"通知%@安排设计师",self.orderAppoint.shopOwnerName];
    }else{
        _NotifBossBtn.title = @"通知店长安排设计师";
    }
    _NotifBossBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    _NotifBossBtn.bgImage = @"通知店长";
    [self.view addSubview:_NotifBossBtn];
}

- (void)setup{
    self.title = @"订单预订";
    [[customerManager sharecustomerInstance]getOrderNoBlock:^(THNetWorkError *error, NSString *orderID) {
        if (error) {
            [self showToastWithMsg:error.errorDescription];
        }else{
            _tableView.orderID = orderID;
        }
    }];
}
- (void)submitBtnClick:(UIButton *)sender {
    orderAppointment*order = self.orderAppoint;
    NSString *error =[order entityisNoEmpty];
    if (error) {
        [self showToastWithMsg:error];
        return;
    }else{
        if (order.ShopOwnerID.isNoEmpty) {
            [self netWorking];
        }else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"选择通知店长" delegate:self cancelButtonTitle:@"不用" otherButtonTitles:@"选择", nil];
            [alert show];
        }
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self netWorking];
    }else{
        [self NotifBossBtnClick:nil];
    }
}


- (void)netWorking{
    orderAppointment*order = self.orderAppoint;
    NSMutableDictionary *dic = [order mj_keyValues];
    [dic removeObjectsForKeys:@[@"customerName",@"flowName",@"guiderName",@"houseTypeName",@"setyleName",@"shopOwnerName",@"ActivityName"]];
    THBaseRequestApi *api = [[THBaseRequestApi alloc]initWithAction:@"DeliveryDeposit" Requestparameter:dic ModelClassName:@"ZEOrderReponseModel"];
    [api addAccessory:api];
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        if (request.responseJSONObject) {
            ZEOrderReponseModel *model = request.responseJSONObject;
            ZETHAlertView *alertView = [[ZETHAlertView alloc]initWithTitle:@"订单预订成功" customerID:order.CustomerID customerName:order.customerName OptionCode:model.OptionCode];
            [alertView showInWindowWithBackgoundTapDismissEnable:YES];
        }else{
            
        }
    } failure:^(YTKBaseRequest *request) {
        [self showToastWithMsg:@"错误"];
    }];
}

- (void)NotifBossBtnClick:(UIButton *)sender {
    choiceAllViewController *controller = [[choiceAllViewController alloc]init];
    controller.titleName = @"店长";
    controller.block = ^(NSNumber *ID,NSString *name){
        orderAppointment *orderAppoint = self.orderAppoint;
        orderAppoint.ShopOwnerID = ID;
        orderAppoint.shopOwnerName = name;
        _NotifBossBtn.title = [NSString stringWithFormat:@"通知%@安排设计师",name];
    };
    [self.navigationController pushViewController:controller animated:YES];
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
