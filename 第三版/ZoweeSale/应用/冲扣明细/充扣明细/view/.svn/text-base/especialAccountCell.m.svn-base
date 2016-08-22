
//
//  especialAccountCell.m
//  ZoweeSale
//
//  Created by apple on 16/6/13.
//  Copyright © 2016年 TH. All rights reserved.
//
//  在iPhone6上的标准比例
#define widthRatio  (325 / 375.0)
// 根据屏幕的宽度适配item的宽度
#define itemWidth (widthRatio * SCREEN_WIDTH)
#import "especialAccountCell.h"
#import "ZEAccountLabel.h"
@interface especialAccountCell()
@property (weak, nonatomic) IBOutlet UIView *lineOne;
@property (weak, nonatomic) IBOutlet ZEAccountLabel *moneyLab;
@property (weak, nonatomic) IBOutlet ZEAccountLabel *stateLab;
@property (weak, nonatomic) IBOutlet UIView *lineTwo;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *moneyHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *stateHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineOneWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineOneHeight;


@end
@implementation especialAccountCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupUI{
    _lineOneWidth.constant = itemWidth;//适配屏幕宽度
    _lineOneHeight.constant = 0.5;//高度为1太粗不好看 更改为0.5
    self.backgroundColor = hexColorString(@"f5f2f2");
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _lineOne.backgroundColor = hexColorString(@"999999");
    _lineTwo.backgroundColor = _lineOne.backgroundColor;
}

- (void)setSingleDetail:(ZESingleDetail *)singleDetail{
    _singleDetail = singleDetail;
    
    //金额
    double amount = [_singleDetail.Amount doubleValue];
    NSString * moneyText;
    //判断金额是否为负数
    if(amount == 0 || amount > 0){
         moneyText = [NSString stringWithFormat:@"+%@",_singleDetail.Amount];
    }else{
        moneyText = [NSString stringWithFormat:@"%@",_singleDetail.Amount];
    }
    //富文本设置文字
    NSMutableAttributedString * textAttr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥ %@",moneyText]];
    [textAttr addAttributes:@{NSForegroundColorAttributeName:hexColorString(@"999999"),NSFontAttributeName:[UIFont systemFontOfSize:12]} range:NSMakeRange(0, 2)];
    [textAttr addAttributes:@{NSForegroundColorAttributeName:hexColorString(@"4c4c4c"),NSFontAttributeName:[UIFont systemFontOfSize:32]} range:NSMakeRange(2, moneyText.length)];
    _moneyLab.attributedText = textAttr;
    _moneyLab.textAlignment = NSTextAlignmentCenter;
    [_moneyLab setVerticalAlignment:VerticalAlignmentBottom];
    
    //充扣状态
    _stateLab.text = @"已充扣";
    _stateLab.textColor = hexColorString(@"999999");
    _stateLab.font = [UIFont systemFontOfSize:12];
    [_stateLab setVerticalAlignment:VerticalAlignmentTop];
    
    //算高度
    NSDictionary * attr1 = @{NSFontAttributeName:[UIFont systemFontOfSize:32]};
    CGSize size1 = [moneyText boundingRectWithSize:CGSizeMake(itemWidth, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin attributes:attr1 context:nil].size;
    
    NSDictionary * attr2 = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
    CGSize size2 = [_stateLab.text boundingRectWithSize:CGSizeMake(itemWidth, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin attributes:attr2 context:nil].size;
    
    //空隙
    CGFloat height = ((CGFloat)82 - size1.height - size2.height - 10) / 2.0f;
    
    _moneyHeight.constant = height + size1.height;
    _stateHeight.constant = height + size2.height;
}
@end