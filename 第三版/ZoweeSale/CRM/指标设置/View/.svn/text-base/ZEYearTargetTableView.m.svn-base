//
//  ZEYearTargetTableView.m
//  ZoweeSale
//
//  Created by apple on 16/6/28.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEYearTargetTableView.h"
#import "ZEYearTargetCell.h"
@implementation ZEYearTargetTableView

- (void)setupAfter{
    [super setupAfter];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self registerClass:[ZEYearTargetCell class] forCellReuseIdentifier:[ZEYearTargetCell CellIdentifier]];
}

- (void)setModel:(ZEYearTarget *)model{
    _model = model;
    NSMutableArray * dateArr = @[model.M1,model.M2,model.M3,model.M4,model.M5,model.M6,model.M7,model.M8,model.M9,model.M10,model.M11,model.M12].mutableCopy;
    _dataArray = dateArr;
    [self.viewModel.sectionModelArray removeAllObjects];
    YZSTableViewSectionModel *sectionModel = [[YZSTableViewSectionModel alloc] init];
    [self.viewModel.sectionModelArray addObject:sectionModel];
    for (int i = 0; i < dateArr.count; i++) {
        
        YZSTableViewCellModel * cellModel1 = [[YZSTableViewCellModel alloc]init];
        [sectionModel.cellModelArray addObject:cellModel1];
        cellModel1.height = 36;
        cellModel1.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView){
            ZEYearTargetCell * cell = [tableView dequeueReusableCellWithIdentifier:[ZEYearTargetCell CellIdentifier]];
            if (!cell) {
                cell = [[ZEYearTargetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[ZEYearTargetCell CellIdentifier]];
            }
            cell.month = i + 1;
            cell.amount = dateArr[i];
            
            cell.sendData = ^(NSString * data){
                //接收到传过来的数据后 替换掉原来数据源数组中的数据 
                [_dataArray replaceObjectAtIndex:i withObject:data];
            };
            return cell;
        };
    }
    [self reloadData];
}

@end
