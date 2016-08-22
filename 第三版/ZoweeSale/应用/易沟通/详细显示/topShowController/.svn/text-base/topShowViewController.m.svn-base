//
//  topShowViewController.m
//  iPadMG
//
//  Created by wanglj on 15/11/18.
//  Copyright © 2015年 wanglj. All rights reserved.
//

#import "topShowViewController.h"
#import "topCollectionViewCell.h"
#import "topCollectionReusableView.h"
#import "HZPhotoBrowser.h"
#import "planDetail.h"
#import "UIViewController+showMsg.h"


#define leftviewWidth 320

#define collectWidth SCREEN_WIDTH - leftviewWidth

static     CGFloat proture = 100;
@interface topShowViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource,HZPhotoBrowserDelegate>
@property (nonatomic ,strong) UIView *leftView;

@property (nonatomic ,strong) UICollectionView *collectionView;

@property (nonatomic ,assign) CGRect leftFrame;

@property (nonatomic ,assign) CGRect collectionFrame;

@property (nonatomic ,strong) NSArray *imageArray;

@property (nonatomic ,assign) BOOL isShowproduct;

/**
 *  方案名称label
 */
@property (nonatomic ,strong) UILabel *titlelab;
/**
 *  标签label
 */
@property (nonatomic ,strong) TYAttributedLabel *systalLab;
/**
 *  户型说明图
 */
@property (nonatomic ,strong) UIButton *imageBtn;

//@property (nonatomic ,strong) UIButton *collBtn;

@property (nonatomic ,strong)planDetail *detail;

@end

@implementation topShowViewController
- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeRight;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (void)setPlanID:(NSNumber *)planID {
    _planID = planID;
    NSDictionary *dic = @{
                          @"PlanID":planID
                          };
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.label.text = @"正在加载...";
    hud.removeFromSuperViewOnHide = YES;
    THBaseRequestApi *loadPlan = [[THBaseRequestApi alloc] initWithAction:@"LoadPlanDetail" Requestparameter:dic cacheTime:oneMinute ModelClassName:@"planDetail"];
    [loadPlan startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        [hud hideAnimated:YES];
        self.detail = request.responseJSONObject;
        [self buildUI:request.responseJSONObject];
    } failure:^(__kindof YTKBaseRequest *request) {
        
    }];
}
- (void)buildUI:(planDetail *)detail {
    [self leftViewInit:detail];
    _imageArray = detail.PlanDetail;
    [_collectionView reloadData];
}

/**
 *  初始的约束是为动画做准备
 */
- (void)uiInit
{
    _imageArray = @[];
    self.view.backgroundColor = [UIColor clearColor];
    _leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,leftviewWidth, self.view.frame.size.height)];
    _leftFrame = _leftView.frame;
    [self.view addSubview:_leftView];
    _leftView.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(_leftView.frame.size.width, 0, collectWidth, self.view.frame.size.height) collectionViewLayout:flowLayout];
    [_collectionView registerClass:[topCollectionViewCell class] forCellWithReuseIdentifier:@"topcell"];
    [_collectionView registerClass:[topCollectionReusableView class] forSupplementaryViewOfKind:  UICollectionElementKindSectionFooter   withReuseIdentifier:@"footer"];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionFrame = _collectionView.frame;
    [self.view addSubview:_collectionView];
    
    UIButton *closeBtn = [[UIButton alloc]init];
    [closeBtn setImage:[UIImage imageNamed:@"goutong_close"] forState:UIControlStateNormal];
    [self.view addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_collectionView.mas_right);
        make.top.equalTo(_collectionView.mas_top).with.mas_offset(60);
        make.size.mas_equalTo(CGSizeMake(40, 25));
    }];
    [closeBtn addTarget:self action:@selector(CloseBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)leftViewInit:(planDetail *)detail
{
    /* 方案名 */
    _titlelab = [[UILabel alloc] init];
    _titlelab.text = detail.Title;
    _titlelab.textColor = [UIColor colorWithHexString:@"808080"];
    _titlelab.textAlignment = NSTextAlignmentCenter;
    _titlelab.font = [UIFont systemFontOfSize:20];
    [_leftView addSubview:_titlelab];
    [_titlelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftView.mas_left);
        make.right.equalTo(_leftView.mas_right);
        make.height.mas_equalTo(30);
        make.top.equalTo(_leftView.mas_top).mas_offset(50);
    }];
    /* 方案报价 */
    UILabel *planMonry = [[UILabel alloc]init];
    planMonry.text = @"方案报价:";
    planMonry.textColor = [UIColor colorWithHexString:@"808080"];
    [_leftView addSubview:planMonry];
    [planMonry mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftView.mas_left).mas_offset(80);
        make.top.equalTo(_titlelab.mas_bottom).mas_offset(50);
        make.height.mas_equalTo(17);
        make.width.mas_equalTo(85);
    }];
    UILabel *price = [[UILabel alloc]init];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@",detail.TotalPrice]];
    [str addAttributeFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:17] range:NSMakeRange(1, str.length-1)];
    [str addAttributeTextColor:[UIColor colorWithHexString:@"cc0000"]];
    price.attributedText = str;
    [_leftView addSubview:price];
    [price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(planMonry.mas_right);
        make.height.mas_equalTo(17);
        make.right.equalTo(_leftView.mas_right);
        make.top.equalTo(planMonry.mas_top);
    }];
    /* 风格标签 */
    _systalLab = [[TYAttributedLabel alloc]init];
    _systalLab.text = detail.TagTitle;
    _systalLab.textColor = [UIColor colorWithHexString:@"b3b3b3"];
    _systalLab.lineBreakMode = kCTLineBreakByTruncatingTail;
    //_systalLab.linesSpacing = 15;
    _systalLab.font = [UIFont systemFontOfSize:17];
    [_leftView addSubview:_systalLab];
    [_systalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftView.mas_left).mas_offset(60);
        make.top.equalTo(planMonry.mas_bottom).mas_offset(50);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo([_systalLab getHeightWithWidth:200]);
    }];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"户型线框图";
    [_leftView addSubview:label];
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftView.mas_left);
        make.right.equalTo(_leftView.mas_right);
        make.bottom.equalTo(_leftView.mas_bottom).with.mas_offset(-15);
        make.height.mas_equalTo(14);
    }];
    
    /* 户型图 */
    _imageBtn= [[UIButton alloc]init];
    [_leftView addSubview:_imageBtn];
    [_imageBtn addTarget:self action:@selector(imageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_imageBtn  sd_setImageWithURL:[NSURL URLWithString:detail.ExplainUrl] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"whiteplaceholder"]];
    [_imageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftView.mas_left);
        make.right.equalTo(_leftView.mas_right);
        make.bottom.equalTo(label.mas_top).mas_offset(-15);
        make.height.mas_equalTo(350);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self uiInit];
    //动画效果
    CGRect leftFrame = self.leftView.frame;
    CGRect collectionFrame = self.collectionView.frame;
    leftFrame.origin = CGPointMake(- leftFrame.size.width,0);
    collectionFrame.origin = CGPointMake(collectionFrame.origin.x + collectionFrame.size.width, 0);
    
    self.leftView.frame = leftFrame;
    self.collectionView.frame = collectionFrame;
    [UIView animateWithDuration:0.5 animations:^{
        self.leftView.frame = _leftFrame;
        self.collectionView.frame = _collectionFrame;
    } completion:^(BOOL finished) {
        
    }];
    _isShowproduct = NO;
    //手势滑动
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(PanGestureSlide:)];
    [self.view addGestureRecognizer:panGesture];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 手势方法

/**
 *  滑动手势方法
 *
 *  @param recognizer
 */
- (void)PanGestureSlide:(UIPanGestureRecognizer*)recognizer
{
    if (_isShowproduct) {
        return;
    }
    CGFloat slideProportion = [recognizer translationInView:self.view].x;
    if (recognizer.state == UIGestureRecognizerStateEnded) {//停止滑动后根据已滑动的距离来判断是向右滑出屏幕,还是向左回到原滑动位置.
        if (slideProportion > proture) {
            [self rightAnimate:slideProportion];
        } else if (slideProportion > 0)
        {
            [self leftAnimate:slideProportion];
        }
        
    }else if (slideProportion > 0) {//向右滑动
        [self transFrome:slideProportion];
    }else{//向左滑动超过原位置就回到原位置
        self.leftView.frame = _leftFrame;
        self.collectionView.frame = _collectionFrame;
    }

}
/**
 *  向左返回到原起始位置
 *
 *  @param propro 已经向右滑动的距离
 */
- (void)leftAnimate:(CGFloat)propro
{
    NSTimeInterval time = propro / proture * 0.5;
    [UIView animateWithDuration:time animations:^{
        self.leftView.frame = _leftFrame;
        self.collectionView.frame = _collectionFrame;
    } completion:^(BOOL finished) {
    }];
    
}
/**
 *  向右滑出屏幕外
 *
 *  @param propro 已经向右滑动的距离
 */
- (void)rightAnimate:(CGFloat)propro
{
    CGRect leftFrame = _leftFrame;
    CGRect collectionFrame = _collectionFrame;
    leftFrame.origin = CGPointMake(- leftFrame.size.width,0);
    collectionFrame.origin = CGPointMake(collectionFrame.origin.x + collectionFrame.size.width, 0);
    CGFloat pro = 1 - propro/(_collectionFrame.size.width);
    NSTimeInterval time = pro * 0.5;
    [UIView animateWithDuration:time animations:^{
        self.leftView.frame = leftFrame;
        self.collectionView.frame = collectionFrame;
        if ([self.delegate respondsToSelector:@selector(slideproro:)]) {
            [self.delegate slideproro:0];
        }
    } completion:^(BOOL finished) {
        if ([self.delegate respondsToSelector:@selector(finishAnimate)]) {
            [self.delegate finishAnimate];
        }
    }];
}
/**
 *  滑动中改变frame
 *
 *  @param propro 滑动距离
 */
- (void)transFrome:(CGFloat)propro
{
    CGRect leftFrame = _leftFrame;
    CGRect collectionFrame = _collectionFrame;
    leftFrame.origin.x = leftFrame.origin.x - propro;
    collectionFrame.origin.x = collectionFrame.origin.x + propro;
    
    CGFloat pro = 1 - propro/(_collectionFrame.size.width);
    if ([self.delegate respondsToSelector:@selector(slideproro:)]) {
        [self.delegate slideproro:pro];
    }
    
    self.leftView.frame = leftFrame;
    self.collectionView.frame = collectionFrame;
    
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.imageArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellidentifier;
    cellidentifier = @"topcell";
    topCollectionViewCell *collectCell = [collectionView dequeueReusableCellWithReuseIdentifier:cellidentifier forIndexPath:indexPath];
     plan* plan = _imageArray[indexPath.section];
    [collectCell.imageview sd_setImageWithURL:[NSURL URLWithString:plan.DetailUrl]
                             placeholderImage:[UIImage imageNamed:@"goutong_placher"]];
    return collectCell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusable = nil;
    
    if (kind == UICollectionElementKindSectionFooter) {
        topCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
         plan* plan = _imageArray[indexPath.section];
        [view titleText:plan.Describe withNum:indexPath.section];
        reusable = view;
    }
    return reusable;
    
}
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    //启动图片浏览器
    HZPhotoBrowser *browserVc = [[HZPhotoBrowser alloc] init];
    topCollectionViewCell *collectCell = (topCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    browserVc.sourceImagesContainerView = collectCell.imageview.superview; // 原图的父控件
    browserVc.imageCount = self.imageArray.count; // 图片总数
    browserVc.currentImageIndex = indexPath.section;
    browserVc.delegate = self;
    [browserVc showWithController:self];
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"%@",NSStringFromCGRect(collectionView.frame));
    return CGSizeMake(collectionView.frame.size.width, 450);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
 
      return UIEdgeInsetsMake(0, 0, 0, 0);

}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    plan* plan = _imageArray[section];
    return CGSizeMake(collectionView.frame.size.width, [topCollectionReusableView heightWithText:plan.Describe]);
}
#pragma mark - photobrowser代理方法
- (UIImage *)photoBrowser:(HZPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    if (browser.sourceImagesContainerView == _imageBtn) {
        return _imageBtn.imageView.image;
    }
    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:index];
     topCollectionViewCell *collectCell = (topCollectionViewCell *)[_collectionView cellForItemAtIndexPath:path];
    return collectCell.imageview.image;
}

- (NSURL *)photoBrowser:(HZPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    if (browser.sourceImagesContainerView == _imageBtn) {
        return [NSURL URLWithString:_detail.ExplainUrl];
    }
    plan * plan = _imageArray[index];
    NSString *urlStr = plan.DetailUrl;
    return [NSURL URLWithString:urlStr];
}
#pragma mark 按钮点击

- (void)imageBtnClick:(UIButton *)btn {
    //启动图片浏览器
    HZPhotoBrowser *browserVc = [[HZPhotoBrowser alloc] init];
    browserVc.sourceImagesContainerView = btn;
    browserVc.imageCount = 1; // 图片总数
    browserVc.currentImageIndex = 0;
    browserVc.delegate = self;
    [browserVc showWithController:self];
}

- (void)CloseBtnClick{
    [self rightAnimate:0];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
