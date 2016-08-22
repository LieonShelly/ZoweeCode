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
#import "ZEDoorEditOption.h"
#import "ZEChangeWallThicknessView.h"

@interface ZEToolTabeleView() <UITableViewDelegate,UITableViewDataSource,ZEChangeWallThicknessViewDelegate>


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
        self.backgroundColor = hexColorString(@"f0f0f0");
        [self registerNib:[UINib nibWithNibName:@"ZETableImageRightCell" bundle:nil] forCellReuseIdentifier:@"imageRight"];
        [self registerNib:[UINib nibWithNibName:@"ZETableViewImgaeLeftCell" bundle:nil]  forCellReuseIdentifier:@"imageLeft"];
//         [self registerNib:[UINib nibWithNibName:@"ZEChangeWallThicknessView" bundle:nil]  forCellReuseIdentifier:@"changeWallThickness"];
    }
    return self;

}

- (void)setToolTableModel:(ZEToolTableModel *)toolTableModel
{
    _toolTableModel = toolTableModel;
    if (toolTableModel.isDoorType) {
        self.scrollEnabled = self.toolTableModel.isDoorType;
    }else{
        self.scrollEnabled = NO;
    }
    [self reloadData];
    lieonLog(@"%ld",self.toolTableModel.items.count);
}


- (void)setToolHeader:(UIView *)toolHeader
{
    _toolHeader = toolHeader;
    self.tableHeaderView = toolHeader;
    
}


#pragma mark -- 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.toolTableModel.items.count;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.toolTableModel.isWallType){

        ZETableViewImgaeLeftCell * cell = [ZETableViewImgaeLeftCell cellWithTableView:tableView];
        cell.wallEdtitOption = self.toolTableModel.items[indexPath.row];
        return cell;
        
    }
   else if (self.toolTableModel.isDoorType) {
        // 存放家具模型
        ZETableImageRightCell * cell = [ZETableImageRightCell cellWithTableView:tableView];
       cell.furniture = self.toolTableModel.items[indexPath.row];
        return cell;
    }
 else if(self.toolTableModel.isSpecifyDoorType || self.toolTableModel.isSpecifyRoomType)
    { // 对某种类型的门进行编辑
        ZETableViewImgaeLeftCell * cell = [ZETableViewImgaeLeftCell cellWithTableView:tableView];
        cell.edtionOption = self.toolTableModel.items[indexPath.row];
        return cell;
    }else {
        return nil;
    }
    
}


#pragma mark -- 代理方法

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.toolTableModel.isDoorType == YES) { //
        ZEFurnitureModel * furniture = self.toolTableModel.items[indexPath.row];
        if ([self.toolDelegate respondsToSelector:@selector(toolTabeleView:DidSelcetedFurniture:)]) {
            [self.toolDelegate toolTabeleView:self DidSelcetedFurniture:furniture];
        }
    }else if(self.toolTableModel.isSpecifyDoorType || self.toolTableModel.isSpecifyRoomType)
    { // 点击了某道门,
        ZEDoorEditOption * option = self.toolTableModel.items[indexPath.row];
        option.function();
        
    }else if(self.toolTableModel.isWallType)
    {
        if (indexPath.row > 0) {
            ZEWallEditOption * option = self.toolTableModel.items[indexPath.row];
            if( option)
            {
                option.function();
            }
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.toolTableModel.isDoorType) {
        return 20;
    }else if(self.toolTableModel.isSpecifyDoorType){
        return 0;
    }else if(self.toolTableModel.isWallType)
    {
        return 0;
    }
    return 0;
}

 - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.toolTableModel.isDoorType) {
        return 64;
    }else{
        return 45;
    }
    
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * sectionFooter = [UIView new];
    sectionFooter.backgroundColor = [UIColor clearColor];
    return sectionFooter;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.toolTableModel.isDoorType) {
        UIView * sectionFooter = [UIView new];
        sectionFooter.backgroundColor = [UIColor clearColor];
        return sectionFooter;
    }else {
        
        return nil;
    }

}

@end
