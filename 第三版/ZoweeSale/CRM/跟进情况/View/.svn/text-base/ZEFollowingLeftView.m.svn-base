//
//  ZEFollowingLeftView.m
//  ZoweeSale
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEFollowingLeftView.h"
#import "UIColor+system.h"

@interface ZEFollowingLeftView()

@property (weak, nonatomic) IBOutlet UIImageView *TypeIDImageView;

@property (weak, nonatomic) IBOutlet UIView *upLine;

@property (weak, nonatomic) IBOutlet UIView *downLine;

@end

@implementation ZEFollowingLeftView

+ (instancetype)leftView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZEFollowingLeftView" owner:nil options:nil]firstObject];
}

// init方法优先于awake方法,
- (void)awakeFromNib
{
    self.backgroundColor = [UIColor colorWithHexString:@"f5f2f3"];
    self.upLine.backgroundColor = [UIColor colorWithHexString:@"cdcccc"];
    self.downLine.backgroundColor = [UIColor colorWithHexString:@"cdcccc"];
}

#pragma  mark - 公共接口
- (void)setLeftFollowingStatus:(followingStatus *)leftFollowingStatus
{
    /** 跟进类型  -123 接待 -124 上门 -125 电话 -126 短信*/
    _leftFollowingStatus = leftFollowingStatus;
    NSString * typeID = [NSString stringWithFormat:@"%ld",(long)leftFollowingStatus.TypeID];
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
