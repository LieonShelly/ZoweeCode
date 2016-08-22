//
//  ZETableView.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/4.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZETableView.h"
#import "ZEPushChoiceTableViewCell.h"
#import "ZEInputTextTableViewCell.h"
#import "YZSTableviewModel.h"
#import "HZURLNavigation.h"
#import "choiceAllViewController.h"
#import "NSNumber+TH.h"
#import "reviceManViewController.h"
#import "STPickerDate.h"
#import "ZEIntentionViewController.h"

NSString *push = @"pushCell";
NSString *input = @"inputCell";

@interface ZETableView ()<UITextFieldDelegate,STPickerDateDelegate>



@end



@implementation ZETableView{
    YZSTableViewModel *_viewModel;
}
@synthesize orderAppoint = _orderAppoint;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setOrderID:(NSString *)orderID {
    _orderID = orderID;
    self.orderAppoint.OrderNo = orderID;
    [self reloadData];
}
- (orderAppointment *)orderAppoint{
    if (!_orderAppoint) {
        _orderAppoint = [[orderAppointment alloc]init];
    }
    return _orderAppoint;
}

- (void)setOrderAppoint:(orderAppointment *)orderAppoint{
    _orderAppoint = orderAppoint;
    [self setup];
}

- (void)setup {
    self.backgroundColor = [UIColor colorWithHexString:@"f5f2f3"];
    [self registerClass:[ZEPushChoiceTableViewCell class] forCellReuseIdentifier:push];
    [self registerClass:[ZEInputTextTableViewCell class] forCellReuseIdentifier:input];
    self.tableFooterView = [UIView new];
    _viewModel= [[YZSTableViewModel alloc]init];
    self.delegate = _viewModel;
    self.dataSource = _viewModel;
//    orderAppoint = [[orderAppointment alloc]init];
    
    [_viewModel.sectionModelArray removeAllObjects];
    YZSTableViewSectionModel *sectionModel = [[YZSTableViewSectionModel alloc] init];
    [_viewModel.sectionModelArray addObject:sectionModel];
    //0
    YZSTableViewCellModel *cellModel = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel];
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        ZEPushChoiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:push];
        if (!cell) {
            cell = [[ZEPushChoiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:push];
                    }
        cell.title = @"客户名称 *";
        cell.placeholderText = @"请选择客户名称";
        cell.contentText = self.orderAppoint.customerName;
        cell.rightIcon = nil;
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        ZEIntentionViewController *controller = [[ZEIntentionViewController alloc]init];
        controller.title = @"未订单客户";
        controller.interfaceStr = @"GetCustomerList";
        controller.screenView.sortTypeArray = [NSMutableArray arrayWithArray:@[
                                                                               [[sortType alloc]initWithtype:@"按登记日期排序" num:customersSortRegistTime],
                                                                               [[sortType alloc]initWithtype:@"按客户名称排序" num:customersSortName],
                                                                               [[sortType alloc]initWithtype:@"按更新日期排序" num:customersSortRenewTime]
                                                                               ]];
        controller.selection = ^(IntentionEntityClass *customer){
            self.orderAppoint.customerName = customer.CustomerName;
            self.orderAppoint.CustomerID = customer.CustomerID;
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            [[HZURLNavigation currentNavigationViewController] popViewControllerAnimated:YES];
        };
        [HZURLNavigation.currentNavigationViewController pushViewController:controller animated:YES];
    };
    //1
    cellModel = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel];
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        ZEPushChoiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:push];
        if (!cell) {
            cell = [[ZEPushChoiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:push];
        }
        cell.title = @"品类 *";
        cell.placeholderText = @"请选择产品品类";
        cell.contentText = self.orderAppoint.flowName;
        cell.rightIcon = nil;
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        choiceAllViewController *controller = [[choiceAllViewController alloc]init];
        controller.titleName = @"品类";
        controller.block = ^(NSNumber *ID,NSString *name){
            self.orderAppoint.FlowID = ID;
            self.orderAppoint.flowName = name;
            [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        };
        [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
    };
    //2
    cellModel = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel];
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        ZEInputTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:input];
        if (!cell) {
            cell = [[ZEInputTextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:input];
        }
        cell.title = @"订单编号 *";
        cell.placeholderText = @"请手动输入订单编号";
        cell.contentText = self.orderAppoint.OrderNo;
        cell.keyType = UIKeyboardTypeDefault;
        UITextField *textField = [cell getInputTextField];
        textField.delegate = self;
        textField.tag = 100;
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    };
    //3
    cellModel = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel];
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        ZEPushChoiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:push];
        if (!cell) {
            cell = [[ZEPushChoiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:push];
        }
        cell.title = @"接单日期 *";
        cell.placeholderText = @"点击选择接单日期";
        cell.rightIcon = @"icon_calender";
        cell.contentText = self.orderAppoint.OrderDate;
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        STPickerDate *pickerDate = [[STPickerDate alloc]init];
        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
        [pickerDate setDelegate:self];
        [pickerDate show];

    };
    //4
    cellModel = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel];
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        ZEPushChoiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:push];
        if (!cell) {
            cell = [[ZEPushChoiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:push];
        }
        cell.title = @"导购 *";
        cell.placeholderText = @"请选择导购";
        cell.contentText = self.orderAppoint.guiderName;
        cell.rightIcon = nil;
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        reviceManViewController *controller = [[UIStoryboard storyboardWithName:@"Add" bundle:nil] instantiateViewControllerWithIdentifier:@"reviceman"];
        controller.title = @"导购";
        controller.block = ^(NSNumber *ID,NSString *Name) {
            self.orderAppoint.GuiderID = ID;
            self.orderAppoint.guiderName = Name;
            [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        };
        [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
    };
    //5
    cellModel = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel];
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        ZEInputTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:input];
        if (!cell) {
            cell = [[ZEInputTextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:input];
        }
        cell.title = @"预约金";
        cell.placeholderText = @"请输入预约金金额";
        cell.keyType = UIKeyboardTypeNumberPad;
        UITextField *textField = [cell getInputTextField];
        textField.delegate = self;
        textField.tag = 200;
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    };
    //6
    cellModel = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel];
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        ZEPushChoiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:push];
        if (!cell) {
            cell = [[ZEPushChoiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:push];
        }
        cell.title = @"户型";
        cell.placeholderText = @"请选择户型";
        cell.contentText = self.orderAppoint.houseTypeName;
        cell.rightIcon = nil;
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        choiceAllViewController *controller = [[choiceAllViewController alloc]init];
        controller.titleName = @"户型";
        controller.block = ^(NSNumber *ID,NSString *name){
            self.orderAppoint.HouseTypeID = ID;
            self.orderAppoint.houseTypeName = name;
            [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        };
        [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
    };
    //7
    cellModel = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel];
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        ZEInputTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:input];
        if (!cell) {
            cell = [[ZEInputTextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:input];
        }
        cell.title = @"面积";
        cell.placeholderText = @"请输入房间面积";
        cell.keyType = UIKeyboardTypeNumberPad;
        UITextField *textField = [cell getInputTextField];
        textField.delegate = self;
        textField.tag = 300;
        cell.lab = @"㎡";
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    };
    //8
    cellModel = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel];
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        ZEPushChoiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:push];
        if (!cell) {
            cell = [[ZEPushChoiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:push];
        }
        cell.title = @"风格";
        cell.placeholderText = @"请选择楼盘风格属性";
        cell.contentText = self.orderAppoint.setyleName;
        cell.rightIcon = nil;
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        choiceAllViewController *controller = [[choiceAllViewController alloc]init];
        controller.titleName = @"风格";
        controller.block = ^(NSNumber *ID,NSString *name){
            self.orderAppoint.StyleID = ID;
            self.orderAppoint.setyleName = name;
            [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        };
        [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
    };
    //9
    cellModel = [[YZSTableViewCellModel alloc] init];
    [sectionModel.cellModelArray addObject:cellModel];
    cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        ZEPushChoiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:push];
        if (!cell) {
            cell = [[ZEPushChoiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:push];
        }
        cell.title = @"工厂活动";
        cell.placeholderText = @"请选择工厂活动";
        cell.contentText = self.orderAppoint.ActivityName;
        cell.rightIcon = nil;
        return cell;
    };
    cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        choiceAllViewController *controller = [[choiceAllViewController alloc]init];
        controller.titleName = @"工厂活动";
        controller.block = ^(NSNumber *ID,NSString *name){
            self.orderAppoint.ActivityID = ID;
            self.orderAppoint.ActivityName = name;
            [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        };
        [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
    };

}

#pragma mark - UITextfield 代理方法

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"text:%@ ---rang:%@ ----string:%@",textField.text,NSStringFromRange(range),string);
    if (textField.tag == 200 || textField.tag == 300) {
        NSCharacterSet *cs;
        cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
        NSString *filtered =
        [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""]; //按cs分离出数组,数组按@""分离出字符串
        BOOL basic = [string isEqualToString:filtered];
        if (basic) {
            NSMutableString *mutString = [NSMutableString stringWithString:textField.text];
            [mutString replaceCharactersInRange:range withString:string];
            NSLog(@"mutString:%@",mutString);
            if (textField.tag == 200){
                self.orderAppoint.OrderMoney = [NSNumber numberWithString:mutString];
            }else if (textField.tag == 300){
                self.orderAppoint.Area = [NSNumber numberWithString:mutString];
            }
        }
        return basic;
    }
    NSMutableString *mutString = [NSMutableString stringWithString:textField.text];
    [mutString replaceCharactersInRange:range withString:string];
    if (textField.tag == 100) {
        self.orderAppoint.OrderNo = mutString;
    }
    return YES;
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
    self.orderAppoint.OrderDate = dateStr;
    [self reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:3 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}

@end
