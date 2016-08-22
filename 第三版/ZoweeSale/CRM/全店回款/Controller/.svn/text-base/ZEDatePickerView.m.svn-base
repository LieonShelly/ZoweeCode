//
//  ZEPickDateViewController.m
//  ZoweeSale
//
//  Created by apple on 16/6/28.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEDatePickerView.h"
#import "ZEPickDateCell.h"
#define tbViewTag 100
@interface ZEDatePickerView ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _yearView;
    UITableView * _monthView;
    NSMutableArray * _yearArray;//存储用户选择的年份
    NSMutableArray * _monthArray;//存储用户选择的月份
}
@property(nonatomic,strong)NSArray * monthArr;//初始数组 年份数据
@property(nonatomic,strong)NSArray * yearArr;//初始数组 月份数据

@end

@implementation ZEDatePickerView

- (instancetype)init {
    if (self = [super init]) {
        [self setupUI];
        //self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (NSArray *)monthArr{
    if (!_monthArr) {
        _monthArr = @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@11,@12];
    }
    return _monthArr;
}

- (NSArray *)yearArr{
    if (!_yearArr) {
        _yearArr = @[@2016,@2017,@2018,@2019,@2020];
    }
    return _yearArr;
}

- (void)setupUI{
    self.frame = CGRectMake(0, 100, 110, 150);
    _yearArray = [NSMutableArray array];
    _monthArray = [NSMutableArray array];
    
    _yearView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 60, 150)];
    _yearView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _yearView.tag = tbViewTag;
    _yearView.delegate = self;
    _yearView.dataSource = self;
    [self addSubview:_yearView];
    [_yearView registerClass:[ZEPickDateCell class] forCellReuseIdentifier:[ZEPickDateCell CellIdentifier]];
    
    _monthView = [[UITableView alloc]initWithFrame:CGRectMake(60, 0, 50, 150)];
    _monthView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _monthView.tag = tbViewTag + 1;
    _monthView.delegate = self;
    _monthView.dataSource = self;
    [self addSubview:_monthView];
    [_monthView registerClass:[ZEPickDateCell class] forCellReuseIdentifier:[ZEPickDateCell CellIdentifier]];
}

#pragma UITableViewDelegate,UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == tbViewTag) {
        return self.yearArr.count;
    }else{
        return self.monthArr.count;
    }
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == tbViewTag) {
        ZEPickDateCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (cell == nil) {
            cell = [[ZEPickDateCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[ZEPickDateCell CellIdentifier]];
            cell.labText = self.yearArr[indexPath.row];
            
        }
        return cell;
    }else{
        ZEPickDateCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (cell == nil) {
            cell = [[ZEPickDateCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[ZEPickDateCell CellIdentifier]];
            cell.labText = self.monthArr[indexPath.row];
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    ZEPickDateCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (tableView.tag == tbViewTag) {
        [_yearArray removeAllObjects];
        [_yearArray addObject:cell.labText];
    }else if(tableView.tag == tbViewTag + 1){
        [_monthArray removeAllObjects];
        [_monthArray addObject:cell.labText];
    }
    if(_yearArray.count > 0 && _monthArray.count>0){
        NSLog(@"%ld,%ld",_yearArray.count,_monthArray.count);
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"paybackDateChange" object:self userInfo:@{@"month":_monthArray[0],@"year":_yearArray[0]}];
        self.alpha = 0;
    }    
}

@end
