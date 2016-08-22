//
//  ZEYearTargetCell.m
//  ZoweeSale
//
//  Created by apple on 16/6/28.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEYearTargetCell.h"

@interface ZEYearTargetCell()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField * textFie;
@end

@implementation ZEYearTargetCell
{
    UILabel * _monthLab;
    
}
- (void)setup{
    [super setup];
    
    [self setupUI];
    
}

- (void)setupUI{
    self.backgroundColor = hexColorString(@"f5f2f2");
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _monthLab = [UILabel new];
    _monthLab.textColor = hexColorString(@"2e2e2e");
    _monthLab.font = [UIFont systemFontOfSize:14];
    [self addSubview:_monthLab];
    _monthLab.sd_layout
    .leftSpaceToView(self,10)
    .centerYEqualToView(self)
    .widthIs(50)
    .autoHeightRatio(0);
    
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, 35.5, SCREEN_WIDTH, 0.5)];
    [self addSubview:line];
    line.backgroundColor = hexColorString(@"c9c9c9");
    
    //金额显示及编辑
    _textFie = [[UITextField alloc]init];
    _textFie.delegate = self;
    _textFie.textAlignment = NSTextAlignmentRight;
    _textFie.textColor = hexColorString(@"2e2e2e");
    _textFie.font = [UIFont systemFontOfSize:14];
    _textFie.keyboardType = UIKeyboardTypeDecimalPad;
    //_text.clearsOnBeginEditing = YES;
    _textFie.enabled = YES;
    _textFie.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:_textFie];
    _textFie.sd_layout
    .rightSpaceToView(self,10)
    .centerYEqualToView(self)
    .widthIs(200)
    .heightIs(20);
}

- (void)setMonth:(int)month{
    _month = month;
    _monthLab.text = [NSString stringWithFormat:@"%d月",_month];
}

- (void)setAmount:(NSNumber *)amount{
    _amount = amount;
    NSString * cellAmount = [NSString stringWithFormat:@"%@",_amount];
    if ([cellAmount rangeOfString:@"."].length != 0) {
        _textFie.text = [NSString stringWithFormat:@"%.2f",[_amount doubleValue]];
    }else{
        //处理数字格式
        NSString *str = [cellAmount substringWithRange:NSMakeRange(cellAmount.length%3, cellAmount.length-cellAmount.length%3)];
        NSString *strs = [cellAmount substringWithRange:NSMakeRange(0, cellAmount.length%3)];
        for (int  i =0; i < str.length; i =i+3) {
            NSString *sss = [str substringWithRange:NSMakeRange(i, 3)];
            strs = [strs stringByAppendingString:[NSString stringWithFormat:@",%@",sss]];
        }
        if ([[strs substringWithRange:NSMakeRange(0, 1)] isEqualToString:@","]) {
            strs = [strs substringWithRange:NSMakeRange(1, strs.length-1)];
        }
        _textFie.text = strs;
    }
}

//- (void)textFieldDidEndEditing:(UITextField *)textField{
//    
//    self.sendData(textField.text);
//}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSString *amount = [textField.text stringByReplacingCharactersInRange:range withString:string];
    self.sendData(amount);
    return YES;
}

@end
