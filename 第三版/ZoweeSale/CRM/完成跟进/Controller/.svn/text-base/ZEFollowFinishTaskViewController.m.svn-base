//
//  ZEFollowFinishTaskViewController.m
//  ZoweeSale
//
//  Created by apple on 16/3/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEFollowFinishTaskViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "ZEFollowFinishTaskRequestParam.h"
#import "ZELoadFollowTypeViewController.h"
#import "ZELoadFollowType.h"

// 评分的星级
typedef  enum {
    ZERecordLevelTypeOneStar = 0,
    ZERecordLevelTypeTwoStar,
    ZERecordLevelTypeThreeStar,
    ZERecordLevelTypeFourStar,
    ZERecordLevelTypeFiveStar,
} ZERecordLevelType;

@interface ZEFollowFinishTaskViewController () <ZELoadFollowTypeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UIView *thirdView;

/** 日期*/
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

/** 跟进方式*/
@property (weak, nonatomic) IBOutlet UILabel *followWayLael;

/** 备注textview */
@property (weak, nonatomic) IBOutlet UITextView *remarkTextView;

/**分割线*/
@property (weak, nonatomic) IBOutlet UIView *firstSparatorLine;
@property (weak, nonatomic) IBOutlet UIView *secondSparatorLine;

@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UILabel *follow;
@property (weak, nonatomic) IBOutlet UILabel *remarkLabel;

@property (weak, nonatomic) IBOutlet UIButton *star1;
@property (weak, nonatomic) IBOutlet UIButton *start2;
@property (weak, nonatomic) IBOutlet UIButton *star3;
@property (weak, nonatomic) IBOutlet UIButton *star4;
@property (weak, nonatomic) IBOutlet UIButton *star5;

@property(nonatomic,strong) NSDate * localTime;

/**  记录星级 */
@property(nonatomic,strong) NSNumber *  RecordLevel;

/** 记录完成方式*/
@property(nonatomic,strong) ZELoadFollowType * type;
@property(nonatomic,copy) NSString * strDate;
@end

@implementation ZEFollowFinishTaskViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 初始化UI
    [self initUI];
}

- (customerDetail *)detail{
    if (!_detail) {
        _detail = [[customerDetail alloc]init];
    }
    return _detail;
}
#pragma  mark - 私有方法

- (void)initUI
{
    self.view.backgroundColor = [UIColor colorWithHexString:@"f5f2f3"];
    self.firstSparatorLine.backgroundColor = [UIColor colorWithHexString:@"dbdbdb"];
    self.secondSparatorLine.backgroundColor = [UIColor colorWithHexString:@"dbdbdb"];
    self.dateLabel.textColor = hexColorString(@"666666");
    self.follow.textColor = hexColorString(@"2e2e2e");
    self.followWayLael.textColor = hexColorString(@"2e2e2e");
    self.remarkLabel.textColor = hexColorString(@"2e2e2e");
    self.commentLabel.textColor = hexColorString(@"2e2e2e");
    self.remarkTextView.backgroundColor = hexColorString(@"fafafa");
    self.star5.backgroundColor = self.star4.backgroundColor = self.star3.backgroundColor = self.start2.backgroundColor = self.star1.backgroundColor = hexColorString(@"e0dede");
   
    // 获取本地时间
    NSDate * date = [NSDate date];
    
    // 界面上显示的时间格式
    NSDateFormatter * dateformater = [[NSDateFormatter alloc]init];
    dateformater.dateFormat = @"MM月dd日";
    NSString *strDate  = [dateformater stringFromDate:date];
    self.dateLabel.text = strDate;
    
    // 发送给服务器的时间格式
    dateformater.dateFormat =@"yyyy-MM-dd hh:mm:ss";
    NSString *  strDate1 = [dateformater stringFromDate:date];
    self.strDate = strDate1;

    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [btn setTitle:@"提交" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(submitBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightStateItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightStateItem;
    
    ZELoadFollowType * type = [ZELoadFollowType loadFllowType];
    self.followWayLael.text = type.Title;
    self.type = type;
    
}

#pragma mark - 按钮的点击

- (IBAction)starBtnClick:(UIButton * )sender
{
    /**
     *  反感 冷淡 观望中 热情 其他
     */
    switch ( sender.tag ) {
        case ZERecordLevelTypeOneStar: // 反感
            self.star1.selected = YES;
            self.star1.backgroundColor = hexColorString(@"7ecef4");
            
            self.start2.selected = NO;
            self.star3.selected =NO;
            self.star4.selected = NO;
            self.star5.selected = NO;
            
            self.star5.backgroundColor = self.star4.backgroundColor = self.star3.backgroundColor = self.start2.backgroundColor  = hexColorString(@"e0dede");
         
            
            self.RecordLevel = @(1);
        break;
        case ZERecordLevelTypeTwoStar: // 冷淡
            self.star1.selected = NO;
            self.start2.selected = YES;
            self.start2.backgroundColor =  hexColorString(@"7ecef4");
            self.star3.selected =NO;
            self.star4.selected = NO;
            self.star5.selected = NO;
            self.star5.backgroundColor = self.star4.backgroundColor  = self.star3.backgroundColor = self.star1.backgroundColor = hexColorString(@"e0dede");
            
            
            self.RecordLevel = @(2);
         break;
        
        case ZERecordLevelTypeThreeStar: //  观望中
            
            self.star3.selected = YES;
            self.star3.backgroundColor =  hexColorString(@"7ecef4");
            self.star1.selected = NO;
            self.start2.selected = NO;
            self.star4.selected = NO;
            self.star5.selected = NO;
            
            self.star5.backgroundColor = self.star4.backgroundColor  = self.start2.backgroundColor = self.star1.backgroundColor = hexColorString(@"e0dede");
            
            self.RecordLevel = @(3);
            
            break;
            
        case ZERecordLevelTypeFourStar: // 热情
            
            self.star4.backgroundColor = hexColorString(@"7ecef4");
            self.star1.selected = NO;
            self.start2.selected = NO;
            self.star3.selected = NO;
            self.star4.selected = YES;
            self.star5.selected = NO;
            self.star5.backgroundColor = self.star3.backgroundColor = self.start2.backgroundColor = self.star1.backgroundColor = hexColorString(@"e0dede");
            
            self.RecordLevel = @(4);
            break;
          
        case ZERecordLevelTypeFiveStar: // 其他
            self.star1.selected = NO;
            self.start2.selected = NO;
            self.star3.selected = NO;
            self.star4.selected = NO;
            self.star5.selected = YES;
            self.star5.backgroundColor = hexColorString(@"7ecef4");
            self.star4.backgroundColor = self.star3.backgroundColor = self.start2.backgroundColor = self.star1.backgroundColor = hexColorString(@"e0dede");
            
            self.RecordLevel = @(5);
            break;
            
        default:
            break;
    }
}

- (IBAction)followWayChooseBtnClick:(id)sender
{
   [ZECustomerInfoTool loadFollowTypeWithController:self param:[NSDictionary dictionary] success:^(ZELoadFollowTypeRequestResult *result) {
       NSLog(@"%@",result);
       UIStoryboard * storyboard= [UIStoryboard storyboardWithName:@"CRM" bundle:nil];
       
       ZELoadFollowTypeViewController * loadVC = [storyboard instantiateViewControllerWithIdentifier:@"FollowType"];
       loadVC.followTypes = result.ReturnParList;
       UINavigationController * navi = [[UINavigationController alloc]initWithRootViewController:loadVC];
       loadVC.delegate = self;
       [self.navigationController pushViewController:[ navi.childViewControllers lastObject]  animated:YES];
       
   } failure:^(THNetWorkError *error) {
       
   }];
}

- (void)submitBtnClick:(id)sender
{
    if(self.RecordLevel == nil)
    {
        [MBProgressHUD showError:@"请评价本次跟进" toView:self.view];
        return;
    }
    if(self.type == nil)
    {
        [MBProgressHUD showError:@"请选择跟进方式" toView:self.view];
        return;
    }
   
    ZEFollowFinishTaskRequestParam * param = [[ZEFollowFinishTaskRequestParam alloc]init];
    param.FinishDate = self.strDate;
    param.Recordtype = @(self.type.TypeID);
    param.RecordLevel = self.RecordLevel;
    param.Remark = self.remarkTextView.text;
    param.CustomerID =  self.detail.CustomerID;
// 传默认值0，暂时不需要赋其他值
    param.TaskType = @0;

    [[THNetWork sharedInstance] accessServerWithUIViewController:self WithAction:@"FollowFinishTask" WithParam:[param mj_keyValues]  WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
       if(error)
       {
           [MBProgressHUD showError:@"提交失败"];
           lieonLog(@"%@",error.errorDescription);
       }else
       {
           lieonLog(@"%@",dataDic);
           [MBProgressHUD showSuccess:@"提交成功"];
           [self.navigationController popViewControllerAnimated:YES];
       }
    }];
}

#pragma mark - ZELoadFollowTypeViewControllerDelegate

- (void)loadFollowTypeViewController:(ZELoadFollowTypeViewController *)controller DidSelectedType:(ZELoadFollowType *)type
{
    self.followWayLael.text = type.Title;
    self.type = type;
    [ZELoadFollowType saveLoadFollowType:type];
    
}

#pragma mark - 关闭键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
