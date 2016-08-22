//
//  ZEDetaileTabView.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEDetaileTabView.h"
#import "ZERoomInfo.h"
#import "ZEDetailModelGroup.h"

@implementation ZEDetaileTabView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    self = [super initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.windowLevel = UIWindowLevelAlert;
    self.backgroundColor = [UIColor whiteColor];
    UIImageView *backImageView = [[UIImageView alloc]initWithImage:ImageWithName(@"bg_03")];
    [self addSubview:backImageView];
    backImageView.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    ZEDetaileTableViewController *controller = [[ZEDetaileTableViewController alloc]init];
    self.rootViewController = controller;
    self.controller = controller;
    
}

- (void)show{
    [self makeKeyAndVisible];
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }];
    // self.hidden = NO;
    
}

/**
 *  
 _dataSource = @[@{@"type":@"客户详情"},
 @{@"title":@"客户姓名",@"describe":@"米戈"},
 @{@"title":@"电话",@"describe":@"15198074148"},
 @{@"type":@""},
 @{@"type":@"房间详情"},
 @{@"title":@"地址",@"describe":@"四川省成都市武侯区武青南路33号武侯创业中心B栋"},
 @{@"title":@"天花高度",@"describe":@"2.6m"},
 @{@"title":@"客厅",@"describe":@"25m²"}];
 */

- (void)setDataSourceWithOrderInfo:(ZEOrderInfo *)orderInfo mission:(ZEDesigeMission *)mission
{
    
    ZEDetailModel * detail00 = [ZEDetailModel detailModelWithTitle:@"客户姓名" desc:mission.CustomerName];
    ZEDetailModel * detail01 = [ZEDetailModel detailModelWithTitle:@"电话" desc:mission.Mobile];
    ZEDetailModelGroup * group0 = [ZEDetailModelGroup detailModelGroupWithItems:@[detail00,detail01] headerTitle:@"客户详情"];
   
    
    ZEDetailModel * detail10 = [ZEDetailModel detailModelWithTitle:@"地址" desc:mission.Address];
    ZEDetailModel * detail11 = [ZEDetailModel detailModelWithTitle:@"电话" desc:mission.Mobile];
    ZERoomInfo * roomInfo = orderInfo.ORoomList.firstObject;
    ZEDetailModel * detail12 = [ZEDetailModel detailModelWithTitle:@"天花高度" desc:[NSString stringWithFormat:@"%@m",roomInfo.RPlatHeight]];
    ZEDetailModel * detail13 = [ZEDetailModel detailModelWithTitle:roomInfo.RoomTitle desc:[NSString stringWithFormat:@"%@㎡",roomInfo.RArea]];
    ZEDetailModelGroup * group1 = [ZEDetailModelGroup detailModelGroupWithItems:@[detail10,detail11,detail12,detail13] headerTitle:@"房间详情"];
    [self.controller reloadDataWithDataSource:@[group0,group1]];
    
    
}
- (void)hidden {
    [self resignKeyWindow];
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
         self.hidden = YES;
    }];

}

@end
