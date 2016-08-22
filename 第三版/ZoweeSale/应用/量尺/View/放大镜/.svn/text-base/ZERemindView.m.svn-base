//
//  ZERemindView.m
//  ZoweeSale
//
//  Created by lieon on 16/7/4.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZERemindView.h"
#import "ZERemindViewCollectionViewCell.h"
#import "APPIndexModel.h"
#import "ZEAPPModel.h"

@interface ZERemindView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic ,strong) UIButton * closeBtn;

@property (nonatomic ,strong) NSArray * groups;

@property (nonatomic ,strong) UICollectionView * collectionView;

@end
@implementation ZERemindView

#pragma mark - 初始化


- (instancetype)init
{
    if (self = [super init]) {
        [self addSubview:self.closeBtn];
        [self addSubview:self.collectionView];
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.9;
        self.closeBtn.sd_layout
        .rightSpaceToView(self,50)
        .topSpaceToView(self,20)
        .widthIs(self.closeBtn.width)
        .heightIs(self.closeBtn.height);
        
        self.collectionView.sd_layout
        .leftSpaceToView(self,100)
        .rightSpaceToView(self,100)
        .bottomSpaceToView(self,0)
        .topSpaceToView(self.closeBtn,0);
        
    }
    return self;
}


#pragma mark - UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.groups.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    ZEAPPModel * model = self.groups[section];
    
    return model.items.count ;
}


- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZERemindViewCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZERemindViewCollectionViewCell" forIndexPath:indexPath];
    ZEAPPModel * model = self.groups[indexPath.section];
    APPIndexModel * indexModel =model.items[indexPath.item];
    if (indexPath.section == self.groups.count - 1) {
        cell.isLastSection = YES;
    }else{
        cell.isLastSection = NO;
    }
    cell.appModel = indexModel;
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == self.groups.count - 1) {
        return CGSizeMake(125, 75);
    }
    return CGSizeMake(125, 125);
}
//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
    
}



//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}



//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}




- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(SCREEN_WIDTH, 50);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    ZEAPPModel * model = self.groups[indexPath.section];
    //创建/获取头尾视图的时候也要用复用队列
    //判断kind 来区分头尾
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        //头视图
        //(如果满足不了需要那么就定制)
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
        header.backgroundColor = [UIColor clearColor];
        UILabel * titleLabel = [[UILabel alloc]init];
        titleLabel.font = [UIFont systemFontOfSize:15];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.backgroundColor = [UIColor blackColor];
        titleLabel.size = header.size;
        titleLabel.left = 0;
        titleLabel.top = header.height - titleLabel.height;
        titleLabel.text = model.sectionHeaderTitle;
        [header addSubview:titleLabel];
        return header;
    }else {
        //尾视图
        //复用队列获取
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Footer" forIndexPath:indexPath];
        footer.backgroundColor = [UIColor yellowColor];
        return footer;
    }
}



#pragma mark - 懒加载

- (NSArray *)groups
{
    if(_groups == nil)
    {
        ZEAPPModel * model0 =nil;
        ZEAPPModel * model1 = nil;
        
        APPIndexModel * item00 = [[APPIndexModel alloc]initWithIconName:@"image_soom" Title:@"缩放"];
        model0 =[[ZEAPPModel alloc]initWithItems:@[item00] sectionHeaderTitle:@"浏览手势" sectionFooterTitle:@""];
        
        APPIndexModel * item10 = [[APPIndexModel alloc]initWithIconName:@"image_slide" Title:@"滑动标注“尺寸”"];
        
        APPIndexModel * item11 = [[APPIndexModel alloc]initWithIconName:@"image_click" Title:@"点击标注“文字”"];
        APPIndexModel * item12 = [[APPIndexModel alloc]initWithIconName:@"image_press" Title:@"按住“编辑修改”"];
        model1 = [[ZEAPPModel alloc]initWithItems:@[item10,item11,item12] sectionHeaderTitle:@"标注手势" sectionFooterTitle:@""];
        
        
        APPIndexModel * item21 = [[APPIndexModel alloc]initWithIconName:@"image_click" Title:@"连续标注"];
        APPIndexModel * item22 = [[APPIndexModel alloc]initWithIconName:@"image_press" Title:@"下次不提醒"];
       ZEAPPModel * model2 = [[ZEAPPModel alloc]initWithItems:@[item21,item22] sectionHeaderTitle:@"开关按钮" sectionFooterTitle:@""];
        _groups = @[model0,model1,model2];
        
        
    }
    return _groups;
}

- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(125, 125);
        _collectionView = [[UICollectionView alloc]initWithFrame:self.frame collectionViewLayout:layout];
        
        [_collectionView registerClass:[ZERemindViewCollectionViewCell class] forCellWithReuseIdentifier:@"ZERemindViewCollectionViewCell"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer"];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.scrollEnabled = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    
    return _collectionView;
}
- (UIButton *)closeBtn
{
    if (_closeBtn == nil) {
        _closeBtn = [[UIButton alloc]init];
        [_closeBtn setTitle:@"关闭" forState: UIControlStateNormal];
        [_closeBtn sizeToFit];
        [_closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeBtn;
}


#pragma mark - Events

- (void)closeBtnClick
{
    if ([self.delegate respondsToSelector:@selector(remindViewDidClickCloseBtn)]) {
        [self.delegate remindViewDidClickCloseBtn];
    }
}
@end
