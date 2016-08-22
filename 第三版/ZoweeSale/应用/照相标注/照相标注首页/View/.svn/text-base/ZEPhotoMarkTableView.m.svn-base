//
//  ZEPhotoMarkTableView.m
//  ZoweeSale
//
//  Created by apple on 16/6/21.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEPhotoMarkTableView.h"
#import "ZEPhotoMarkCell.h"
@implementation ZEPhotoMarkTableView

- (void)setupAfter{
    [super setupAfter];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
   // self.backgroundColor = hexColorString(@"f5f2f2");
    [self registerClass:[ZEPhotoMarkCell class] forCellReuseIdentifier:[ZEPhotoMarkCell CellIdentifier]];
    [self viewModelInit];
}

- (void)viewModelInit{
    [self.viewModel.sectionModelArray removeAllObjects];
    YZSTableViewSectionModel *sectionModel = [[YZSTableViewSectionModel alloc] init];
    [self.viewModel.sectionModelArray addObject:sectionModel];
    
    for(int i = 0; i < 5; i++){
        YZSTableViewCellModel * cellModel = [[YZSTableViewCellModel alloc]init];
        [sectionModel.cellModelArray addObject:cellModel];
        cellModel.height = 257/667.0 * SCREEN_HEIGHT;
        cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView){
            ZEPhotoMarkCell * cell = [tableView dequeueReusableCellWithIdentifier:[ZEPhotoMarkCell CellIdentifier]];
            if (!cell) {
                cell = [[ZEPhotoMarkCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[ZEPhotoMarkCell CellIdentifier]];
            }
            
            return cell;
        };
        
        cellModel.selectionBlock = ^(NSIndexPath * indexPath,UITableView * tableView){
            
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            
        };
    }
    [self reloadData];
}

@end
