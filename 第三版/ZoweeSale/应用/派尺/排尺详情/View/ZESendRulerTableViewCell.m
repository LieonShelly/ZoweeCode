//
//  ZESendRulerTableViewCell.m
//  ZoweeSale
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZESendRulerTableViewCell.h"

@interface ZESendRulerTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *desingerNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *customerLabel;
@property (weak, nonatomic) IBOutlet UIImageView *completedIcon;
@property (nonatomic,strong) NSDictionary * stateDict;

@property (nonatomic,strong) UILabel * stateLabel;

@end

@implementation ZESendRulerTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
//    self.desingerNameLabel.textColor = hexColorString(@"2e2e2e");
    self.addressLabel.textColor = hexColorString(@"999999");
    self.customerLabel.textColor = self.addressLabel.textColor ;
    
}

- (void)setTask:(ZESendRulerTask *)task
{
    _task = task;
    
 
    self.desingerNameLabel.text = task.DesignerName;
    self.addressLabel.text = task.Address;
    self.customerLabel.text = [NSString stringWithFormat:@"关联客户:%@",task.CustomerName];
    if (task.State == 2) { // 已完成
        self.stateLabel.hidden = YES;
        self.completedIcon.hidden = NO;
    }else
    {
        self.completedIcon.hidden = YES;
        self.stateLabel.hidden = NO;
        NSString* statekey = [NSString stringWithFormat:@"%ld",task.State];
        self.stateLabel.text = self.stateDict[statekey];
    }
}

//  State	Int	任务状态	0未开始，1进行中，2已完成，3已取消，4已过期

- (NSDictionary *)stateDict
{
    if (_stateDict == nil) {
        _stateDict = @{@"0":@"未开始",
                       @"1":@"进行中",
                       @"2":@"已完成",
                       @"3":@"已取消",
                       @"4":@"已过期"
                       };
        
    }
    return _stateDict;
}

- (UILabel *)stateLabel
{
    if (_stateLabel == nil) {
        _stateLabel = [[UILabel alloc]init];
        _stateLabel.textColor = hexColorString(@"999999");
        _stateLabel.font = [UIFont systemFontOfSize:14];
        _stateLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_stateLabel];
        _stateLabel.sd_layout
        .rightSpaceToView(self.contentView,20)
        .topSpaceToView(self.contentView,20)
        .widthIs(60)
        .heightIs(30);
      
    }
    return _stateLabel;
}
@end
