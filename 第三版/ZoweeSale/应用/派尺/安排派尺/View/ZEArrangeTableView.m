//
//  ZEArrangeTableView.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEArrangeTableView.h"
#import "HZURLNavigation.h"
#import "YZSTableViewModel.h"
#import "ZEPushChoiceTableViewCell.h"
#import "choiceAllViewController.h"
#import "STPickerDate.h"
#import "ZEIntentionViewController.h"

@interface ZEArrangeTableView ()<STPickerDateDelegate>



@end

@implementation ZEArrangeTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setupAfter{
    [super setupAfter];
    //self.ment = [[arrangeMent alloc]init];
    [self registerClass:[ZEPushChoiceTableViewCell class] forCellReuseIdentifier:self.cellStr];
    
    [self.viewModel.sectionModelArray removeAllObjects];
    YZSTableViewSectionModel *sectionModel = [[YZSTableViewSectionModel alloc] init];
    [self.viewModel.sectionModelArray addObject:sectionModel];
    
    YZSTableViewCellModel *cellModel = [[YZSTableViewCellModel alloc] init];
    //cellModel.height = 44;
    [sectionModel.cellModelArray addObject:cellModel];
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        ZEPushChoiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellStr];
        if (!cell) {
            cell = [[ZEPushChoiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:self.cellStr];
        }
        cell.title = @"客户名称";
        cell.rightIcon = @"Button_Arrow_Right";
        cell.placeholderText = @"选择客户";
        cell.contentText = _ment.customerName;
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        ZEIntentionViewController *controller = [[ZEIntentionViewController alloc]init];
        controller.title = @"选择派尺客户";
        controller.interfaceStr = @"SendRulerCustomerList";
        controller.screenView.sortTypeArray = [NSMutableArray arrayWithArray:@[
                                                                               [[sortType alloc]initWithtype:@"按登记日期排序" num:customersSortRegistTime],
                                                                               [[sortType alloc]initWithtype:@"按客户名称排序" num:customersSortName]
                                                                               ]];
        controller.selection = ^(IntentionEntityClass *customer){
            _ment.customerName = customer.CustomerName;
            _ment.OrderId = customer.CustomerID;
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            [[HZURLNavigation currentNavigationViewController] popViewControllerAnimated:YES];
        };
        [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
    };
    
    YZSTableViewCellModel *cellModel1 = [[YZSTableViewCellModel alloc] init];
    //cellModel.height = 44;
    [sectionModel.cellModelArray addObject:cellModel1];
    cellModel1.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        ZEPushChoiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellStr];
        if (!cell) {
            cell = [[ZEPushChoiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                  reuseIdentifier:self.cellStr];
        }
        cell.title = @"设计师";
        cell.rightIcon = @"Button_Arrow_Right";
        cell.placeholderText = @"选择设计师";
        cell.contentText = _ment.desigerName;
        return cell;
    };
    cellModel1.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        choiceAllViewController *controller = [[choiceAllViewController alloc]init];
        controller.titleName = @"派尺设计师";
        controller.block = ^(NSNumber *ID,NSString *name){
            _ment.DesignerID = ID;
            _ment.desigerName = name;
            [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        };
        [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
    };
    
    YZSTableViewCellModel *cellModel2 = [[YZSTableViewCellModel alloc] init];
    //cellModel.height = 44;
    [sectionModel.cellModelArray addObject:cellModel2];
    cellModel2.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        ZEPushChoiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellStr];
        if (!cell) {
            cell = [[ZEPushChoiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:self.cellStr];
        }
        cell.title = @"量尺时间";
        cell.rightIcon = @"time";
        cell.placeholderText = @"选择时间";
        cell.contentText = _ment.MeasureDate;
        return cell;
    };
    cellModel2.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        STPickerDate *pickerDate = [[STPickerDate alloc]init];
        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
        [pickerDate setDelegate:self];
        [pickerDate show];
    };

}
#pragma mark - 日期选择控件代理

- (void)pickerDate:(STPickerDate *)pickerDate year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day{
    NSString *yearStr = [NSString stringWithFormat:@"%ld",(long)year];
    NSString *monthStr = [NSString stringWithFormat:@"%ld",(long)month];
    NSString *dayStr = [NSString stringWithFormat:@"%ld",(long)day];
    if (monthStr.length == 1) {
        monthStr = [NSString stringWithFormat:@"0%@",monthStr];
    }
    if (dayStr.length == 1) {
        dayStr = [NSString stringWithFormat:@"0%@",dayStr];
    }
    NSString *dateStr = [NSString stringWithFormat:@"%@-%@-%@",yearStr,monthStr,dayStr];
    _ment.MeasureDate = dateStr;
    [self reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}



@end

@implementation arrangeMent

- (NSString *)entityisNoEmpty {
    if (!self.DesignerID.isNoEmpty) {
        return @"请选择设计师";
    }else if (!self.OrderId.isNoEmpty){
        return @"请选择客户";
    }else if (!self.MeasureDate.isNoEmpty){
        return @"请选择量尺时间";
    }
    return nil;
}

@end
