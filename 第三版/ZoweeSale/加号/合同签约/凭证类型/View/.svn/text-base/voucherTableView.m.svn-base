//
//  voucherTableView.m
//  ZoweeSale
//
//  Created by wanglj on 16/6/2.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "voucherTableView.h"
#import "HZURLNavigation.h"
@implementation voucherTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setupAfter{
    [self registerClass:[voucherTableVeiwCell class] forCellReuseIdentifier:self.cellStr];
    
}

- (void)setVoucherArray:(NSArray *)voucherArray{
    _voucherArray = voucherArray;
    
    [self.viewModel.sectionModelArray removeAllObjects];
    YZSTableViewSectionModel *sectionModel = [[YZSTableViewSectionModel alloc] init];
    [self.viewModel.sectionModelArray addObject:sectionModel];
    for (ZEvoucher *voucher in voucherArray) {
        YZSTableViewCellModel *cellModel = [[YZSTableViewCellModel alloc] init];
        [sectionModel.cellModelArray addObject:cellModel];
        
        cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
            voucherTableVeiwCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellStr];
            if (!cell) {
                cell = [[voucherTableVeiwCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                       reuseIdentifier:self.cellStr];
            }
            cell.vouch = voucher;
            return cell;
        };
        cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            if (self.block) {
                self.block(voucher);
            }
            [[HZURLNavigation currentNavigationViewController]popViewControllerAnimated:YES];
        };

    }
    [self reloadData];
}
@end
