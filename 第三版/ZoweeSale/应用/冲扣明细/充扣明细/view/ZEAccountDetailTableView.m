
//
//  ZEAccountDetailTableView.m
//  ZoweeSale
//
//  Created by apple on 16/6/13.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEAccountDetailTableView.h"
#import "detailTableViewCell.h"
#import "especialAccountCell.h"
@interface ZEAccountDetailTableView()
@end
@implementation ZEAccountDetailTableView

- (void)setupAfter{
    [super setupAfter];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self registerNib:[UINib nibWithNibName:@"detailTableViewCell" bundle:nil] forCellReuseIdentifier:[detailTableViewCell CellIdentifier]];
    [self registerNib:[UINib nibWithNibName:@"especialAccountCell" bundle:nil] forCellReuseIdentifier:[especialAccountCell CellIdentifier]];

}

- (void)setSingleDetail:(ZESingleDetail *)singleDetail{
    _singleDetail = singleDetail;
    [self viewModelInit];
    [self reloadData];
}

#pragma mark - 请求数据
- (void)viewModelInit{
    [self.viewModel.sectionModelArray removeAllObjects];
    YZSTableViewSectionModel *sectionModel = [[YZSTableViewSectionModel alloc] init];
    [self.viewModel.sectionModelArray addObject:sectionModel];

    YZSTableViewCellModel *cellModel1 = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel1];
    cellModel1.height = 33;
    cellModel1.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        detailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[detailTableViewCell CellIdentifier]];
        if (!cell) {
            cell = [[detailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:[detailTableViewCell CellIdentifier]];
        }
        cell.title = @"客户姓名";
        cell.detail = _singleDetail.CustomerName;
        return cell;
    };
    
    YZSTableViewCellModel *cellModel2 = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel2];
    cellModel2.height = 33;
    cellModel2.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        detailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[detailTableViewCell CellIdentifier]];
        if (!cell) {
            cell = [[detailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:[detailTableViewCell CellIdentifier]];
        }
        cell.title = @"合同自编号";
        cell.detail = _singleDetail.ContractSelfNo;
        return cell;
    };
    
    YZSTableViewCellModel *cellModel3 = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel3];
    cellModel3.height = 115;
    cellModel3.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        especialAccountCell *cell = [self dequeueReusableCellWithIdentifier:[especialAccountCell CellIdentifier] forIndexPath:indexPath];


        cell.singleDetail = _singleDetail;
        return cell;
    };
    
    
    YZSTableViewCellModel *cellModel4 = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel4];
    cellModel4.height = 33;
    cellModel4.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        detailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[detailTableViewCell CellIdentifier]];
        if (!cell) {
            cell = [[detailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:[detailTableViewCell CellIdentifier]];
        }
        cell.title = @"充扣编号";
        cell.detail = _singleDetail.DetailNo;
        return cell;
    };
    YZSTableViewCellModel *cellModel5 = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel5];
    cellModel5.height = 33;
    cellModel5.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        detailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[detailTableViewCell CellIdentifier]];
        if (!cell) {
            cell = [[detailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:[detailTableViewCell CellIdentifier]];
        }
        cell.title = @"合同号";
        cell.detail = _singleDetail.ContractNo;
        return cell;
    };
    
    YZSTableViewCellModel *cellModel6 = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel6];
    cellModel6.height = 33;
    cellModel6.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        detailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[detailTableViewCell CellIdentifier]];
        if (!cell) {
            cell = [[detailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:[detailTableViewCell CellIdentifier]];
        }
        cell.title = @"所属门店";
        cell.detail = _singleDetail.ShopName;
        return cell;
    };
    
    YZSTableViewCellModel *cellModel7 = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel7];
    cellModel7.height = 33;
    cellModel7.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        detailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[detailTableViewCell CellIdentifier]];
        if (!cell) {
            cell = [[detailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:[detailTableViewCell CellIdentifier]];
        }
        cell.title = @"收支类型";
        cell.detail = _singleDetail.PaymentsTitle;
        return cell;
    };
    
    YZSTableViewCellModel *cellModel8 = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel8];
    cellModel8.height = 33;
    cellModel8.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        detailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[detailTableViewCell CellIdentifier]];
        if (!cell) {
            cell = [[detailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:[detailTableViewCell CellIdentifier]];
        }
        cell.title = @"科目名称";
        cell.detail = _singleDetail.SubjectTitle;
        return cell;
    };
    
    YZSTableViewCellModel *cellModel9 = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel9];
    cellModel9.height = 33;
    cellModel9.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        detailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[detailTableViewCell CellIdentifier]];
        if (!cell) {
            cell = [[detailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:[detailTableViewCell CellIdentifier]];
        }
        
        cell.title = @"过账日期";
        NSRange range = NSMakeRange(0, _singleDetail.AccTime.length - 9);
        NSString * num = [_singleDetail.AccTime substringWithRange:range];
        cell.detail = num;
        return cell;
    };
    
    YZSTableViewCellModel *cellModel10 = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel10];
    cellModel10.height = 33;
    cellModel10.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        detailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[detailTableViewCell CellIdentifier]];
        if (!cell) {
            cell = [[detailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:[detailTableViewCell CellIdentifier]];
        }
        cell.title = @"备注";
        cell.detail = _singleDetail.Remark;
        return cell;
    };
}


#pragma mark - UITableViewDelegate,UITableViewDataSource
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 10;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row == 2) {
//        return 115;
//    }else{
//        return 33;
//    }
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if(indexPath.row == 2){
//        especialAccountCell * especialCell = [self dequeueReusableCellWithIdentifier:[especialAccountCell CellIdentifier] forIndexPath:indexPath];
//        especialCell.singleDetail = self.singleDetail;
//        
//        return especialCell;
//    }else if(){
//        detailTableViewCell * normalCell = [self dequeueReusableCellWithIdentifier:[detailTableViewCell CellIdentifier] forIndexPath:indexPath];
//        normalCell.title =
//        
//        return normalCell;
//    }
//}

@end

