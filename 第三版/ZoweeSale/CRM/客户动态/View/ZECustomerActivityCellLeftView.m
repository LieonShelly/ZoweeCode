//
//  ZECustomerActivityCellLeftView.m
//  ZoweeSale
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZECustomerActivityCellLeftView.h"
#import "ZECornerLabel.h"

@interface ZECustomerActivityCellLeftView ()

@property (weak, nonatomic) IBOutlet UIView *upLine;

@property (weak, nonatomic) IBOutlet UIView *downLine;
@property (weak, nonatomic) IBOutlet ZECornerLabel *StateLabel;

@end

@implementation ZECustomerActivityCellLeftView

+ (instancetype)leftView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZECustomerActivityCellLeftView" owner:nil options:nil]firstObject];
}


// init方法优先于awake方法,
- (void)awakeFromNib
{
    self.backgroundColor = [UIColor colorWithHexString:@"f5f2f3"];
    self.upLine.backgroundColor = [UIColor colorWithHexString:@"cdcccc"];
    self.downLine.backgroundColor = [UIColor colorWithHexString:@"cdcccc"];
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

- (void)setActivity:(ZECustomerActivity *)activity
{
    _activity = activity;
    self.StateLabel.backgroundColor = activity.State ? [UIColor colorWithHexString:@"ef8584"] : [UIColor colorWithHexString:@"aaecaa"];
}

- (void)setOnlyOneRow:(BOOL)onlyOneRow
{
    _onlyOneRow = onlyOneRow;
    self.downLine.hidden  = onlyOneRow;
    self.upLine.hidden = onlyOneRow;
}

@end
