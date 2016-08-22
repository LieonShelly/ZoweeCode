//
//  ZEFollowingRightView.m
//  ZoweeSale
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEFollowingRightView.h"
#import "UIColor+system.h"

@interface ZEFollowingRightView()
@property (weak, nonatomic) IBOutlet UILabel *executorNameLebel;
@property (weak, nonatomic) IBOutlet UIButton *star1;
@property (weak, nonatomic) IBOutlet UIButton *star2;
@property (weak, nonatomic) IBOutlet UIButton *star3;

@property (weak, nonatomic) IBOutlet UIButton *star4;
@property (weak, nonatomic) IBOutlet UIButton *star5;
@property (weak, nonatomic) IBOutlet UILabel *remarkLabel;
@property (weak, nonatomic) IBOutlet UILabel *followDateLabel;

@end

@implementation ZEFollowingRightView

+ (instancetype)rightView
{
   return [[[NSBundle mainBundle] loadNibNamed:@"ZEFollowingRightView" owner:nil options:nil]lastObject];
}


// init方法优先于awake方法,
- (void)awakeFromNib
{
    self.backgroundColor = [UIColor colorWithHexString:@"fcfcfc"];
    self.executorNameLebel.textColor = [UIColor colorWithHexString:@"2e2e2e"];
    self.remarkLabel.textColor = [UIColor colorWithHexString:@"666666"];
    self.followDateLabel.textColor = [UIColor colorWithHexString:@"666666"];
}

#pragma  mark - 公共接口

- (void)setRightStatus:(followingStatus *)rightStatus
{
    _rightStatus = rightStatus ;
    self.executorNameLebel.text = rightStatus.ExecutorName;
    self.remarkLabel.text = rightStatus.Remark;
    self.followDateLabel.text = rightStatus.FollowDate;
    // 判断星级
    if([rightStatus.Level isEqualToString:@"1"]){
        self.star1.selected = YES;
        self.star2.selected = NO;
        self.star3.selected = NO;
        self.star4.selected = NO;
        self.star5.selected = NO;
        
    }else if([rightStatus.Level isEqualToString:@"2"]) {
        self.star1.selected = YES;
        self.star2.selected = YES;
        
        self.star3.selected = NO;
        self.star4.selected = NO;
        self.star5.selected = NO;
    }else if([rightStatus.Level isEqualToString:@"3"]) {
        self.star1.selected = YES;
        self.star2.selected = YES;
        self.star3.selected = YES;
        self.star4.selected = NO;
        self.star5.selected = NO;
    }else if([rightStatus.Level isEqualToString:@"4"]) {
        self.star1.selected = YES;
        self.star2.selected = YES;
        self.star3.selected = YES;
        self.star4.selected = YES;
        self.star5.selected = NO;
    }else if([rightStatus.Level isEqualToString:@"5"]) {
        self.star1.selected = YES;
        self.star2.selected = YES;
        self.star3.selected = YES;
        self.star4.selected = YES;
        self.star5.selected = YES;
    }else{
        self.star1.selected = NO;
        self.star2.selected = NO;
        self.star3.selected = NO;
        self.star4.selected = NO;
        self.star5.selected = NO;
    }
    
}
@end
