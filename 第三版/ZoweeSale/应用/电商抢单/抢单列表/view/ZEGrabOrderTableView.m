//
//  ZEGrabOrderTableView.m
//  ZoweeSale
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEGrabOrderTableView.h"
#import "ZEGrabOrderCell.h"
#import "ZERedPacketView.h"
#import "ZERushOrderMessageViewController.h"
#import "HZURLNavigation.h"
#import "ZEGrabCustomerList.h"
//  在iPhone6上的标准比例
#define widthRatio  ((280)/ 375.0)
#define heightRatio (350/667.0)
@implementation ZEGrabOrderTableView
{
    UIView * _alphaView;//阴影视图
    ZERedPacketView * _RPView;//仿红包抢单视图
    ZEGrabCustomerList * _dataModel;//保存点击每个cell的Model
}
-(void)setupAfter{
    
    [super setupAfter];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self registerClass:[ZEGrabOrderCell class] forCellReuseIdentifier:[ZEGrabOrderCell CellIdentifier]];
}

- (void)setSourceArray:(NSArray *)sourceArray{
    _sourceArray = sourceArray;
    
    [self.viewModel.sectionModelArray removeAllObjects];
    YZSTableViewSectionModel *sectionModel = [[YZSTableViewSectionModel alloc] init];
    [self.viewModel.sectionModelArray addObject:sectionModel];
    
    for(ZEGrabCustomerList * model in self.sourceArray){
        YZSTableViewCellModel * cellModel = [[YZSTableViewCellModel alloc]init];
        [sectionModel.cellModelArray addObject:cellModel];
        cellModel.height = 72;
        cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView){
            ZEGrabOrderCell * cell = [tableView dequeueReusableCellWithIdentifier:[ZEGrabOrderCell CellIdentifier]];
            if (!cell) {
                cell = [[ZEGrabOrderCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[ZEGrabOrderCell CellIdentifier]];
            }
            cell.model = model;
            return cell;
        };
        
        cellModel.selectionBlock = ^(NSIndexPath * indexPath,UITableView * tableView){
            
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            _dataModel = self.sourceArray[indexPath.row];//选中cell时记录model
            
            if ([model.State integerValue] == 1) {
                //已被抢 直接进入详情界面
                ZERushOrderMessageViewController *controller = [[ZERushOrderMessageViewController alloc]init];
                controller.customerID = _dataModel.CustomerID;
                [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
            }else{
                [self cellClickEvent];
            }
        };
    }
    [self reloadData];
}

#pragma mark - 点击事件
- (void)cellClickEvent{
    //抢单视图弹出时,navBar返回按钮失效
    [HZURLNavigation currentNavigationViewController].navigationBar.userInteractionEnabled = NO;
    //背景阴影
    _alphaView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    _alphaView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.5];
    
    [[UIApplication sharedApplication].keyWindow addSubview:_alphaView];
    
    //抢单仿红包View
    _RPView = [[ZERedPacketView alloc]init];
    _RPView.grabModel = _dataModel;
    _RPView.transform = CGAffineTransformMakeScale(0.02, 0.02);
    [UIView animateWithDuration:0.2 animations:^{
        _RPView.transform = CGAffineTransformMakeScale(1, 1);
    }];
    [_alphaView addSubview:_RPView];
    _RPView.sd_layout
    .centerXEqualToView(_alphaView)
    .centerYEqualToView(_alphaView)
    .heightIs(heightRatio * SCREEN_HEIGHT)
    .widthIs(widthRatio * SCREEN_WIDTH);
    
    //点击"抢"上方区域,可放弃抢单
//    UIButton * abandonBtn = [[UIButton alloc]init];
//    [_alphaView addSubview:abandonBtn];
//    [abandonBtn addTarget:self action:@selector(abandonBtnClicked) forControlEvents:UIControlEventTouchUpInside];
//    abandonBtn.sd_layout
//    .topSpaceToView(_alphaView,0)
//    .centerXEqualToView(_alphaView)
//    .widthIs(SCREEN_WIDTH)
//    .bottomSpaceToView(_RPView,0);
    
    //点击阴影区域,可放弃抢单
    UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(abandonGrab)];
    [_alphaView addGestureRecognizer:tapGes];
    
    //接受点击"抢"的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(grabBtnClick) name:@"grabBtnClick" object:nil];
}

- (void)grabBtnClick{
    
    THBaseRequestApi * api = [[THBaseRequestApi alloc]initWithAction:@"GrabCustomer" Requestparameter:@{@"CustomerID":_dataModel.CustomerID}];
    [api addAccessory:api];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        
        [HZURLNavigation currentNavigationViewController].navigationBar.userInteractionEnabled = YES;
        ZERushOrderMessageViewController *controller = [[ZERushOrderMessageViewController alloc]init];
        controller.customerID = _dataModel.CustomerID;
        [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
        
    } failure:^(__kindof YTKBaseRequest *request) {
        NSLog(@"%@",request.requestOperationError);
    
    }];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [_alphaView removeFromSuperview];
    [_RPView removeFromSuperview];
    
}

- (void)abandonGrab{
    _RPView.transform = CGAffineTransformMakeScale(1, 1);
    [UIView animateWithDuration:0.2 animations:^{
        _RPView.transform = CGAffineTransformMakeScale(0.3, 0.3);
    } completion:^(BOOL finished) {
        _RPView.transform = CGAffineTransformMakeScale(0, 0);
        [_alphaView removeFromSuperview];
    }];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [HZURLNavigation currentNavigationViewController].navigationBar.userInteractionEnabled = YES;
}
@end
