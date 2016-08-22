//
//  ZECRMTableView.m
//  ZoweeSale
//
//  Created by apple on 16/6/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZECRMTableView.h"
#import "ZEClientCell.h"
#import "ZESaleTargetCell.h"
#import "ZEPayBackViewController.h"
#import "HZURLNavigation.h"
#import "ZETargetSettingViewController.h"
@implementation ZECRMTableView
{
    YZSTableViewSectionModel * _sectionModel;
}
- (void)setupAfter{
    [super setupAfter];
   
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self registerNib:[UINib nibWithNibName:@"ZEClientCell" bundle:nil] forCellReuseIdentifier:[ZEClientCell CellIdentifier]];
    [self registerClass:[ZESaleTargetCell class] forCellReuseIdentifier:[ZESaleTargetCell CellIdentifier]];
    [self clientCellInit];
    [self viewModelInit];
}

- (void)clientCellInit{
    //应该做成headerView的,断网也能显示客户这几个图标 后期可以优化
    [self.viewModel.sectionModelArray removeAllObjects];
    _sectionModel = [[YZSTableViewSectionModel alloc] init];
    [self.viewModel.sectionModelArray addObject:_sectionModel];
    
    YZSTableViewCellModel * cellModel1 = [[YZSTableViewCellModel alloc]init];
    [_sectionModel.cellModelArray addObject:cellModel1];
    cellModel1.height = 114;
    cellModel1.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView){
        ZEClientCell * cell = [tableView dequeueReusableCellWithIdentifier:[ZEClientCell CellIdentifier]];
        if (!cell) {
            cell = [[ZEClientCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[ZEClientCell CellIdentifier]];
        }
        return cell;
    };
}

- (void)setShopModel:(ZEStatisticsModel *)shopModel{
    _shopModel = shopModel;
    [self reloadData];
}

- (void)setPersonalModel:(ZEStatisticsModel *)personalModel{
    _personalModel = personalModel;
    [self reloadData];
}

- (void)viewModelInit{
    
    YZSTableViewCellModel * cellModel2 = [[YZSTableViewCellModel alloc]init];
    [_sectionModel.cellModelArray addObject:cellModel2];
    cellModel2.height = 209;
    cellModel2.renderBlock = ^UITableViewCell *(NSIndexPath * indexPath,UITableView *tableView){
        ZESaleTargetCell * cell = [tableView dequeueReusableCellWithIdentifier:[ZESaleTargetCell CellIdentifier]];
        if (!cell) {
            cell = [[ZESaleTargetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[ZESaleTargetCell CellIdentifier]];
        }
        cell.isShop = YES;
        cell.model = _shopModel;
        
        cell.block = ^{
            [userManagershare checkUserPermission:permissionApplicationStoreTargetSetting WithBlock:^{
                ZETargetSettingViewController * targetVC = [[ZETargetSettingViewController alloc]init];
                targetVC.Type = @1;
                [[HZURLNavigation currentNavigationViewController] pushViewController:targetVC animated:YES];
            }];
        };
        return cell;
    };
    cellModel2.selectionBlock = ^(NSIndexPath * indexPath,UITableView * tableView){
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        ZEPayBackViewController * payVC = [[ZEPayBackViewController alloc]init];
        
        [[HZURLNavigation currentNavigationViewController] pushViewController:payVC animated:YES];
        payVC.Type = @1;
    };
    
    
    YZSTableViewCellModel * cellModel3 = [[YZSTableViewCellModel alloc]init];
    [_sectionModel.cellModelArray addObject:cellModel3];
    cellModel3.height = 209;
    cellModel3.renderBlock = ^UITableViewCell *(NSIndexPath * indexPath,UITableView *tableView){
        ZESaleTargetCell * cell = [tableView dequeueReusableCellWithIdentifier:[ZESaleTargetCell CellIdentifier]];
        if (!cell) {
            cell = [[ZESaleTargetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[ZESaleTargetCell CellIdentifier]];
        }
        cell.isShop = NO;
        cell.model = _personalModel;
        
        cell.block = ^{
            [userManagershare checkUserPermission:permissionApplicationPersonalTargetSetting WithBlock:^{
                
                ZETargetSettingViewController * targetVC = [[ZETargetSettingViewController alloc]init];
                targetVC.Type = @2;
                [[HZURLNavigation currentNavigationViewController] pushViewController:targetVC animated:YES];
            }];
        };
        return cell;
    };
    
    cellModel3.selectionBlock = ^(NSIndexPath * indexPath,UITableView * tableView){
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        ZEPayBackViewController * payVC = [[ZEPayBackViewController alloc]init];
        
        [[HZURLNavigation currentNavigationViewController] pushViewController:payVC animated:YES];
        payVC.Type = @2;
    };
    
}

@end
