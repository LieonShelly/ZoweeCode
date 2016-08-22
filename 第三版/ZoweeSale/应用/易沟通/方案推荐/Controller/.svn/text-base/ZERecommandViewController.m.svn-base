//
//  ZERecommandViewController.m
//  ZoweeSale
//
//  Created by lieon on 16/7/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZERecommandViewController.h"
#import "ZERecommandView.h"
#import "ZERemomandPopViewController.h"
#import "ZERecomandRequestParam.h"
#import "ZERecommandAnimator.h"
#import "ZERecommandModel.h"
#import "ZESectionHeaderView.h"
#import "MJRefresh.h"
#import "ZETagModel.h"
#import "topShowView.h"

@interface ZERecommandViewController ()<ZERecommandViewDelegate,ZERemomandPopViewControllerDelegate>

@property (nonatomic ,strong) ZERecommandView * recommandView;

@property (nonatomic ,strong) ZESectionHeaderView * headerView;
@property (nonatomic ,strong) ZERecommandAnimator * recommandAnimator;

@property (nonatomic ,strong) NSArray * dataArray;
@property (nonatomic ,strong) UIView * naviBar;
@property (nonatomic ,strong) ZERemomandPopViewController * rvc;

@property (nonatomic ,strong) topShowView *topView;
@property (nonatomic ,strong) ZERecomandRequestParam * param;

@end

@implementation ZERecommandViewController
{
    CGFloat _offsetY;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self addRefresh];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
 
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
     [self.recommandView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.recommandView removeObserver:self forKeyPath:@"contentOffset"];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        NSString *point =[NSString stringWithFormat:@"%@",change[NSKeyValueChangeNewKey]];
        CGFloat height = [self scrollHeightWith:point];
        NSLog(@"%f",height);
        
        if (height > _offsetY + 30) { // 向下
            [self.headerView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.naviBar.mas_bottom).offset(-44);
            }];
        }else if(height< _offsetY -30){ // 向上
            
            [self.headerView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.naviBar.mas_bottom).offset(0);
            }];
        }else if( height >= 0 && height < 30)
        {
            [self.headerView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.naviBar.mas_bottom).offset(0);
            }];
        }
        _offsetY = height;
        [UIView animateWithDuration:0.4 animations:^{
            [self.headerView layoutIfNeeded];
            [self.recommandView layoutIfNeeded];
        }];
    }
}


- (void)addRefresh
{
    // 为了适应刷新控件
    self.recommandView.contentOffset = CGPointMake(0, -10);
    self.recommandView.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    [self.recommandView.mj_header beginRefreshing];
}


- (CGFloat)scrollHeightWith:(NSString *)point{
    NSArray *array = [point componentsSeparatedByString:@","];
    NSString *heightStr = array.lastObject;
    heightStr = [heightStr stringByReplacingOccurrencesOfString:@"}" withString:@""];
    heightStr = [heightStr stringByReplacingOccurrencesOfString:@")" withString:@""];
    return [heightStr floatValue];
}

- (void)setupUI
{
    self.view.backgroundColor = hexColorString(@"f2f2f2");;
    [self.view addSubview:self.naviBar];
    [self.view insertSubview:self.headerView belowSubview:self.naviBar];
    [self.view  insertSubview:self.recommandView belowSubview:self.headerView];
    
    [self.naviBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(64);
        make.top.mas_equalTo(0);
    
    }];
    
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
        make.top.mas_equalTo(self.naviBar.mas_bottom).offset(0);
        
    }];
    [self.recommandView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.top.mas_equalTo(self.headerView.mas_bottom).offset(0);
        
    }];
    
    
}

- (void)loadData
{
    __weak typeof(self) weakSelf = self;
    NSLog(@"%@",self.param.mj_keyValues);
    THBaseRequestApi * api = [[THBaseRequestApi alloc]initWithAction:@"LoadRecommendedList" Requestparameter:self.param.mj_keyValues cacheTime:60];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        [self.recommandView.mj_header endRefreshing];
        weakSelf.recommandView.dataArray =  [ZERecommandModel mj_objectArrayWithKeyValuesArray:request.responseJSONObject];
        
    } failure:^(__kindof YTKBaseRequest *request) {
        
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
    }];
}

- (void)requestStyle
{
    self.rvc.name = @"风格";
    __weak typeof(self) weakSelf = self;
    [ZETagModel requestStyle:^(NSArray *models) {
        
        weakSelf.rvc.dataArray  = models;
        
    } failure:^(__kindof YTKBaseRequest *request) {
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
    }];
}
- (void)requestHourseType
{
    self.rvc.name = @"户型";
    __weak typeof(self) weakSelf = self;
    [ZETagModel requestHourseType:^(NSArray *models) {
        weakSelf.rvc.dataArray  = models;
    } failure:^(__kindof YTKBaseRequest *request) {
        
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
    }];
}

- (void)requestRoomType
{
    
    self.rvc.name = @"空间";
    __weak typeof(self) weakSelf = self;
    [ZETagModel requestRoomType:^(NSArray *models) {
        
        weakSelf.rvc.dataArray  = models;

    } failure:^(__kindof YTKBaseRequest *request) {
        
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
    }];
}

- (void)backBtnClick
{
    
    self.navigationController.navigationBar.hidden = NO;
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
#pragma mark - ZESectionHeaderViewDelegate

- (void)sectionHeaderView:(ZESectionHeaderView *)sectionHeaderView DidClickBtn:(ZESectionHeaderViewBtnType)type
{
    NSLog(@"%d",type);
    switch (type) {
        case ZESectionHeaderViewBtnTypeStyle:
            [self requestStyle];
            break;
        case ZESectionHeaderViewBtnTypeHouseType:
            [self requestHourseType];
            break;
            
        case ZESectionHeaderViewBtnTypeRoomType:
            [self requestRoomType];
            break;
        
        default:
            break;
    }
    
    
    self.rvc.modalPresentationStyle = UIModalPresentationCustom;
    self.rvc.transitioningDelegate = self.recommandAnimator;
    self.rvc.delegate = self;
    [self presentViewController:self.rvc animated:YES completion:nil];
}

#pragma mark - ZERecommandViewDelegate

- (void)recommandView:(ZERecommandView *)recommandView DidSlectedItem:(ZERecommandModel *)model
{
    _topView = nil;
    _topView = [[topShowView alloc]init];
    _topView.planID = model.PlanID;
    [_topView show];
    
}

#pragma mark - ZERemomandPopViewControllerDelegate

- (void)recommandPopViewControllerDidSlectedModel:(ZETagModel*)model
{
    
    /**
     *
     风格: -135
     户型: -139
     空间:-134
     */
    NSLog(@"recommandPopViewControllerDidSlectedModel:%@",model.GroupID);
    switch (model.type) {
        case ZETagModelTypeStyle:
            self.headerView.selectedStyleModel = model;
            break;
        case ZETagModelTypeHourseType:
            self.headerView.selectedHourseTypeModel = model;
            break;
            
        case ZETagModelTypeRoomType:
            self.headerView.selectedRoomTypeModel = model;
            break;
            
    }
    self.param.TagList = [NSString stringWithFormat:@"%@,%@,%@",self.headerView.selectedStyleModel.ID,self.headerView.selectedHourseTypeModel.ID,self.headerView.selectedRoomTypeModel.ID];
    NSLog(@"self.param.TagList-------%@",self.param.TagList);
    [self.recommandView.mj_header beginRefreshing];
}
#pragma mark - getter

- (ZERecommandView *)recommandView
{
    
    if (_recommandView == nil) {
        _recommandView = [[ZERecommandView alloc]init];
        _recommandView.backgroundColor = hexColorString(@"f2f2f2");
        _recommandView.recommandDelegate = self;
        
    }
    return _recommandView;
}

- (ZESectionHeaderView *)headerView
{
    if (_headerView == nil) {
        _headerView = [[ZESectionHeaderView alloc]init];
        _headerView.backgroundColor = [UIColor whiteColor];
        _headerView.delegate = self;
    }
    return _headerView;
}


- (ZERecommandAnimator *)recommandAnimator
{
    if (_recommandAnimator == nil) {
        _recommandAnimator = [[ZERecommandAnimator alloc]init];
        CGFloat height = SCREEN_HEIGHT - 100;
        CGFloat width = 200;
        _recommandAnimator.presentFrame = CGRectMake(SCREEN_WIDTH - width , SCREEN_HEIGHT  - height , width, height);
    }
    return _recommandAnimator;
}

- (UIView *)naviBar
{
    if (_naviBar == nil) {
        _naviBar = [[UIView alloc]init];
        _naviBar.backgroundColor = [UIColor whiteColor];
        UIButton * btn = [[UIButton alloc]init];
        [btn setImage:[UIImage imageNamed:@"backBtn"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [btn sizeToFit];
        [_naviBar addSubview:btn];
        btn.sd_layout
        .leftSpaceToView(_naviBar,30)
        .centerYEqualToView(_naviBar)
        .widthIs(btn.width)
        .heightIs(btn.height);
    }
    return _naviBar;
}

- (ZERemomandPopViewController *)rvc
{
    if (_rvc == nil) {
        _rvc = [[ZERemomandPopViewController alloc]init];
    }
    
    return _rvc;
}

- (ZERecomandRequestParam *)param
{
    if (_param == nil) {
        _param = [[ZERecomandRequestParam alloc]init];
    }
    return _param;
}
@end
