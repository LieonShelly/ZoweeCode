//
//  ZEFurnitureView.m
//  ZoweeSale
//
//  Created by lieon on 16/6/30.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEFurnitureView.h"
#import "ZEDoorHeader.h"
#import "ZEMeasureTool.h"
#import "ZETableImageRightCell.h"

@interface ZEFurnitureView ()<UITableViewDataSource,UITableViewDelegate,ZEDoorHeaderDelegate>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) ZEDoorHeader *headerView;

/**
 *  家具列表-- 门
 */
@property (nonatomic,strong) NSArray  * doorList;
/**
 *  家具列表-- 窗
 */
@property (nonatomic,strong) NSArray * windowList;

@end

@implementation ZEFurnitureView

- (NSArray *)doorList
{
    if (_doorList == nil) {
# warning 真实的数据从服务器获取,这只是测试的数据
        _doorList = [[ZEMeasureTool sharedZEMeasureTool]furnitureModelWithDoors];
    }
    return _doorList;
}

- (NSArray *)windowList
{
    if (_windowList == nil) {
        
# warning 真实的数据从服务器获取,这只是测试的数据
        _windowList = [[ZEMeasureTool sharedZEMeasureTool]furnitureModelWithWindows];
    }
    return _windowList;
}


- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
         [_tableView registerNib:[UINib nibWithNibName:@"ZETableImageRightCell" bundle:nil] forCellReuseIdentifier:@"imageRight"];
    }
    return _tableView;
}

- (ZEDoorHeader *)headerView
{
    if (_headerView == nil) {
        _headerView = [[ZEDoorHeader alloc]init];
        _headerView.delegate =self;
        
    }
    return _headerView;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    [self.tableView reloadData];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = hexColorString(@"f2f2f2");
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        [self addSubview:self.headerView];
        [self addSubview:self.tableView];
        self.headerView.sd_layout
        .topSpaceToView(self,0)
        .leftSpaceToView(self,0)
        .rightSpaceToView(self,0)
        .heightIs(44 * 2);
        
        self.tableView.sd_layout
        .topSpaceToView(self.headerView,0)
        .leftSpaceToView(self,0)
        .rightSpaceToView(self,0)
        .bottomSpaceToView(self,0);
    }
    return self;
}

- (void)setModels:(NSArray *)models
{
    _models = models;
    [self.tableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.models.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZETableImageRightCell * cell = [ZETableImageRightCell cellWithTableView:tableView];
    cell.furniture = self.models[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZEFurnitureModel * furniture = self.models[indexPath.row];
    if ([self.delegate respondsToSelector:@selector(furnitureView:DidSelcetedFurniture:)]) {
        [self.delegate furnitureView:self DidSelcetedFurniture:furniture];
    }
}

- (void)doorHeader:(ZEDoorHeader *)doorHeader didClckChangeBtn:(ZEModelType)type
{
    
    
    switch (type) {
            
        case ZEModelTypeDoor:
            self.models = self.doorList;
            
            break;
        case ZEModelTypeWindow:
            self.models = self.windowList;
            break;
        default:
            break;
    }
}


@end
