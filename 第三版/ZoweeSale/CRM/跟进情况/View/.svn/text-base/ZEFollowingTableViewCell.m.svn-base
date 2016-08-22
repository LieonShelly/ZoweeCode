//
//  ZEFollowingTableViewCell.m
//  ZoweeSale
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEFollowingTableViewCell.h"


@interface ZEFollowingTableViewCell()

// leftVie相关的UI

@property (weak, nonatomic) IBOutlet UIView *leftView;

@property (weak, nonatomic) IBOutlet UIImageView *TypeIDImageView;

@property (weak, nonatomic) IBOutlet UIView *upLine;

@property (weak, nonatomic) IBOutlet UIView *downLine;

// rightView相关的UI

@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UILabel *executorNameLebel;
@property (weak, nonatomic) IBOutlet UIButton *star1;
@property (weak, nonatomic) IBOutlet UILabel *remarkLabel;
@property (weak, nonatomic) IBOutlet UILabel *followDateLabel;


@end
@implementation ZEFollowingTableViewCell


#pragma  mark - 私有方法

-(void)awakeFromNib
{
    // 设置背景颜色
    self.backgroundColor = [UIColor colorWithHexString:@"f5f2f3"];
    self.leftView.backgroundColor = [UIColor colorWithHexString:@"f5f2f3"];
    self.star1.backgroundColor = hexColorString(@"7ecef4");
}

#pragma mark - 公共接口
- (void)setFollowingStatus:(followingStatus *)followingStatus
{
    _followingStatus = followingStatus;
    // 设置左边控件的内容
//    self.leftView.leftFollowingStatus = followingStatus;
    /** 跟进类型  -123 接待 -124 上门 -125 电话 -126 短信*/
    NSString * typeID = [NSString stringWithFormat:@"%ld",(long)followingStatus.TypeID];
    if([typeID isEqualToString:@"-123"])
    {
        self.TypeIDImageView.image = [UIImage imageNamed:@"icon_service"];
    }else  if([typeID isEqualToString:@"-124"])
    {
        self.TypeIDImageView.image = [UIImage imageNamed:@"icon_entertain"];
    }else  if([typeID isEqualToString:@"-125"])
    {
        self.TypeIDImageView.image = [UIImage imageNamed:@"ICON_iPhone"];
    }else if([typeID isEqualToString:@"-126"]){
        self.TypeIDImageView.image = [UIImage imageNamed:@"ICON_message"];
    }
    else{
        self.TypeIDImageView.image = nil;
    }
    // 设置右边的view的控件的内容
    self.executorNameLebel.text = followingStatus.ExecutorName;
    self.remarkLabel.text = followingStatus.Remark;
    self.followDateLabel.text = followingStatus.FollowDate;
    // 判断星级
    /**
     *  反感 冷淡 观望中 热情 其他
     */
    
    if([followingStatus.Level isEqualToString:@"1"]){
        [self.star1 setTitle:@"反感" forState:UIControlStateNormal];
        
    }else if([followingStatus.Level isEqualToString:@"2"]) {
        [self.star1 setTitle:@"冷淡" forState:UIControlStateNormal];
   
    }else if([followingStatus.Level isEqualToString:@"3"]) {
        [self.star1 setTitle:@"观望中" forState:UIControlStateNormal];
  
    }else if([followingStatus.Level isEqualToString:@"4"]) {
        [self.star1 setTitle:@"热情" forState:UIControlStateNormal];
   
    }else if([followingStatus.Level isEqualToString:@"5"]) {
        [self.star1 setTitle:@"其他" forState:UIControlStateNormal];
  
    }else{
      [self.star1 setTitle:@"" forState:UIControlStateNormal];
  
    }

    
    
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
    _onlyOneRow = onlyOneRow;
    self.downLine.hidden  = onlyOneRow;
    self.upLine.hidden = onlyOneRow;
}

@end
