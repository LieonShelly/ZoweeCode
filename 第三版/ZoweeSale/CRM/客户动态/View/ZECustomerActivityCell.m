//
//  ZECustomerActivityCell.m
//  ZoweeSale
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZECustomerActivityCell.h"
#import "ZECustomerActivityCellLeftView.h"
#import "ZECustomerActivityCellRightView.h"
#import "ZECornerLabel.h"

@interface ZECustomerActivityCell ()
//@property (nonatomic,weak) ZECustomerActivityCellLeftView * leftView;
//
//@property (nonatomic,weak) ZECustomerActivityCellRightView * rightView;

// 左边的view
@property (weak, nonatomic) IBOutlet UIView *leftView;

@property (weak, nonatomic) IBOutlet UIView *upLine;
@property (weak, nonatomic) IBOutlet UIView *downLine;
@property (weak, nonatomic) IBOutlet ZECornerLabel *StateLabelLeft;

// 右边的view
@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UILabel *StateLabelRight;
@property (weak, nonatomic) IBOutlet UILabel *FinishDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *FinishDateHourLabel;



@end
@implementation ZECustomerActivityCell

#pragma  mark - 私有方法


- (void)awakeFromNib
{
    // 设置背景颜色
    self.backgroundColor = [UIColor colorWithHexString:@"f5f2f3"];
    
    // 设置左边的view的属性
    self.rightView.backgroundColor = [UIColor colorWithHexString:@"fcfcfc"];
    self.StateLabelRight.textColor = [UIColor colorWithHexString:@"2e2e2e"];
    self.FinishDateLabel.textColor = [UIColor colorWithHexString:@"999999"];
    self.FinishDateHourLabel.textColor = [UIColor colorWithHexString:@"999999"];
   
    // 设置右边view的属性
    self.leftView.backgroundColor = [UIColor colorWithHexString:@"f5f2f3"];
    self.upLine.backgroundColor = [UIColor colorWithHexString:@"cdcccc"];
    self.downLine.backgroundColor = [UIColor colorWithHexString:@"cdcccc"];

}

#pragma mark - 公共接口

- (void)setActivity:(ZECustomerActivity *)activity
{
    _activity = activity;
    
    // 设置右边view的数据
    self.StateLabelRight.text = activity.TypeName;
    NSRange  daterange = NSMakeRange(0, 10);
    NSString * dateStr = [activity.FinishDate substringWithRange:daterange];
    self.FinishDateLabel.text =dateStr;
    self.FinishDateHourLabel.text = [activity.FinishDate substringFromIndex:daterange.length];
    
    // 设置左边的view的数据
    self.StateLabelLeft.backgroundColor = activity.State ? [UIColor colorWithHexString:@"ef8584"] : [UIColor colorWithHexString:@"aaecaa"];
    
}


-(void)setLastRow:(BOOL)lastRow
{
    _lastRow = lastRow;
    self.downLine.hidden = lastRow;
    
}

- (void)setFirstRow:(BOOL)firstRow
{
    _firstRow = firstRow;
    self.upLine.hidden = firstRow;
}


- (void)setOnlyOneRow:(BOOL)onlyOneRow
{
    _onlyOneRow = onlyOneRow;
    self.downLine.hidden  = onlyOneRow;
    self.upLine.hidden = onlyOneRow;
}
@end
