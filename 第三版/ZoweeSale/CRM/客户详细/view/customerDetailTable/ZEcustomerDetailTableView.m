//
//  ZEcustomerDetailTableView.m
//  ZoweeSale
//
//  Created by wanglj on 16/6/2.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEcustomerDetailTableView.h"


#import "followTableViewCell.h"
#import "dynamicTableViewCell.h"
#import "serviceTableViewCell.h"
#import "detailedListCell.h"
#import "customerInfoTableViewCell.h"


#import "HZURLNavigation.h"
#import "ZENoticeList.h"

#import "ZEDetailNoticeViewController.h"
#import "ZEAttachmentsViewController.h"
@implementation ZEcustomerDetailTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setupAfter{
    self.tableFooterView = [UIView new];
    self.tableHeaderView = [UIView new];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self registerClass:[followTableViewCell class] forCellReuseIdentifier:[followTableViewCell CellIdentifier]];
    [self registerClass:[dynamicTableViewCell class] forCellReuseIdentifier:[dynamicTableViewCell CellIdentifier]];
    [self registerClass:[detailedListCell class] forCellReuseIdentifier:[detailedListCell CellIdentifier]];
    [self registerClass:[serviceTableViewCell class] forCellReuseIdentifier:[serviceTableViewCell CellIdentifier]];
    [self registerClass:[customerInfoTableViewCell class] forCellReuseIdentifier:[customerInfoTableViewCell CellIdentifier]];
    [self viewModelInit];

}

- (void)viewModelInit{
    [self.viewModel.sectionModelArray removeAllObjects];
    YZSTableViewSectionModel *sectionModel = [[YZSTableViewSectionModel alloc] init];
    [self.viewModel.sectionModelArray addObject:sectionModel];
    
    YZSTableViewCellModel *cellModel1 = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel1];
    cellModel1.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        followTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[followTableViewCell CellIdentifier]];
        if (!cell) {
            cell = [[followTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                     reuseIdentifier:[followTableViewCell CellIdentifier]];
        }
        cell.detailTitle = @"跟进情况";
        cell.detail = self.detail;
        return cell;
    };
    cellModel1.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        //请求网络连接,有数据则跳转
        [self requesetWithAction:@"LoadCustomerFollowInfo" param:@"CustomerID" destionationVCID:@"toFollowingStatus"];
    };
    cellModel1.heightBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        return [tableView cellHeightForIndexPath:indexPath model:self.detail  keyPath:@"detail" cellClass:[followTableViewCell class] contentViewWidth:[self cellContentViewWith]];

    };
    
    YZSTableViewCellModel *cellModel2 = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel2];
    cellModel2.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        dynamicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[dynamicTableViewCell CellIdentifier]];
        if (!cell) {
            cell = [[dynamicTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:[dynamicTableViewCell CellIdentifier]];
        }
        cell.detailTitle = @"客户动态";
        cell.detail = self.detail;
        return cell;
    };
    cellModel2.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        //请求网络连接,有数据则跳转
        [self requesetWithAction:@"LoadCustomerStateInfo" param:@"CustomerID" destionationVCID:@"toCustomerActivity"];
    };
    cellModel2.heightBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        return [tableView cellHeightForIndexPath:indexPath model:self.detail  keyPath:@"detail" cellClass:[dynamicTableViewCell class] contentViewWidth:[self cellContentViewWith]];
        
    };
    
    YZSTableViewCellModel *cellModel3 = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel3];
    cellModel3.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        detailedListCell *cell = [tableView dequeueReusableCellWithIdentifier:[detailedListCell CellIdentifier]];
        if (!cell) {
            cell = [[detailedListCell alloc] initWithStyle:UITableViewCellStyleDefault
                                               reuseIdentifier:[detailedListCell CellIdentifier]];
        }
        cell.detailTitle = @"价格清单";
        cell.text = @"订购价格明细表";
        return cell;
    };
    cellModel3.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [userManagershare checkUserPermission:permissionCustomerDetailPriceList WithBlock:^{
            ZENoticeList* list = [[ZENoticeList alloc]init];
            list.NoticeUrl = self.detail.PriceListUrl;
            ZEDetailNoticeViewController *controller = [[ZEDetailNoticeViewController alloc]init];
            controller.noticeList = list;
            controller.titleStr = @"价格清单";
            [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
        }];
        return;
    };
    cellModel3.heightBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        return [tableView cellHeightForIndexPath:indexPath model:nil  keyPath:@"text" cellClass:[detailedListCell class] contentViewWidth:[self cellContentViewWith]];
    };
    
    YZSTableViewCellModel *cellModel4 = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel4];
    cellModel4.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        detailedListCell *cell = [tableView dequeueReusableCellWithIdentifier:[detailedListCell CellIdentifier]];
        if (!cell) {
            cell = [[detailedListCell alloc] initWithStyle:UITableViewCellStyleDefault
                                           reuseIdentifier:[detailedListCell CellIdentifier]];
        }
        cell.detailTitle = @"合同清单";
        cell.text = @"合同明细表";
        return cell;
    };
    cellModel4.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [userManagershare checkUserPermission:permissionCustomerDetailContractList WithBlock:^{
            ZENoticeList* list = [[ZENoticeList alloc]init];
            list.NoticeUrl = self.detail.ContractListUrl;
            ZEDetailNoticeViewController *controller = [[ZEDetailNoticeViewController alloc]init];
            controller.noticeList = list;
            controller.titleStr = @"合同清单";
            [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
        }];
        return;
    };
    cellModel4.heightBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        return [tableView cellHeightForIndexPath:indexPath model:nil  keyPath:@"text" cellClass:[detailedListCell class] contentViewWidth:[self cellContentViewWith]];
    };

    YZSTableViewCellModel *cellModel5 = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel5];
    cellModel5.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        serviceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[serviceTableViewCell CellIdentifier]];
        if (!cell) {
            cell = [[serviceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                           reuseIdentifier:[serviceTableViewCell CellIdentifier]];
        }
        cell.detailTitle = @"服务团队";
        cell.detail = self.detail;
        return cell;
    };
    cellModel5.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        //请求网络连接,有数据则跳转
        [self requesetWithAction:@"LoadCustomerTeamInfo" param:@"CustomerID" destionationVCID:@"toCustomerTeam"];
    };
    cellModel5.heightBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        return [tableView cellHeightForIndexPath:indexPath model:self.detail  keyPath:@"detail" cellClass:[serviceTableViewCell class] contentViewWidth:[self cellContentViewWith]];
    };
    
    YZSTableViewCellModel *cellModel6 = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel6];
    cellModel6.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        customerInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[customerInfoTableViewCell CellIdentifier]];
        if (!cell) {
            cell = [[customerInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                               reuseIdentifier:[customerInfoTableViewCell CellIdentifier]];
        }
        cell.detailTitle = @"客户信息";
        cell.model =_model;
        return cell;
    };
    cellModel6.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        //请求网络连接,有数据则跳转
        [self requesetWithAction:@"LoadCustomerBaseInfo" param:@"CustomerID" destionationVCID:@"toCustomerInfo"];
    };
    cellModel6.heightBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        return [tableView cellHeightForIndexPath:indexPath model:_model  keyPath:@"model" cellClass:[customerInfoTableViewCell class] contentViewWidth:[self cellContentViewWith]];
    };
    
    YZSTableViewCellModel *cellModel7 = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel7];
    cellModel7.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        detailedListCell *cell = [tableView dequeueReusableCellWithIdentifier:[detailedListCell CellIdentifier]];
        if (!cell) {
            cell = [[detailedListCell alloc] initWithStyle:UITableViewCellStyleDefault
                                           reuseIdentifier:[detailedListCell CellIdentifier]];
        }
        cell.detailTitle = @"附件浏览";
        cell.text = @"进入查看附件详情";
        return cell;
    };
    cellModel7.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        ZEAttachmentsViewController *controller = [[ZEAttachmentsViewController alloc]init];
        controller.detail = self.detail;
        [[HZURLNavigation currentNavigationViewController]pushViewController:controller animated:YES];
        return;
    };
    cellModel7.heightBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        return [tableView cellHeightForIndexPath:indexPath model:nil  keyPath:@"text" cellClass:[detailedListCell class] contentViewWidth:[self cellContentViewWith]];
    };


}

- (void)setDetail:(customerDetail *)detail{
    _detail = detail;
    _model = [[customerinfoModel alloc]init];
    _model.customerName = self.detail.CustomerName;
    _model.Mobile = self.detail.Mobile;
    _model.address = self.detail.Address;
    [self reloadData];
}


#pragma mark - 其他辅助方法
- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}

- (void)requesetWithAction:(NSString * )action param:(NSString*)param destionationVCID:(NSString*)ID
{
    UIViewController *controller = [HZURLNavigation currentViewController];
    [controller showLodingMBProgressWithMsg];
    if (!self.detail) {
        return;
    }
    [[THNetWork sharedInstance]accessServerWithUIViewController:controller WithAction:action WithParam:@{param:self.detail.CustomerID} WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        id ReturnParList = dataDic[@"ReturnParList"];
        if ([ReturnParList isKindOfClass:[NSArray class]]) {
            NSArray * list = (NSArray *)ReturnParList;
            if((list.count == 0 ) || error )  // 没有数据
            {
                [controller hideAllProgress];
                [MBProgressHUD showError:@"暂时没有数据" toView:controller.view];
                return ;
            }
        }else{
            NSDictionary * list = (NSDictionary *)ReturnParList;
            if((list.count == 0 ) || error )  // 没有数据
            {
                [controller hideAllProgress];
                [MBProgressHUD showError:@"暂时没有数据" toView:controller.view];
                return ;
            }
        }
        
        lieonLog(@"ReturnParList:%@",dataDic[@"ReturnParList"]);
        [dataDic[@"ReturnParList"] writeToFile:customerDetailItemPath atomically:YES ];
        
        [controller hideAllProgress];
        [controller performSegueWithIdentifier:ID sender:nil];
    }];
}
@end
