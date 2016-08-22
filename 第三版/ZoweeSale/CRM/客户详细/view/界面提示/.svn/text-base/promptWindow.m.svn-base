//
//  promptWindow.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/9.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "promptWindow.h"

static NSString *key = @"promptViewIsShow";
@implementation promptWindow

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.windowLevel = UIWindowLevelAlert;
    UIButton *btn = [[UIButton alloc]initWithFrame:self.frame];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    UIImageView *iamgeView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"跟进提示"]];
    [self addSubview:iamgeView];
    iamgeView.sd_layout
    .bottomSpaceToView(self,30)
    .rightSpaceToView(self,SCREEN_WIDTH/4-10)
    .heightIs(74)
    .widthIs(198);
}

- (void)show{
    if (![[NSUserDefaults standardUserDefaults] boolForKey:key]) {
        [self makeKeyAndVisible];
    }

}
- (void)hidden {
    [self resignKeyWindow];
    self.hidden = YES;
}

- (void)btnClick:(UIButton *)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:key];
    [self hidden];
}



@end
