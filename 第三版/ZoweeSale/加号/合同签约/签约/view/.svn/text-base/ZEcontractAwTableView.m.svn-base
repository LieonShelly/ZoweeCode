//
//  ZEcontractAwTableView.m
//  ZoweeSale
//
//  Created by wanglj on 16/6/2.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEcontractAwTableView.h"
#import "STPickerDate.h"
#import "ZEvoucherViewController.h"
#import "BRPlaceholderTextView.h"

#import "ZEcontractAwrdViewController.h"

@interface ZEcontractAwTableView ()<STPickerDateDelegate,ZEUploadPhotoViewDelegate, UITextFieldDelegate>
@property (nonatomic)BRPlaceholderTextView  *textView;


@property (nonatomic ,strong) ZEcontractAwrdViewController *contractAwrdVC;

@end

@implementation ZEcontractAwTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (ZEcontractModel *)model{
    if (!_model) {
        _model = [[ZEcontractModel alloc]init];
    }
    return _model;
}

- (void)setupAfter{
    [self registerClass:[ZEPushChoiceTableViewCell class] forCellReuseIdentifier:@"pushCell"];
    [self registerClass:[ZEInputTextTableViewCell class] forCellReuseIdentifier:@"inputCell"];
    [self show];
    UIView *view = [self tableViewFootView];
//    [self addSubview:view];
    view.top = 270;
    view.left = 0;
    view.width = SCREEN_WIDTH;
    view.height = 500;
    
    self.tableFooterView = view;
}


- (void)show{
    [self.viewModel.sectionModelArray removeAllObjects];
    
    YZSTableViewSectionModel *sectionModel1 = [[YZSTableViewSectionModel alloc] init];
    sectionModel1.footerHeight = 10;
    sectionModel1.headerHeight = 5;
    sectionModel1.headerView = [UIView new];
    [self.viewModel.sectionModelArray addObject:sectionModel1];

    YZSTableViewCellModel *cellModel11 = [[YZSTableViewCellModel alloc] init];
    [sectionModel1.cellModelArray addObject:cellModel11];
    
    cellModel11.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        ZEInputTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"inputCell"];
        if (!cell) {
            cell = [[ZEInputTextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:@"inputCell"];
        }
        cell.title = @"签约金额 *";
        cell.contentText = self.model.SignAmount;
        cell.placeholderText = @"请输入金额";
        cell.keyType = UIKeyboardTypeNumberPad;
        UITextField *textField = [cell getInputTextField];
        textField.delegate = self;
        textField.tag = 100;
        return cell;
    };
    cellModel11.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
//    YZSTableViewCellModel *cellModel12 = [[YZSTableViewCellModel alloc] init];
//    [sectionModel1.cellModelArray addObject:cellModel12];
//    
//    cellModel12.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
//        ZEPushChoiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pushCell"];
//        if (!cell) {
//            cell = [[ZEPushChoiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                                    reuseIdentifier:@"pushCell"];
//        }
//        cell.title = @"凭证类型";
//        cell.rightIcon = @"凭证类型";
//        cell.contentText = self.model.VoucherName;
//        cell.placeholderText = @"请选择凭证类型";
//        return cell;
//    };
//    cellModel12.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
//        [tableView deselectRowAtIndexPath:indexPath animated:YES];
//        ZEvoucherViewController *controller = [[ZEvoucherViewController alloc]init];
//        controller.block = ^(ZEvoucher *voucher){
//            self.model.VoucherName = voucher.Title;
//            self.model.VoucherType = voucher.VoucherTypeID;
//            [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
//        };
//        [[HZURLNavigation currentNavigationViewController]pushViewController:controller animated:YES];
//    };
//    YZSTableViewCellModel *cellModel13 = [[YZSTableViewCellModel alloc] init];
//    [sectionModel1.cellModelArray addObject:cellModel13];
//    
//    cellModel13.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
//        ZEInputTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"inputCell"];
//        if (!cell) {
//            cell = [[ZEInputTextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                                   reuseIdentifier:@"inputCell"];
//        }
//        cell.title = @"凭证号";
//        cell.contentText = self.model.VoucherCode;
//        cell.placeholderText = @"请输入凭证号";
//        cell.keyType = UIKeyboardTypeNumberPad;
//        UITextField *textField = [cell getInputTextField];
//        textField.delegate = self;
//        textField.tag = 200;
//        return cell;
//    };
//    cellModel13.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
//        [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    };
    
    YZSTableViewSectionModel *sectionModel2 = [[YZSTableViewSectionModel alloc] init];
    [self.viewModel.sectionModelArray addObject:sectionModel2];
    
    YZSTableViewCellModel *cellModel21 = [[YZSTableViewCellModel alloc] init];
    [sectionModel2.cellModelArray addObject:cellModel21];
    cellModel21.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        ZEPushChoiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pushCell"];
        if (!cell) {
            cell = [[ZEPushChoiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                     reuseIdentifier:@"pushCell"];
        }
        cell.title = @"客户交货期 *";
        cell.rightIcon = @"icon_Clocklv";
        cell.contentText = self.model.iDelivery;
        cell.placeholderText = @"选择交货日期";
        return cell;
    };
    cellModel21.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        STPickerDate *pickerDate = [[STPickerDate alloc]init];
        pickerDate.tag = indexPath.row;
        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
        [pickerDate setDelegate:self];
        [pickerDate show];
    };

    YZSTableViewCellModel *cellModel22 = [[YZSTableViewCellModel alloc] init];
    [sectionModel2.cellModelArray addObject:cellModel22];
    cellModel22.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
        ZEPushChoiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pushCell"];
        if (!cell) {
            cell = [[ZEPushChoiceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:@"pushCell"];
        }
        cell.title = @"预计安装日期";
        cell.rightIcon = @"icon_Clocklv";
        cell.contentText = self.model.Installdate;
        cell.placeholderText = @"选择安装日期";
        return cell;
    };
    cellModel22.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        STPickerDate *pickerDate = [[STPickerDate alloc]init];
        pickerDate.tag = indexPath.row;
        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
        [pickerDate setDelegate:self];
        [pickerDate show];
    };

}

- (UIView *)tableViewFootView{
    UIView *view = [UIView new];
    UILabel *lab = [UILabel new];
    lab.text = @"备注";
    [view addSubview:lab];
    lab.sd_layout
    .topSpaceToView(view,15)
    .leftSpaceToView(view,15)
    .widthIs(34)
    .heightIs(17);
    BRPlaceholderTextView *textView = [[BRPlaceholderTextView alloc]init];
    textView.font = [UIFont systemFontOfSize:17];
    textView.placeholder = @"说点什么...";
    textView.sd_cornerRadius = @5;
    [view addSubview:textView];
   // [textView becomeFirstResponder];
    textView.sd_layout
    .topSpaceToView(lab,15)
    .leftSpaceToView(view,15)
    .rightSpaceToView(view,15)
    .heightIs(200);
    _textView = textView;
    
    //  添加上传附件功能
    UILabel * label = [[UILabel alloc]init];
    label.textColor = hexColorString(@"2e2e2e");
    label.font = [UIFont systemFontOfSize:14];
    label.text = @"上传附件";
    [view addSubview:label];
    label.sd_layout.topSpaceToView(_textView,20)
    .leftSpaceToView(view,20)
    .widthIs(65)
    .heightIs(30);
    
    
    UILabel * label1 = [[UILabel alloc]init];
    label1.textColor = hexColorString(@"fa5a5a");
    label1.font = [UIFont systemFontOfSize:14];
    label1.textAlignment = NSTextAlignmentLeft;
    label1.text = @"(*最多可上传2个文件)";
    [view addSubview:label1];
    label1.sd_layout.topSpaceToView(_textView,20)
    .leftSpaceToView(label,0)
    .widthIs(200)
    .heightIs(30);
    
    
    ZEUploadPhotoView* uploadView = [[ZEUploadPhotoView alloc]init];
    self.uploadView = uploadView;
    uploadView.backgroundColor = [UIColor clearColor];
    [view addSubview:uploadView];
    
    uploadView.sd_layout.leftSpaceToView(view,20)
    .rightSpaceToView(view,20)
    .topSpaceToView(label,10)
    .bottomEqualToView(view);
    [uploadView reloadData];

    return view;
}

- (NSString *)isErrorNoEmpty{
    if (!self.model.SignAmount.isNoEmpty) {
        return @"请输入签约金额";
    }
    if (!self.model.iDelivery.isNoEmpty) {
        return @"请选择交货日期";
    }
    return nil;
}

- (NSDictionary *)dicKeyValue{
    self.model.Remark = _textView.text;
    return [self.model dicKeyValue];
}


#pragma mark - 日期选择器代理

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
    if (pickerDate.tag == 0) {
        self.model.iDelivery = dateStr;
    }else if (pickerDate.tag == 1){
        self.model.Installdate = dateStr;
    }
    [self reloadData];
}

#pragma mark - UITextfield 代理方法

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"text:%@ ---rang:%@ ----string:%@",textField.text,NSStringFromRange(range),string);
    if (textField.tag == 100 || textField.tag == 200) {
        NSCharacterSet *cs;
        cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
        NSString *filtered =
        [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""]; //按cs分离出数组,数组按@""分离出字符串
        BOOL basic = [string isEqualToString:filtered];
        if (basic) {
            NSMutableString *mutString = [NSMutableString stringWithString:textField.text];
            [mutString replaceCharactersInRange:range withString:string];
            NSLog(@"mutString:%@",mutString);
            if (textField.tag == 100){
                self.model.SignAmount = mutString;
            }else if (textField.tag == 200){
                self.model.VoucherCode = mutString;
            }
        }
        return basic;
    }
    return YES;
}



@end

