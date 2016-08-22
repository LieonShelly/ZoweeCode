//
//  pickMissionCollectionView.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "pickMissionCollectionView.h"
#import "HZURLNavigation.h"
#import "ZEHomeDesigeViewController.h"

@interface pickMissionCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end


@implementation pickMissionCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.bounces = NO;
    self.delegate = self;
    self.dataSource = self;
    self.backgroundColor = [UIColor whiteColor];
    self.showsHorizontalScrollIndicator = NO;
    [self registerClass:[ZEDesigeMissionCell class] forCellWithReuseIdentifier:@"cell"];
}

#pragma mark =================delegate=============


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.Source.count;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZEDesigeMissionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.model = self.Source[indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Application" bundle:nil];
     ZEHomeDesigeViewController* Controller = [storyboard instantiateViewControllerWithIdentifier:@"newBulidHomeDesign"];
    ZEDesigeMission *mission = _Source[indexPath.row];
    Controller.mission = mission;
    [[HZURLNavigation currentNavigationViewController] pushViewController:Controller animated:YES];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 将collectionView在控制器view的中心点转化成collectionView上的坐标
    CGPoint pInView = [self.superview convertPoint:self.center toView:self];
    // 获取这一点的indexPath
    NSIndexPath *indexPathNow = [self indexPathForItemAtPoint:pInView];
    // 赋值给记录当前坐标的变量
    ZEDesigeMission *mission = self.Source[indexPathNow.row];
    if ([self.Pdelegate respondsToSelector:@selector(pickProject:)]) {
        [self.Pdelegate pickProject:mission];
    }
    // 更新底部的数据
}
- (void)setSource:(NSArray *)Source {
    _Source = Source;
    [self reloadData];
}

@end
