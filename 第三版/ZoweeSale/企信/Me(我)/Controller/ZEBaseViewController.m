//
//  ZEBaseViewController.m
//  ZoweeSale
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEBaseViewController.h"
#import "ZEItem.h"
#import "ZEBaseTableViewCell.h"

@interface ZEBaseViewController ()

@end

@implementation ZEBaseViewController

-(NSMutableArray *)data
{
    if(_data == nil)
    {
        _data = [NSMutableArray array];
    }
    
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView .backgroundColor = ZECustomerGlobalBackgroudColor;
    self.tableView.scrollEnabled = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - 初始化方法


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ZESetGroup * group = self.data[section];
    return group.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZEBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"set"];
    if(cell == nil)
    {
        cell = [[ZEBaseTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"set"];
    }
    
    ZESetGroup * g = self.data[indexPath.section];
    ZEItem * item = g.items[indexPath.row];
    cell.item = item;
    
    if(indexPath.row == g.items.count-1)
    {
        cell.hiddeDivider = YES;
        
    }
    
    return cell;
}


#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZESetGroup * g = self.data[indexPath.section];
    ZEItem * item = g.items[indexPath.row];
    //   执行对应的block
    if(item.option != nil)
    {
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
        item.option();
       
    }else if([item isKindOfClass:[ZEArrowItem class]] ||  [item isKindOfClass:[ZENoSubtitleItem class]])
    {
        //        创建目标控制器并添加到栈中
        ZEArrowItem *arrowItem = (ZEArrowItem*)item;
        
        if(arrowItem.destVC)
        {
            UIViewController * vc = [[arrowItem.destVC alloc]init];
            //        设置导航条的标题
            vc.title = arrowItem.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [UIView new];
    view.backgroundColor= [UIColor clearColor];
    view.frame = CGRectMake(0, 0, self.view.width, 15);
    return view;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
