//
//  ZEAnalyzeTableView.m
//  ZoweeSale
//
//  Created by apple on 16/7/1.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEAnalyzeTableView.h"
#import "ZEAnalyzeCell.h"
@implementation ZEAnalyzeTableView

- (void)setupAfter{
    [super setupAfter];
    
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self registerClass:[ZEAnalyzeCell class] forCellReuseIdentifier:[ZEAnalyzeCell CellIdentifier]];
    [self setupUI];
}

- (void)setupUI{
    
    [self.viewModel.sectionModelArray removeAllObjects];
    YZSTableViewSectionModel * sectionModel = [[YZSTableViewSectionModel alloc] init];
    [self.viewModel.sectionModelArray addObject:sectionModel];
    
    YZSTableViewCellModel * cellModel1 = [[YZSTableViewCellModel alloc]init];
    [sectionModel.cellModelArray addObject:cellModel1];
    cellModel1.height = SCREEN_WIDTH /2;
    cellModel1.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView){
        ZEAnalyzeCell * cell = [tableView dequeueReusableCellWithIdentifier:[ZEAnalyzeCell CellIdentifier]];
        if (!cell) {
            cell = [[ZEAnalyzeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[ZEAnalyzeCell CellIdentifier]];
        }
        return cell;
    };
}

@end
