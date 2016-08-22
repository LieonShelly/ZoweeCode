//
//  ZECRMCUstomerTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZECRMCUstomerTableViewCell.h"
#import "NSDate+string.h"
#import "UILable+TH.h"
#import "UIButton+Extension.h"
#import "ZEcustomerMoreBtnView.h"
#import "HZURLNavigation.h"

#import "ZEFollowFinishTaskViewController.h"


#define kDeleteButtonWidth      60.0f
#define kTagButtonWidth         60.0f
#define kCriticalTranslationX   5
#define kShouldSlideX           -2

#define noticationName @"cellsipe"

@interface ZECRMCUstomerTableViewCell ()
@property (nonatomic, assign) BOOL isSlided;
@end

@implementation ZECRMCUstomerTableViewCell{
    UILabel *nameLab;
    //UILabel *phoneLab;
    UILabel *addressLab;
    UILabel *timeLab;
    UIImageView *collectImage;
    
    
    UIButton *_moreButton;
    UIButton *_follButton;
    
    UIPanGestureRecognizer *_pan;
    UITapGestureRecognizer *_tap;
    
    BOOL _shouldSlide;

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self UISetup];
        [self setupGestureRecognizer];
        [self notificationSet];
    }
    return self;
}

- (void)UISetup{
    //self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentView.backgroundColor = [UIColor whiteColor];
    UIView *contentView = self.contentView;
    nameLab = [UILabel new];
    [contentView addSubview:nameLab];
    nameLab.font = [UIFont systemFontOfSize:15];
    nameLab.sd_layout
    .topSpaceToView(contentView,10)
    .leftSpaceToView(contentView,20)
    .widthIs(100)
    .heightIs(nameLab.font.lineHeight);
    
    timeLab = [UILabel new];
    timeLab.textColor = [UIColor redColor];
    timeLab.textAlignment = NSTextAlignmentRight;
    timeLab.font = [UIFont systemFontOfSize:13];
    [contentView addSubview:timeLab];
    timeLab.sd_layout
    .centerYEqualToView(nameLab)
    .rightSpaceToView(contentView,20)
    .widthIs(100)
    .heightIs(timeLab.font.lineHeight);
    
    collectImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"客户收藏"]];
    [contentView addSubview:collectImage];
    collectImage.sd_layout
    .topEqualToView(contentView)
    .leftEqualToView(contentView)
    .widthIs(20)
    .heightIs(20);
    
    UIImageView *addressImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_adress_y"]];
    [contentView addSubview:addressImage];
    addressImage.sd_layout
    .leftSpaceToView(contentView,22)
    .topSpaceToView(nameLab,13)
    .widthIs(12)
    .heightIs(12);
    
    
    addressLab = [UILabel new];
    addressLab.font = [UIFont systemFontOfSize:13];
    addressLab.textColor = hexColorString(@"999999");
    [contentView addSubview:addressLab];
    addressLab.sd_layout
    .leftSpaceToView(addressImage,5)
    .topSpaceToView(nameLab,11)
    .rightSpaceToView(timeLab,10)
    .heightIs(addressLab.font.lineHeight);
    
    /**
     *  左划按钮显示
     */
   
    _moreButton = [UIButton new];
    _moreButton.backgroundColor = hexColorString(@"cccaca");
    [_moreButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_moreButton setTitle:@"更多" forState:UIControlStateNormal];
    
    _follButton = [UIButton new];
    _follButton.backgroundColor = hexColorString(@"63b7d6");
    [_follButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_follButton setTitle:@"跟进" forState:UIControlStateNormal];
    [self insertSubview:_moreButton belowSubview:self.contentView];
    [self insertSubview:_follButton belowSubview:self.contentView];
    [_moreButton addTarget:self action:@selector(moreBtnClick:)];
    [_follButton addTarget:self action:@selector(followBtnClick:)];
    _follButton.sd_layout
    .topEqualToView(self)
    .rightEqualToView(self)
    .bottomSpaceToView(self,1)
    .widthIs(kDeleteButtonWidth);
    
    _moreButton.sd_layout
    .topEqualToView(_follButton)
    .bottomEqualToView(_follButton)
    .rightSpaceToView(_follButton, 0)
    .widthIs(kTagButtonWidth);
}
- (void)setEnableSider:(BOOL)enableSider{
    _enableSider = enableSider;
    _pan.enabled = enableSider;
}

- (void)setCustomer:(IntentionEntityClass *)customer{
    _customer = customer;
    nameLab.text = customer.CustomerName;
    nameLab.sd_layout.widthIs([nameLab labelSizeWidth]);
    addressLab.text = customer.Address;
        switch (_sortType) {
            case customersSortFllowTime:
                [self floowtimeShow];
                break;
            case customersSortRegistTime:
                [self registTimeShow];
                break;
            case customersSortFllowNum:
                [self floowNumShow];
                break;
            case customersSortName:
                [self customerNameShow];
                break;
            case customersSortRenewTime:
                [self TimeShow];
                break;     
            case customersSortOrderTime:
                [self TimeShow];
                break;
            case customersSortAssignTime:
                [self TimeShow];
                break;
            case customersSortDeliveryTime:
                [self TimeShow];
                break;
            default:
                break;
        }
    timeLab.sd_layout
    .widthIs([timeLab labelSizeWidth]);
    if ([customer.IsAttention isEqual:@0]) {
        collectImage.hidden = YES;
    }else{
        collectImage.hidden = NO;
    }
}
/**
 *  跟进日期
 */
- (void)floowtimeShow{
    timeLab.hidden = NO;
    NSString *dyaNum = [NSDate dateArrivaltodaynumberString:_customer.AnyTime];
    if ([dyaNum isEqualToString:@"0"]) {
        timeLab.text = @"今日已跟进";
    }else{
        NSInteger num = [dyaNum integerValue];
        if (num>30) {
            timeLab.text = @"30天前跟进";
        }else{
            timeLab.text = [NSString stringWithFormat:@"%@天前已跟进",dyaNum];
        }
    }
}
/**
 *  客户登记日期
 */
- (void)registTimeShow{
    timeLab.hidden = NO;
    NSString *time = [_customer.AnyTime componentsSeparatedByString:@" "].firstObject;
    timeLab.text = time;
}
/**
 *  跟进次数
 */
- (void)floowNumShow{
    timeLab.hidden = NO;
    timeLab.text = [NSString stringWithFormat:@"跟进%@次",_customer.Records];
}
/**
 *  客户姓名排序
 */
- (void)customerNameShow{
    timeLab.hidden = YES;
}
/**
 *  订单日期/客户登记日期/签单日期/交货日期排序,相同显示效果
 */
- (void)TimeShow{
    [self registTimeShow];
}


- (void)notificationSet{
    //获取通知中心单例对象
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    //添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
    [center addObserver:self selector:@selector(notice:) name:noticationName object:nil];

}

- (void)sendNoticiation{
    //创建一个消息对象
    NSNotification * notice = [NSNotification notificationWithName:noticationName object:nil userInfo:@{@"id":self}];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];

}

- (void)notice:(id)sender{
    NSDictionary *dic = [sender valueForKey:@"userInfo"];
    if ([dic[@"id"] isEqual:self]) {
        
    }else{
        [self cellSlideAnimationWithX:0];
    }
}
/**
 *  左划手势
 */
- (void)setupGestureRecognizer
{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    _pan = pan;
    pan.delegate = self;
    pan.delaysTouchesBegan = YES;
    [self.contentView addGestureRecognizer:pan];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
    tap.delegate = self;
    tap.enabled = NO;
    [self.contentView addGestureRecognizer:tap];
    _tap = tap;
}

- (void)tapView:(UITapGestureRecognizer *)tap
{
    if (self.isSlided) {
        [self cellSlideAnimationWithX:0];
    }
}
- (void)panView:(UIPanGestureRecognizer *)pan
{
    CGPoint point = [pan translationInView:pan.view];
    
    if (self.contentView.left <= kShouldSlideX) {
        _shouldSlide = YES;
    }
    [self sendNoticiation];
    if (fabs(point.y) < 1.0) {
        if (_shouldSlide) {
            [self slideWithTranslation:point.x];
        } else if (fabs(point.x) >= 1.0) {
            [self slideWithTranslation:point.x];
        }
    }
    if (pan.state == UIGestureRecognizerStateEnded) {
        CGFloat x = 0;
        if (self.contentView.left < -kCriticalTranslationX && !self.isSlided) {
            x = -(kDeleteButtonWidth + kTagButtonWidth);
        }
        [self cellSlideAnimationWithX:x];
        _shouldSlide = NO;
    }
    [pan setTranslation:CGPointZero inView:pan.view];
}
- (void)cellSlideAnimationWithX:(CGFloat)x
{
    [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:2 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.contentView.left = x;
    } completion:^(BOOL finished) {
        self.isSlided = (x != 0);
    }];
}

- (void)slideWithTranslation:(CGFloat)value
{
    if (self.contentView.left < -(kDeleteButtonWidth + kTagButtonWidth) * 1.1 || self.contentView.left > 30) {
        value = 0;
    }
    self.contentView.left += value;
}

- (void)setIsSlided:(BOOL)isSlided
{
    _isSlided = isSlided;
    
    _tap.enabled = isSlided;
}
#pragma mark - gestureRecognizer delegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if (self.contentView.left <= kShouldSlideX && otherGestureRecognizer != _pan && otherGestureRecognizer != _tap) {
        return NO;
    }
    return YES;
}

- (void)moreBtnClick:(UIButton *)sender{
    ZEcustomerMoreBtnView *moreView = [[ZEcustomerMoreBtnView alloc]init];
    moreView.customer = _customer;
    [[HZURLNavigation currentViewController].view addSubview:moreView];
}

- (void)followBtnClick:(UIButton *)sender{
    ZEFollowFinishTaskViewController *controller = [[UIStoryboard storyboardWithName:@"CRM" bundle:nil]instantiateViewControllerWithIdentifier:@"followFinish"];
    customerDetail *detail = [[customerDetail alloc]init];
    detail.CustomerID = _customer.CustomerID;
    controller.detail = detail;
    [[HZURLNavigation currentNavigationViewController]pushViewController:controller animated:YES];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:noticationName object:self];
}

@end
