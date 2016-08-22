//
//  ZEToolTabeleView.m
//  ZoweeSale
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEToolTabeleView.h" 
#import "ZETableImageRightCell.h"
#import "ZETableViewImgaeLeftCell.h"

@interface ZEToolTabeleView() <UITableViewDelegate,UITableViewDataSource>


@end

@implementation ZEToolTabeleView

- (instancetype)init
{
    if ([super init]) {
        
        self.delegate = self;
        self.dataSource = self;
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        UIView * sectionFooter = [UIView new];
        sectionFooter.backgroundColor = [UIColor redColor];
        sectionFooter.frame = CGRectMake(0, 0, self.width, 44);
        
        self.tableHeaderView = sectionFooter;
        [self registerNib:[UINib nibWithNibName:@"ZETableImageRightCell" bundle:nil] forCellReuseIdentifier:@"imageRight"];
        [self registerNib:[UINib nibWithNibName:@"ZETableViewImgaeLeftCell" bundle:nil]  forCellReuseIdentifier:@"imageLeft"];
    }
    return self;
}

// 外部只需要赋值这个items，则马上刷新表格
- (void)setItems:(NSArray *)items
{

    _items = items;

    [self reloadData];
}

#pragma mark -- 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return self.items.count;
    return 10;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    ZETableImageRightCell * cell = [ZETableImageRightCell cellWithTableView:tableView];
    return cell;

}


#pragma mark -- 代理方法

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.toolDelegate respondsToSelector:@selector(toolTabeleViewDidSelcetedIndexPath:)]) {
        [self.toolDelegate toolTabeleViewDidSelcetedIndexPath:indexPath];
    }
}

 - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}



@end
