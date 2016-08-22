//
//  taskfinishViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/1.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "taskfinishViewController.h"
#import "WorkingInterface.h"
#import "ZETextView.h"
#import "ZEWorkTool.h"
#import "ZEFinishScaleTaskRequestParam.h"
#import "ZERemarkViewController.h"

@interface taskfinishViewController ()<UIAlertViewDelegate>
@property (nonatomic,weak) ZETextView * textView;
@property (nonatomic,weak) UILabel * dateLabel;
@property(nonatomic,copy) NSString * strDate;
@end

@implementation taskfinishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addfinishBtn];
    // 添加textView
    [self addtextView];
    
}

#pragma mark - 私有方法

- (void)addfinishBtn {
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [btn setTitle:@"完成" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(finishBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightStateItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightStateItem;
}
- (void)addtextView
{
    self.view.backgroundColor = hexColorString(@"f5f2f3");
    
    ZETextView * textView = [[ZETextView alloc]init];
    textView.placeholder = @"输入备注";
    self.textView = textView;
    
    UILabel * label = [[UILabel alloc]init];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentLeft;
    
    label.text = @"3月11日 9:45";
    label.textColor = hexColorString(@"666666");
    self.dateLabel = label;
    
    // 获取本地时间
    NSDate * date = [NSDate date];
    
    // 界面上显示的时间格式
    NSDateFormatter * dateformater = [[NSDateFormatter alloc]init];
    dateformater.dateFormat = @"MM月dd日 hh:mm";
    NSString *strDate  = [dateformater stringFromDate:date];
    self.dateLabel.text = strDate;
    
    // 发送给服务器的时间格式
    dateformater.dateFormat =@"yyyy-MM-dd hh:mm:ss";
    NSString *  strDate1 = [dateformater stringFromDate:date];
    self.strDate = strDate1;
    
    UIImageView * imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"icon_Clock"];
    
    [self.view addSubview:textView];
    [self.view addSubview:label];
    [self.view addSubview:imageView];
    // 设置约束
    textView.sd_layout.topSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .heightIs(260);
    
    label.sd_layout.rightSpaceToView(self.view,10)
    .topSpaceToView(self.textView,10)
    .widthIs(135)
    .autoHeightRatio(0);
    
    imageView.sd_layout.rightSpaceToView(self.dateLabel,5)
    .topSpaceToView(self.textView,15)
    .widthIs(12)
    .heightIs(12);
}
#pragma  mark -  点击按钮
- (void)finishBtnClick:(UIButton *)sender {
    
    [MBProgressHUD showMessage:@"提交中..."];
    ZEFinishScaleTaskRequestParam * param = [[ZEFinishScaleTaskRequestParam alloc]init];
    param.FinishDate = self.strDate;
    param.Remark = self.textView.text;
    param.CustomerID = self.detail.CustomerID;
    param.TaskID = self.detail.TaskID;
    
    [ZEWorkTool finishScaleTaskWithController:self param:param success:^(ZEFinishScaleTaskRequestResult *result) {
        [MBProgressHUD hideHUD];
        if(result.Result == 1)
        {
            [self.navigationController popViewControllerAnimated:YES];
            [MBProgressHUD showSuccess:@"提交成功"];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"量尺完成" message:@"是否立即出图" delegate:self cancelButtonTitle:@"返回列表" otherButtonTitles:@"出图", nil];
            [alert show];
        }else {
            [MBProgressHUD showError:@"提交失败"];
        }
    } failure:^(THNetWorkError *error) {
        
        [MBProgressHUD hideHUD];
        [MBProgressHUD showError:@"提交失败"];
    }];
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        ZERemarkViewController *controller = [[ZERemarkViewController alloc]init];
        controller.customer.CustomerID = _detail.CustomerID;
        [self.navigationController pushViewController:controller animated:YES];

    }
}


@end
