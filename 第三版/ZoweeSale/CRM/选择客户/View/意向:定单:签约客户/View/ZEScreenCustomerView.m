//
//  ZEScreenCustomerView.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEScreenCustomerView.h"
#import "UIButton+Extension.h"
#import "searchViewController.h"
#import "HZURLNavigation.h"


@implementation sortType

- (instancetype)initWithtype:(NSString *)typeName num:(customersSort)typeNum{
    self = [super init];
    if (self) {
        self.typeName = typeName;
        self.typeNum = typeNum;
    }
    return self;
}

@end

@interface ZEScreenCustomerView ()

@property (nonatomic) UIView *backView;
/**
 *  默认排序方向
 */
@property (nonatomic) sortDirectionType sort;
/**
 *  第一个排序类型按钮
 */
@property (nonatomic) UIButton *oneBtn;
/**
 *  排序方向按钮
 */
@property (nonatomic) UIButton *rankBtn;

@end

@implementation ZEScreenCustomerView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       // [self uiInit];
    }
    return self;
}

- (void)setItemHeight:(CGFloat)itemHeight{
    _itemHeight = itemHeight;
    [self uiInit];
}

- (NSArray *)sortTypeArray{
    if (!_sortTypeArray) {
        _sortTypeArray = [NSMutableArray arrayWithArray:@[
                           [[sortType alloc]initWithtype:@"按跟进日期排序" num:customersSortFllowTime],
                           [[sortType alloc]initWithtype:@"按登记日期排序" num:customersSortRegistTime],
                           [[sortType alloc]initWithtype:@"按跟进次数排序" num:customersSortFllowNum],
                           [[sortType alloc]initWithtype:@"按客户名称排序" num:customersSortName]
                           ]];
    }
    return _sortTypeArray;
}
-(sortDirectionType )sort{
    if (!_sort) {
        _sort = sortDirectionTypeUP;
    }
    return _sort;
}
- (void)uiInit{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    UIButton *btn = [[UIButton alloc]init];
    [self addSubview:btn];
    [btn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    btn.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    self.clipsToBounds = YES;
    [self sortshow];
    UILabel *linebottom = [UILabel new];
    linebottom.backgroundColor = [hexColorString(@"999999") colorWithAlphaComponent:0.3];
    [self addSubview:linebottom];
    linebottom.sd_layout
    .bottomEqualToView(self)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(0.5);
}

- (void)sortshow{
    [_backView removeFromSuperview];
    _backView = [UIView new];
    _backView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_backView];
    _backView.sd_layout
    .topEqualToView(self)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(_itemHeight*[self.sortTypeArray count]);
    CGFloat fonts = 15*AdaptationRatioW;
    if (fonts>15) {
        fonts = 15;
    }
    UIView *topview = _backView;
    for (int i=0; i<self.sortTypeArray.count; i++) {
        sortType *type = _sortTypeArray[i];
        UIButton * btn = [UIButton new];
        btn.titleLabel.font = [UIFont systemFontOfSize:fonts];
        btn.tag = i;
        btn.titleColor = hexColorString(@"808080");
        btn.selectedTitleColor = [UIColor redColor];
        [btn addTarget:self action:@selector(sortBtnClick:)];
        btn.title = type.typeName;
        [_backView addSubview:btn];
        btn.sd_layout
        .topEqualToView(topview)
        .leftSpaceToView(_backView,20*AdaptationRatioW)
        .widthIs(SCREEN_WIDTH-35)
        .heightIs(_itemHeight);
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, SCREEN_WIDTH-35-105);
        if (i == 0) {
            btn.image = @"Button_Arrow_down";
            btn.selectedImage = @"Button_Arrow_up";
            btn.sd_layout.widthIs(140*AdaptationRatioW);
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, -8*AdaptationRatioW, 0, 25*AdaptationRatioW);
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, 115*AdaptationRatioW, 0, -98*AdaptationRatioW);
            _oneBtn = btn;
        }
        topview = btn;
        if (i!=3) {
            UILabel *line = [UILabel new];
            line.backgroundColor = [hexColorString(@"dbdbdb") colorWithAlphaComponent:0.5];
            [_backView addSubview:line];
            line.sd_layout
            .topSpaceToView(topview,0)
            .leftSpaceToView(_backView,30)
            .rightEqualToView(_backView)
            .heightIs(0.5);
            topview = line;
        }
    }
    UILabel *line = [UILabel new];
    line.backgroundColor = [hexColorString(@"dbdbdb") colorWithAlphaComponent:0.5];
    [self addSubview:line];
    line.sd_layout
    .centerXEqualToView(self)
    .centerYEqualToView(_oneBtn)
    .heightIs(_itemHeight-10)
    .widthIs(0.5);
    
    UIButton *rankBtn = [UIButton new];
    _rankBtn = rankBtn;
    rankBtn.image = @"rank_rise";
    rankBtn.selectedImage = @"rank_fall";
    [rankBtn addTarget:self action:@selector(rankBtnClick:)];
    [self addSubview:rankBtn];
    rankBtn.sd_layout
    .centerYEqualToView(_oneBtn)
    .leftSpaceToView(_oneBtn,5)
    .heightIs(_itemHeight)
    .rightSpaceToView(line,0);
    
    UIButton *searchBtn = [UIButton new];
    searchBtn.title = @"搜索客户";
    searchBtn.image = @"客户搜索";
    [searchBtn addTarget:self action:@selector(seachBtnClick)];
    searchBtn.titleColor = hexColorString(@"808080");
    searchBtn.titleLabel.font = [UIFont systemFontOfSize:fonts];
    searchBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 3);
    searchBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
    [self addSubview:searchBtn];
    _rightBtn = searchBtn;
    searchBtn.sd_layout
    .topEqualToView(self)
    .rightEqualToView(self)
    .leftSpaceToView(line,0)
    .heightIs(_itemHeight);
    
}
- (sortDirectionType)getFirstDirectionType{
    return self.sort;
}

- (customersSort)getFirstCustomerSortType{
    sortType *onetype = _sortTypeArray[0];
    return onetype.typeNum;
}


- (void)backBtnClick{
    [UIView animateWithDuration:0.4 animations:^{
        self.sd_layout
        .heightIs(_itemHeight);
        _oneBtn.selected = NO;
    } completion:^(BOOL finished) {
        _oneBtn.selected = NO;
    }];

}

- (void)sortBtnClick:(UIButton *)sender{
    if (sender.tag == 0) {
        if (sender.selected) {
            [UIView animateWithDuration:0.4 animations:^{
                self.sd_layout
                .heightIs(_itemHeight);
            }];
        }else{
            [UIView animateWithDuration:0.4 animations:^{
                self.sd_layout
                .heightIs(SCREEN_HEIGHT);
            }];
        }
        sender.selected = !sender.selected;
    }else{
        sortType *tagtype = _sortTypeArray[sender.tag];
        sortType *onetype = _sortTypeArray[0];
        [_sortTypeArray replaceObjectAtIndex:0 withObject:tagtype];
        [_sortTypeArray replaceObjectAtIndex:sender.tag withObject:onetype];
        onetype = _sortTypeArray[0];
        _oneBtn.title =onetype.typeName;
        tagtype = _sortTypeArray[sender.tag];
        sender.title = tagtype.typeName;
        [self backBtnClick];
        [self selectSortType:onetype.typeNum];
    }
    sortType *onetype = _sortTypeArray[0];
    if (onetype.typeNum == customersSortName) {
        _rankBtn.enabled = NO;
    }else{
        _rankBtn.enabled = YES;
    }
}

- (void)rankBtnClick:(UIButton *)sender{
    if (sender.selected) {
        self.sort = sortDirectionTypeUP;
    }else{
        self.sort = sortDirectionTypeDown;
    }
    [self backBtnClick];
    sender.selected = !sender.selected;
    sortType *type = _sortTypeArray[0];
    [self selectSortType:type.typeNum];
}
- (void)seachBtnClick{
    [self backBtnClick];
    searchViewController *searchController = [[searchViewController alloc]init];
    searchController.navcontroller = [HZURLNavigation currentNavigationViewController];
    [searchController.navcontroller presentViewController:searchController animated:YES completion:nil];
}
- (void) selectSortType:(customersSort )type
{
    if ([self.screenDelegate respondsToSelector:@selector(screenSortType:opposite:)]) {
        [self.screenDelegate screenSortType:type opposite:self.sort];
    }
}

@end
