//
//  customerDetailViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/3.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "customerDetailViewController.h"
#import "ZEOrderAppointmentViewController.h"
#import "ZEpriceReviewViewController.h"
#import "ZEDesignReviewViewController.h"
#import "CrmCustomerInterface.h"
#import "chooseClientViewController.h"
#import "UIButton+Extension.h"
#import "followingViewController.h"
#import "ZEcontractAwrdViewController.h"
#import "ZERemarkViewController.h"
#import "ZECustomerActivityController.h"
#import "ZECustomerTeamViewController.h"
#import "ZECustomerInfoViewController.h"
#import "customerMapAddressViewController.h"
#import "ZEFollowFinishTaskViewController.h"
#import "ZEDetailNoticeViewController.h"
#import "ZEAwsomeMenu.h"
#import "promptWindow.h"
#import "ZEcustomerHeaderView.h"
#import "ZEcustomerDetailTableView.h"

@interface customerDetailViewController ()<ZEAwsomeMenuDelegate>

@property (weak, nonatomic) IBOutlet ZEcustomerDetailTableView *tableView;

@property (nonatomic ,strong)customerDetail *detail;

@property (nonatomic ,strong)promptWindow *proView;

@property (nonatomic ,strong)ZEcustomerHeaderView *header;
@property (weak, nonatomic) IBOutlet UIView *borromView;

@property (nonatomic,strong) ZEAwsomeMenu * menu;

@property(nonatomic,weak) UIButton   * addBtn;
@property (nonatomic,strong) UIButton * cover;


@property (nonatomic,strong) UIButton *rightBrn;

@end

@implementation customerDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self uiInitSet];
    [self proViewShow];
    [self setupRightBtn];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self customerDetailLoading];
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)customerDetailLoading {
    [[CrmCustomerInterface shareCrmCustomInstance] loadCustomerDetailInfoWithController:self customerID:_ID Block:^(THNetWorkError *error, customerDetail *detail) {
        if (error) {
            NSLog(@"%@",error.errorDescription);
        }else {
            self.detail = detail;
            self.tableView.detail = detail;
            _header.detail = _detail;
            if ([_detail.IsAttention isEqual:@0]) {
                _rightBrn.selected = NO;
            }else{
                _rightBrn.selected = YES;
            }
        }
    }];
}

- (void)uiInitSet {
    _header = [[ZEcustomerHeaderView alloc]initWithMaxHeight:150];
    [self.tableView addSubview:_header];
    _header.frame = CGRectMake(0, -150, SCREEN_WIDTH, 150);
    self.tableView.contentInset = UIEdgeInsetsMake(150, 0, 55, 0);
    self.tableView.contentOffset = CGPointMake(0, -150);
    [self setupAddBtn];
}

- (void)setupRightBtn{
    _rightBrn = [[UIButton alloc]init];
    _rightBrn.image = @"icon_collect";
    _rightBrn.selectedImage = @"icon_collect_select";
    _rightBrn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [_rightBrn sizeToFit];
    [_rightBrn addTarget:self action:@selector(collectBtnClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_rightBrn];
}
- (void)collectBtnClick{
    if (!_detail) {
        return;
    }
    [crmCustomerShare concernWithOrderID:_detail.CustomerID IsAttention:_detail.IsAttention Block:^(THNetWorkError *error) {
        if (error) {
            NSLog(@"%@",error.errorDescription);
            return ;
        }
        if ([_detail.IsAttention isEqual:@0]) {
            _detail.IsAttention = @1;
            _rightBrn.selected = YES;
        }else{
            _detail.IsAttention = @0;
            _rightBrn.selected = NO;
        }
    }];
}

- (void)setupAddBtn
{
    UIButton * btn = [[UIButton alloc]init];
    UIImage * image = [UIImage imageNamed:@"Btn_+"];
    [btn addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:image forState:UIControlStateNormal];
    [btn sizeToFit];
    self.addBtn = btn;
    [self.view insertSubview:btn aboveSubview:self.menu];
    
    btn.sd_layout
    .rightSpaceToView(self.view,25)
    .bottomSpaceToView(self.view,48)
    .widthIs(btn.width)
    .heightIs(btn.height);
}
- (void)proViewShow{
    _proView = [[promptWindow alloc]init];
    [_proView show];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        NSString *point =[NSString stringWithFormat:@"%@",change[NSKeyValueChangeNewKey]];
        CGFloat height = -[self scrollHeightWith:point];
        _header.y = -height;
        if (height>150) {
            height = 150;
        }else if(height<50){
            height = 50;
        }
        _header.height = height;
    }
}

- (CGFloat)scrollHeightWith:(NSString *)point{
    NSArray *array = [point componentsSeparatedByString:@","];
    NSString *heightStr = array.lastObject;
    heightStr = [heightStr stringByReplacingOccurrencesOfString:@"}" withString:@""];
    heightStr = [heightStr stringByReplacingOccurrencesOfString:@")" withString:@""];
    return [heightStr floatValue];
}
#pragma mark - prepareForSegue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toFollowingStatus"]) {
        followingViewController * followingVC = segue.destinationViewController;
        followingVC.detail = self.detail;
        return;
    }
    if([segue.identifier isEqualToString:@"toCustomerActivity"])
    {
//        if (self.detail) {
//            
//        }
        ZECustomerActivityController * activityVC = segue.destinationViewController;
        activityVC.detail = self.detail;
        return;
    }
    if([segue.identifier isEqualToString:@"toCustomerTeam"])
    {
        ZECustomerTeamViewController * teamVC = segue.destinationViewController;
//     传值
        teamVC.detail =self.detail;
        return;
    }
    
    if([segue.identifier isEqualToString:@"toCustomerInfo"])
    {
        ZECustomerInfoViewController * infoVC = segue.destinationViewController;
        //     传值
        infoVC.detail =self.detail;
    
        return;
    }
    
    if([segue.identifier isEqualToString:@"ZEFollowFinishTask"])
    {
        ZEFollowFinishTaskViewController * followFinishTaskVC = segue.destinationViewController;
        //     传值
        followFinishTaskVC.detail =self.detail;
        lieonLog(@"%@",followFinishTaskVC.detail.CustomerID);
        return;
    }
}

#pragma mark - 按钮

- (void)addBtnClick:(UIButton*)btn
{
    NSUInteger length = self.detail.CustomerOperationType.length;
    if (length == 0) {
        [MBProgressHUD showError:@"操作失败" toView:self.view];
        return;
    }
    btn.selected = ! btn.selected;
    CABasicAnimation * animation = [CABasicAnimation animation];
    
    animation.duration = 0.1;
    animation.keyPath = @"transform.rotation";
    animation.toValue = btn.selected ? @(M_PI * 0.5):@(0);
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [btn.layer addAnimation:animation forKey:nil];
    [UIView animateWithDuration:0 animations:^{
        self.menu.alpha = btn.selected ? 1:0;
        self.cover.hidden = btn.selected  ? NO : YES;
    }];
    if (self.cover.hidden == YES) {
        return;
    }

    NSLog(@"CustomerOperationType:%@",self.detail.CustomerOperationType);
    NSString * str =  [self.detail.CustomerOperationType stringByReplacingOccurrencesOfString:@"," withString:@""];
    NSMutableArray * indexArray = [NSMutableArray array];
    for (NSUInteger i = 0; i < str.length; i++) {
     NSString * value = [str substringWithRange:NSMakeRange(i, 1)] ;
    [indexArray addObject:value];
    }
    self.menu.indexArray = indexArray;
}

- (void)coverBtnClick:(UIButton*)btn
{
    [self addBtnClick:self.addBtn];
    
}
- (IBAction)followupBtnClick:(id)sender {
    
  [self performSegueWithIdentifier:@"ZEFollowFinishTask" sender:nil];
}
/**
 *  拨打客户电话
 *
 *  @param sender 按钮
 */
- (IBAction)callPhoneBtnClick:(id)sender {
    
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",self.detail.Mobile];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];

}

- (void)mapBtnClick:(UIButton *)sender {
    CLLocationCoordinate2D pt = (CLLocationCoordinate2D){0,0};
    pt.latitude = [self.detail.PointX floatValue];
    pt.longitude = [self.detail.PointY floatValue];
    if (self.detail.PointY && self.detail.PointY) {
        customerMapAddressViewController *mapController = [[customerMapAddressViewController alloc]init];
        mapController.customerPt = pt;
        mapController.customerAddress = self.detail.Address;
        [self.navigationController pushViewController:mapController animated:YES];
    }
}

/**
 *  交互定金
 */
- (void)pushOrderAppointMentVC
{
    ZEOrderAppointmentViewController * vc = [[ZEOrderAppointmentViewController alloc]init];
    vc.orderAppoint.customerName = _detail.CustomerName;
    vc.orderAppoint.CustomerID = _detail.CustomerID;
    [self.navigationController pushViewController:vc animated:YES];
}
/**
 *  量尺出图
 */
- (void)pushRemarkVC
{
     ZERemarkViewController * VC = [[ ZERemarkViewController alloc] init];
     VC.customer.CustomerID = self.detail.CustomerID;
    [self.navigationController pushViewController:VC animated:YES];
}
/**
 *  图纸审核
 */
- (void)pushDesignReviewVC
{
    ZEDesignReviewViewController * vc = [[ZEDesignReviewViewController alloc]init];
    vc.customer.CustomerID = self.detail.CustomerID;

    [self.navigationController pushViewController:vc animated:YES];
}

/**
 *  价格审核
 */
- (void)pushPriceReviewVC
{
    ZEpriceReviewViewController * vc = [[ZEpriceReviewViewController alloc]init];
    vc.customer.CustomerID = self.detail.CustomerID;
    [self.navigationController pushViewController:vc animated:YES];
}

/**
 *  合同签约
 */
- (void)pushContractAwrdVC
{
    ZEcontractAwrdViewController *vc = [[ZEcontractAwrdViewController alloc]init];
    vc.customer.CustomerID = self.detail.CustomerID;
    [self.navigationController pushViewController:vc animated:YES];
}

/**
 *  客户流失
 */
- (void)customerMiss
{
    
    UIAlertController * alterVC = [UIAlertController alertControllerWithTitle:nil message:@"是否流失客户" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * yes = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [[THNetWork sharedInstance]accessServerWithUIViewController:self WithAction:@"Loss" WithParam:@{@"OrderID":self.detail.CustomerID} WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
            NSLog(@"%@",dataDic);
            [self.navigationController popViewControllerAnimated:YES];
        }];
    }];
    
    UIAlertAction *actionNo = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"NO");
    }];
    [alterVC addAction:actionNo];
    [alterVC addAction:yes];
    [self presentViewController:alterVC animated:yes completion:nil];

    
    

}

#pragma mark - getter

- (ZEAwsomeMenu *)menu
{
    
    if (_menu == nil) {
        
        _menu = [[ZEAwsomeMenu alloc]init];
        _menu.delegate = self;
        [self.view insertSubview:_menu aboveSubview:self.borromView];
        _menu.sd_layout
        .bottomSpaceToView(self.addBtn,0)
        .centerXEqualToView(self.addBtn)
        .widthIs(60)
        .heightIs(65 * 6);
        _menu.alpha = 0;
    }
    return _menu;
}

- (UIButton *)cover
{
    if (_cover == nil) {
        _cover = [[UIButton alloc]init];
        _cover.backgroundColor = [UIColor blackColor];
        _cover.alpha = 0.5;
        _cover.frame = self.view.bounds;
        [_cover addTarget:self action:@selector(coverBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view insertSubview: _cover belowSubview:self.menu];
        _cover.alpha = 0.4;
        _cover.hidden = YES;
    }
    return _cover;
}

#pragma mark - ZEAwsomeMenuDelegate

/**
 *  1,交付定金
 2,量尺出图
 3,图纸审核
 4,价格审核
 5,合同签约
 6客户流失

 */
- (void)awsomeMenuBtnClick:(NSInteger)index
{
    NSLog(@"%ld",index);
    switch (index) {
        case 1:
            [self pushOrderAppointMentVC];
            break;
            
        case 2:
            [self pushRemarkVC];
            
            break;
            
        case 3:
            [self pushDesignReviewVC];
            break;
            
        case 4:
            [self pushPriceReviewVC];
            break;
            
        case 5:
            [self pushContractAwrdVC];
            break;
            
        case 6:
            
            [self customerMiss];
            break;
        default:
            break;
    }
    [self addBtnClick:self.addBtn];
}
@end
