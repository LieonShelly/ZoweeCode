//
//  workCellContentView.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/10.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "workCellContentView.h"
#import "NSDate+string.h"
#import "TYAttributedLabel.h"
#import "HZURLNavigation.h"
#import "customerDetailViewController.h"

@interface workCellContentView ()<TYAttributedLabelDelegate>

@end

@implementation workCellContentView{
    UIImageView *_finishImag;
    UILabel *_title;
    UILabel *_addressLab;
    UILabel *_impManLab;
    UILabel *_impTimeLab;
    TYAttributedLabel *_linkCustomerLab;

}



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
        self.backgroundColor = [UIColor whiteColor];
        [self UIinit];
    }
    return self;
}

- (void)UIinit{
    _finishImag = [UIImageView new];
    [self addSubview:_finishImag];
    _finishImag.sd_layout
    .leftSpaceToView(self,31)
    .topSpaceToView(self,10)
    .widthIs(18)
    .heightIs(18);
    
    _title = [UILabel new];
    [self addSubview:_title];
    _title.sd_layout
    .centerYEqualToView(_finishImag)
    .leftSpaceToView(_finishImag,10)
    .rightSpaceToView(self,20)
    .heightIs(17);
    
    UIImageView *locapImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"量尺地址"]];
    [self addSubview:locapImage];
    locapImage.sd_layout
    .topSpaceToView(_title,10)
    .leftSpaceToView(self,60)
    .widthIs(13)
    .heightIs(17);
    UILabel *address = [UILabel new];
    address.textColor = hexColorString(@"666666");
    address.font = [UIFont systemFontOfSize:15];
    address.text = @"量尺地址:";
    [self addSubview:address];
    address.sd_layout
    .centerYEqualToView(locapImage)
    .leftSpaceToView(locapImage,5)
    .widthIs(75)
    .heightIs(15);
    
    _addressLab = [UILabel new];
    _addressLab.font = [UIFont systemFontOfSize:15];
    _addressLab.textColor = hexColorString(@"666666");
    [self addSubview:_addressLab];
    _addressLab.sd_layout
    .centerYEqualToView(locapImage)
    .leftSpaceToView(address,5)
    .rightSpaceToView(self,20)
    .heightIs(15);
    
    UIImageView *impmanImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"身份"]];
    [self addSubview:impmanImage];
    impmanImage.sd_layout
    .centerXEqualToView(locapImage)
    .topSpaceToView(locapImage,10)
    .widthIs(12)
    .heightIs(12);
    UILabel *impman = [UILabel new];
    impman.text = @"导购:";
    impman.textColor = hexColorString(@"999999");
    impman.font = [UIFont systemFontOfSize:12];
    [self addSubview:impman];
    impman.sd_layout
    .centerYEqualToView(impmanImage)
    .leftEqualToView(address)
    .widthIs(30)
    .heightIs(12);
    
    _impManLab = [UILabel new];
    _impManLab.textColor = hexColorString(@"999999");
    _impManLab.font = [UIFont systemFontOfSize:12];
    [self addSubview:_impManLab];
    _impManLab.sd_layout
    .centerYEqualToView(impmanImage)
    .leftSpaceToView(impman,5)
    .rightSpaceToView(self,20)
    .heightIs(12);
    
    UIImageView *impTimeImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"时间点"]];
    [self addSubview:impTimeImage];
    impTimeImage.sd_layout
    .centerXEqualToView(locapImage)
    .topSpaceToView(impmanImage,10)
    .widthIs(12)
    .heightIs(12);
    UILabel *impTime = [UILabel new];
    impTime.text = @"量尺时间:";
    impTime.font = [UIFont systemFontOfSize:12];
    impTime.textColor = hexColorString(@"999999");
    [self addSubview:impTime];
    impTime.sd_layout
    .centerYEqualToView(impTimeImage)
    .leftEqualToView(address)
    .widthIs(55)
    .heightIs(12);
    
    _impTimeLab = [UILabel new];
    _impTimeLab.font = [UIFont systemFontOfSize:12];
    _impTimeLab.textColor = hexColorString(@"999999");
    [self addSubview:_impTimeLab];
    _impTimeLab.sd_layout
    .centerYEqualToView(impTimeImage)
    .leftSpaceToView(impTime,5)
    .rightSpaceToView(self,20)
    .heightIs(12);
    
    UIView *backView = [UIView new];
    backView.backgroundColor = hexColorString(@"f0eded");
    backView.sd_cornerRadius = @3;
    [self addSubview:backView];
    backView.sd_layout
    .topSpaceToView(impTimeImage,30)
    .leftSpaceToView(self,10)
    .rightSpaceToView(self,10)
    .heightIs(40);
    UIImageView *linkImag = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"关联客户"]];
    [backView addSubview:linkImag];
    linkImag.sd_layout
    .centerYEqualToView(backView)
    .leftSpaceToView(backView,16)
    .heightIs(23)
    .widthIs(23);
    
    UILabel *linkLab = [UILabel new];
    linkLab.text = @"关联客户:";
    linkLab.textColor = hexColorString(@"666666");
    linkLab.font = [UIFont systemFontOfSize:15];
    [backView addSubview:linkLab];
    linkLab.sd_layout
    .centerYEqualToView(backView)
    .leftSpaceToView(linkImag,10)
    .widthIs(65)
    .heightIs(15);
    
    UILabel *labLine = [UILabel new];
    labLine.backgroundColor = [hexColorString(@"666666") colorWithAlphaComponent:0.2];
    [self addSubview:labLine];
    labLine.sd_layout
    .topSpaceToView(backView,5)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(0.5);
    _linkCustomerLab = [[TYAttributedLabel alloc]init];
    [backView addSubview:_linkCustomerLab];
    _linkCustomerLab.backgroundColor = [UIColor clearColor];
    _linkCustomerLab.verticalAlignment = TYVerticalAlignmentCenter;
    _linkCustomerLab.delegate = self;
    _linkCustomerLab.sd_layout
    .leftSpaceToView(linkLab,5)
    .rightEqualToView(backView)
    .topEqualToView(backView)
    .bottomEqualToView(backView);
    
    [self setupAutoHeightWithBottomView:labLine bottomMargin:0];
    
}

- (void)setWorkModel:(ZeroWork *)workModel{
    _workModel = workModel;
    if ([workModel.State isEqual:@2]) {
        _finishImag.image = [UIImage imageNamed:@"任务完成"];
    }else{
        _finishImag.image = [UIImage imageNamed:@"任务未完成"];
    }
    _title.text = workModel.Title;
    _addressLab.text = workModel.Content;
    _impManLab.text = workModel.ExecutorNameList;
    _impTimeLab.text = [NSDate stringFormateWithString:workModel.ExecuteTime];
    
    // 属性文本生成器
    TYTextContainer *textContainer = [[TYTextContainer alloc]init];
    NSString *text = workModel.CustomerName;
    textContainer.text = text;
    textContainer.linkColor = hexColorString(@"666666");
    _linkCustomerLab.textContainer = textContainer;
    [textContainer addLinkWithLinkData:workModel.CustomerID linkColor:nil underLineStyle:kCTUnderlineStyleNone range:[text rangeOfString:workModel.CustomerName]];
}

// 点击代理
- (void)attributedLabel:(TYAttributedLabel *)attributedLabel textStorageClicked:(id<TYTextStorageProtocol>)textStorage atPoint:(CGPoint)point{
    //NSLog(@"textStorageClickedAtPoint");
    if ([textStorage isKindOfClass:[TYLinkTextStorage class]]) {
        id linkStr = ((TYLinkTextStorage*)textStorage).linkData;
        NSLog(@"%@",linkStr);
        NSNumber *customerID = (NSNumber *)linkStr;
        customerDetailViewController *customerDetail = [[UIStoryboard storyboardWithName:@"CRM" bundle:nil] instantiateViewControllerWithIdentifier:@"customerDetail"];
        customerDetail.ID = customerID;
        [[HZURLNavigation currentNavigationViewController] pushViewController:customerDetail
                                             animated:YES];
        
    }

}

@end
