//
//  workCellFootView.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/10.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "workCellFootView.h"
#import "ZEFollowFinishTaskViewController.h"
#import "taskfinishViewController.h"
#import "HZURLNavigation.h"
#import "ZEArrangMentViewController.h"
#import "customerMapAddressViewController.h"
@implementation workCellFootView{

    UIButton *okBtn;
    UIButton *addressBtn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        //self.backgroundColor = [UIColor redColor];
        [self setup];
        //self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)setup{
    self.backgroundColor = [UIColor whiteColor];
    UIEdgeInsets titleEdge = UIEdgeInsetsMake(0, 10, 0, 0);
    UIEdgeInsets iamgeEdge = UIEdgeInsetsMake(0, 0, 0, 10);
    addressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addressBtn setTitle:@"位置" forState:UIControlStateNormal];
    addressBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    addressBtn.titleEdgeInsets = titleEdge;
    addressBtn.imageEdgeInsets = iamgeEdge;
    [addressBtn setTitleColor:hexColorString(@"666666") forState:UIControlStateNormal];
    [addressBtn setImage:[UIImage imageNamed:@"工作地址"] forState:UIControlStateNormal];
    [addressBtn addTarget:self action:@selector(addressBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:addressBtn];
    addressBtn.sd_layout
    .topEqualToView(self)
    .leftEqualToView(self)
    .bottomEqualToView(self)
    .widthIs(SCREEN_WIDTH/2);
//    addressBtn.frame = CGRectMake(0, 0, SCREEN_WIDTH/2, self.height);
    
    okBtn = [[UIButton alloc]init];
    okBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:okBtn];
    okBtn.titleEdgeInsets = titleEdge;
    okBtn.imageEdgeInsets = iamgeEdge;
    [okBtn setTitleColor:hexColorString(@"666666") forState:UIControlStateNormal];
    okBtn.sd_layout
    .topEqualToView(self)
    .bottomEqualToView(self)
    .rightEqualToView(self)
    .widthIs(SCREEN_WIDTH/2);
//    okBtn.frame = CGRectMake(addressBtn.right, 0, SCREEN_WIDTH/2, self.height);
    [okBtn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *labLine = [UILabel new];
    labLine.backgroundColor = [hexColorString(@"666666") colorWithAlphaComponent:0.2];
    [self addSubview:labLine];
    labLine.sd_layout
    .topSpaceToView(self,10)
    .bottomSpaceToView(self,10)
    .widthIs(0.5)
    .centerXEqualToView(self)
    .centerYEqualToView(self);
    
    UILabel *bottomLine = [UILabel new];
    bottomLine.backgroundColor = [hexColorString(@"666666") colorWithAlphaComponent:0.4];
    [self addSubview:bottomLine];
    bottomLine.sd_layout
    .bottomEqualToView(self)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(0.5);
}

- (void)setWorkModel:(ZeroWork *)workModel {
    _workModel = workModel;
    if ([workModel.TaskTypeID isEqual:@8]) {
        [okBtn setImage:[UIImage imageNamed:@"派尺"] forState:UIControlStateNormal];
        [okBtn setTitle:@"派尺" forState:UIControlStateNormal];
    }else{
        [okBtn setImage:[UIImage imageNamed:@"完成"] forState:UIControlStateNormal];
        [okBtn setTitle:@"完成" forState:UIControlStateNormal];
    }
}
- (void)BtnClick:(UIButton *)sender{
    if ([_workModel.State isEqual:@2]) {//任务状态为已完成
        [[HZURLNavigation currentViewController] showToastWithMsg:@"任务已经完成"];
        return;
        }
    if ([_workModel.TaskTypeID isEqual:@1]) { //跟进任务完成
        ZEFollowFinishTaskViewController *controller = [[UIStoryboard storyboardWithName:@"CRM" bundle:nil] instantiateViewControllerWithIdentifier:@"followFinish"];
        customerDetail *detail = [[customerDetail alloc]init];
        detail.TaskID = _workModel.TaskID;
        detail.CustomerID = _workModel.CustomerID;
        controller.detail = detail;
        [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
    }else if([_workModel.TaskTypeID isEqual:@2]) { //初尺任务完成
        taskfinishViewController *controller = [[UIStoryboard storyboardWithName:@"Work" bundle:nil] instantiateViewControllerWithIdentifier:@"taskfinish"];
        workDetailed *detail = [[workDetailed alloc]init];
        detail.TaskID = _workModel.TaskID;
        detail.CustomerID = _workModel.CustomerID;
        controller.detail = detail;
        [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
    }else if([_workModel.TaskTypeID isEqual:@8]) {
        ZEArrangMentViewController *controller = [[ZEArrangMentViewController alloc]init];
        controller.tablement.OrderId = _workModel.CustomerID;
        controller.tablement.customerName = _workModel.CustomerName;
        [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
    }
}

-(void) addressBtnClick:(UIButton *)sender {
    CLLocationCoordinate2D pt = (CLLocationCoordinate2D){0,0};
    pt.latitude = [self.workModel.PointX floatValue];
    pt.longitude = [self.workModel.PointY floatValue];
    customerMapAddressViewController *mapController = [[customerMapAddressViewController alloc]init];
    mapController.customerPt = pt;
    mapController.customerAddress = self.workModel.Content;
    [[HZURLNavigation currentNavigationViewController] pushViewController:mapController animated:YES];
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//////    UIView *result = [super hitTest:point withEvent:event];
//////    if ([result isKindOfClass:[UIButton class]]) {
//////        return self;
//////    }
////    return self;
//    NSLog(@"%@",event);
//    return [super hitTest:point withEvent:event];
//}
@end
