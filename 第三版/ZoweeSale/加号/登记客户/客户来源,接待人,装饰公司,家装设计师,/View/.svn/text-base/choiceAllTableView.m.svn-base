//
//  choiceAllTableView.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/20.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "choiceAllTableView.h"
#import "cALlTableViewCell.h"
#import "choiceAllViewController.h"
#import "HZURLNavigation.h"

@interface choiceAllTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation choiceAllTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    [self registerClass:[cALlTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.delegate = self;
    self.dataSource = self;
    self.tableFooterView = [UIView new];
    self.rowHeight = 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    cALlTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.model = _dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    choiceAllViewController *controller = (choiceAllViewController *)[HZURLNavigation currentViewController];
    choAllModel *model = _dataArray[indexPath.row];
    controller.block(model.ID,model.Name);
    [controller.navigationController popViewControllerAnimated:YES];
    controller = nil;
}

//- (UIViewController *)viewController {
//    for (UIView* next = [self superview]; next; next = next.superview) {
//        UIResponder *nextResponder = [next nextResponder];
//        if ([nextResponder isKindOfClass:[UIViewController class]]) {
//            return (UIViewController *)nextResponder;
//        }
//    }
//    return nil;
//}

@end
