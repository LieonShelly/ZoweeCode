//
//  ZEDoorHeader.m
//  ZoweeSale
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEDoorHeader.h"

@interface ZEDoorHeader ()
@property (nonatomic,weak)  UIButton * selectedBtn;
@property (nonatomic,weak)  UIButton * doorbtn;

@end

@implementation ZEDoorHeader



- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        
        UIView * titleView = [[UIView alloc]init];
        titleView.backgroundColor = hexColorString(@"808080");
        [self addSubview:titleView];
        titleView.sd_layout
        .topSpaceToView(self,0)
        .leftSpaceToView(self,0)
        .rightSpaceToView(self,0)
        .heightIs(44);
        
        UIView * exchageView = [[UIView alloc]init];
        [self addSubview:exchageView];
        exchageView.sd_layout
        .topSpaceToView(titleView,0)
        .leftSpaceToView(self,0)
        .rightSpaceToView(self,0)
        .bottomSpaceToView(self,0);
        
        UILabel * titleLable = [UILabel new];
        titleLable.textColor = hexColorString(@"fcfcfc");
        [titleView addSubview:titleLable];
        titleLable.textAlignment = NSTextAlignmentCenter;
        self.titleLable = titleLable;
        [titleView addSubview:titleLable];
        
        UILabel * subTitleLable = [UILabel new];
        subTitleLable.textColor = hexColorString(@"dbdbdb");
        subTitleLable.font = [UIFont systemFontOfSize:10];
        subTitleLable.text = @"双击拖动及放置物件";
        [titleView addSubview:subTitleLable];
           self.subTitleLable = subTitleLable;
        
        CGSize subTitleSize = [subTitleLable.text sizeWithAttributes:  @{NSFontAttributeName:subTitleLable.font}];
        
        
        titleLable.sd_layout
        .topSpaceToView(titleView,6)
        .leftSpaceToView(titleView,5)
        .heightIs(20)
        .rightSpaceToView(titleView,5);
        
        
        subTitleLable.sd_layout
        .topSpaceToView(self.titleLable,5)
        .bottomSpaceToView(titleView,6)
        .centerXEqualToView(titleView)
        .widthIs(subTitleSize.width);
      
        UIButton * doorbtn = [self createBtnWithImageName:@"btn_image_door" action:@selector(btnClick:) type:ZEModelTypeDoor target:self];
        [exchageView addSubview:doorbtn];
        self.doorbtn = doorbtn;
        
        
        UIButton * windowbtn = [self createBtnWithImageName:@"btn_image_window" action:@selector(btnClick:) type:ZEModelTypeWindow target:self];
        [exchageView addSubview:windowbtn];
        
        doorbtn.sd_layout
        .leftSpaceToView(exchageView,5)
        .topSpaceToView(exchageView,5)
        .bottomSpaceToView(exchageView,5)
        .widthRatioToView(exchageView,0.45);
        [doorbtn updateLayout];
        
        windowbtn.sd_layout
        .rightSpaceToView(exchageView,5)
        .topSpaceToView(exchageView,5)
        .bottomSpaceToView(exchageView,5)
        .widthRatioToView(exchageView,0.45);
        [windowbtn updateLayout];
        [self btnClick:doorbtn];
     
    }
    return self;
}


- (void)setDelegate:(id<ZEDoorHeaderDelegate>)delegate
{
    _delegate = delegate;
    [self btnClick:self.doorbtn];
}
- (void)btnClick:(UIButton*)btn
{
  
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
    switch (self.selectedBtn.tag) {
        case ZEModelTypeDoor:
            self.titleLable.text = @"门";
            break;
       case ZEModelTypeWindow:
            self.titleLable.text = @"窗";
        default:
            break;
    }
    if ([self.delegate respondsToSelector:@selector(doorHeader:didClckChangeBtn:)]) {
        [self.delegate doorHeader:self didClckChangeBtn:(ZEModelType)self.selectedBtn.tag ];
    }
    
}


#pragma mark 私有方法
- (UIButton *)createBtnWithImageName:(NSString*)imageName action:(SEL)action type:(ZEModelType)type target:(id)target
{
    UIButton * btn = [[UIButton alloc]init];
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    btn.backgroundColor = [UIColor whiteColor];
    btn.tag = type;
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    // btn_image_door_press
    [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_press",imageName]] forState:UIControlStateSelected];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}


@end
