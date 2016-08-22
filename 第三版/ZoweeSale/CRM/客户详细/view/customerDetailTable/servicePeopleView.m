//
//  servicePeopleView.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/7.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "servicePeopleView.h"
#import "UIImageView+WebCache.h"

@interface servicePeopleView()


@property (nonatomic ,strong)teamInfo *info;

@end

@implementation servicePeopleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithName:(NSString *)name {
    self = [super initWithFrame:CGRectMake(0, 0, 0, 0)];
    if (self) {
        //self.name = name;
        [self uiInitShow];
    }
    return self;
    
}

- (instancetype) initWithInfo:(teamInfo *)info {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.info = info;
        [self uiInitShow];
    }
    return self;
}

- (void)uiInitShow {
    UIImageView *headImageView = [[UIImageView alloc] init];
    [headImageView sd_setImageWithURL:StrURL(_info.Url) placeholderImage:ImageWithName(@"头像") options:SDWebImageRefreshCached];
    [self addSubview:headImageView];
    headImageView.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topEqualToView(self)
    .heightIs(38);
    headImageView.sd_cornerRadiusFromWidthRatio = @0.5;
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.font = [UIFont systemFontOfSize:12];
    nameLabel.text = _info.UserName;
    [self addSubview:nameLabel];
    nameLabel.sd_layout
    .leftEqualToView(self)
    .rightEqualToView(self)
    .topSpaceToView(headImageView,5)
    .bottomEqualToView(self);
}

@end

@implementation teamInfo



@end
