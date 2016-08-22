//
//  ZERankListTableView.m
//  ZoweeSale
//
//  Created by apple on 16/6/27.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZERankListTableView.h"
#import "ZERankListCell.h"
@implementation ZERankListTableView

- (void)setupAfter{
    [super setupAfter];
    self.backgroundColor = hexColorString(@"f5f2f2");
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self registerNib:[UINib nibWithNibName:@"ZERankListCell" bundle:nil] forCellReuseIdentifier:[ZERankListCell CellIdentifier]];
    
}

- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    [self viewModelInit];
    [self reloadData];
}

- (void)viewModelInit{
    
    [self.viewModel.sectionModelArray removeAllObjects];
    YZSTableViewSectionModel *sectionModel = [[YZSTableViewSectionModel alloc] init];
    [self.viewModel.sectionModelArray addObject:sectionModel];
    
    for(ZERankingList * model in self.dataArray){
        YZSTableViewCellModel * cellModel = [[YZSTableViewCellModel alloc]init];
        [sectionModel.cellModelArray addObject:cellModel];
        cellModel.height = 50;
        cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView){
            ZERankListCell * cell = [tableView dequeueReusableCellWithIdentifier:[ZERankListCell CellIdentifier]];
            if (!cell) {
                cell = [[ZERankListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[ZERankListCell CellIdentifier]];
            }
            cell.listModel = model;
            return cell;
        };
    }
}

@end
