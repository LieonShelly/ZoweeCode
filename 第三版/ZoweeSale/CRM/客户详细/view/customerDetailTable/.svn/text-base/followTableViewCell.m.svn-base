//
//  followTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/4.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "followTableViewCell.h"
#import "NSDate+string.h"
#import "TYAttributedLabel.h"


@interface followTableViewCell ()
@end

@implementation followTableViewCell{
    UILabel *timesNumLab;
    UIView *labView;
}


- (void)setup{
    [super setup];
    UILabel *follLab = [UILabel new];
    follLab.textColor = hexColorString(@"999999");
    follLab.text = @"跟进次数";
    [self.customerView addSubview:follLab];
    follLab.sd_layout
    .topSpaceToView(self.customerView,25)
    .leftEqualToView(self.customerView)
    .widthIs([follLab labelSizeWidth])
    .heightIs(follLab.font.lineHeight);
    
    timesNumLab = [UILabel new];
    timesNumLab.text = @"0";
    timesNumLab.font = [UIFont systemFontOfSize:25];
    timesNumLab.textColor = hexColorString(@"32be32");
    [self.customerView addSubview:timesNumLab];
    timesNumLab.sd_layout
    .leftEqualToView(self.customerView)
    .topSpaceToView(follLab,25)
    .heightIs(30)
    .widthIs(25);
    UILabel *ciLab = [UILabel new];
    ciLab.text = @"次";
    ciLab.font = [UIFont systemFontOfSize:14];
    [self.customerView addSubview:ciLab];
    ciLab.sd_layout
    .leftSpaceToView(timesNumLab,3)
    .bottomSpaceToView(timesNumLab,-26)
    .widthIs(14)
    .heightIs(ciLab.font.lineHeight);

    labView = [UIView new];
    [self.customerView addSubview:labView];
    labView.sd_layout
    .leftSpaceToView(ciLab,20)
    .rightSpaceToView(self.customerView,20)
    .heightIs(20)
    .bottomEqualToView(timesNumLab);
    [self.customerView addSubview:labView];
    [self.customerView setupAutoHeightWithBottomView:timesNumLab bottomMargin:15];
    
}


- (void)setDetail:(customerDetail *)detail{
    [super setDetail:detail];
    timesNumLab.text = [NSString stringWithFormat:@"%@",detail.FollowUpTimes ?:@"0"];
    timesNumLab.sd_layout.widthIs([timesNumLab labelSizeWidth]);
    [self setTimeDayLabText:detail.FollowDate];
}

- (void)setTimeDayLabText:(NSString *)followDate{
    [labView removeAllSubviews];
    NSString *time = [NSDate dateArrivaltodaynumberString:followDate];
    UILabel *timeDayLab = [UILabel new];
    timeDayLab.font = [UIFont systemFontOfSize:12];
    timeDayLab.textAlignment = NSTextAlignmentRight;
    timeDayLab.textColor = hexColorString(@"999999");
    if (time.length>2) {
        timeDayLab.text = @"最近无跟进情况";
        [labView addSubview:timeDayLab];
        timeDayLab.sd_layout
        .spaceToSuperView(UIEdgeInsetsZero);
    }else if ([time isEqualToString:@"0"]){
        timeDayLab.text = @"今日已跟进";
        [labView addSubview:timeDayLab];
        timeDayLab.sd_layout
        .spaceToSuperView(UIEdgeInsetsZero);
    }else{
        UILabel *day = [UILabel new];
        day.font = [UIFont systemFontOfSize:12];
        day.textColor = hexColorString(@"999999");
        day.text = @"天";
        [labView addSubview:day];
        day.sd_layout
        .rightEqualToView(labView)
        .topEqualToView(labView)
        .bottomEqualToView(labView)
        .widthIs([day labelSizeWidth]);
        UILabel *num = [UILabel new];
        num.font = [UIFont systemFontOfSize:20];
        num.textColor = hexColorString(@"32be32");
        num.text = time;
        [labView addSubview:num];
        num.sd_layout
        .rightSpaceToView(day,0)
        .topEqualToView(labView)
        .bottomSpaceToView(labView,3)
        .widthIs([num labelSizeWidth]);
        
        timeDayLab.text = @"上次跟进距今已";
        [labView addSubview:timeDayLab];
        timeDayLab.sd_layout
        .rightSpaceToView(num,0)
        .topEqualToView(labView)
        .bottomEqualToView(labView)
        .widthIs([timeDayLab labelSizeWidth]);

    }
}

//- (void)setFollowDate:(NSString *)followDate {
//    for (UIView *view in self.timeVeiw.subviews) {
//        [view removeFromSuperview];
//    }
//    NSString *time = [NSDate dateArrivaltodaynumberString:followDate];
//    if (time.length > 2) {
//        UILabel *label = [UILabel new];
//        label.textAlignment = NSTextAlignmentRight;
//        label.font = [UIFont systemFontOfSize:12];
//        label.textColor = [UIColor colorWithHexString:@"999999"];
//        label.text = @"最近无跟进情况";
//        [self.timeVeiw addSubview:label];
//        label.sd_layout
//        .spaceToSuperView(UIEdgeInsetsZero);
//        
//    }else if ([time isEqualToString:@"0"]){
//        UILabel *label = [UILabel new];
//        label.textAlignment = NSTextAlignmentRight;
//        label.font = [UIFont systemFontOfSize:12];
//        label.textColor = [UIColor colorWithHexString:@"999999"];
//        label.text = @"今日以跟进";
//        [self.timeVeiw addSubview:label];
//        label.sd_layout
//        .spaceToSuperView(UIEdgeInsetsZero);
//    }
//    else {
//        TYAttributedLabel *label = [[TYAttributedLabel alloc]init];
//        label.textAlignment = kCTTextAlignmentRight;
//        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:@"上次跟进距今已"];
//        [attributedString addAttributeTextColor:[UIColor colorWithHexString:@"999999"]];
//        [attributedString addAttributeFont:[UIFont systemFontOfSize:12]];
//        [label appendTextAttributedString:attributedString];
//        
//        NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc]initWithString:time];
//        [attributedString2 addAttributeTextColor:[UIColor colorWithHexString:@"32be32"]];
//        [attributedString2 addAttributeFont:[UIFont systemFontOfSize:15]];
//        [label appendTextAttributedString:attributedString2];
//        
//        NSMutableAttributedString *attributedString3 = [[NSMutableAttributedString alloc]initWithString:@"天"];
//        [attributedString3 addAttributeTextColor:[UIColor colorWithHexString:@"999999"]];
//        [attributedString3 addAttributeFont:[UIFont systemFontOfSize:12]];
//        [label appendTextAttributedString:attributedString3];
//        [self.timeVeiw addSubview:label];
//        
//        [label setFrameWithOrign:CGPointMake(0, 0) Width:CGRectGetWidth(self.timeVeiw.frame)];
//    }
//
//}
//
//- (void)setFollowUpTime:(NSNumber *)followUpTime {
//    _followUpTime = followUpTime;
//    if (!followUpTime) {
//        self.countLabel.text = @"0";
//        return;
//    }
//    NSString *upTime = [NSString stringWithFormat:@"%@",followUpTime];
//    self.countLabel.text = upTime;
//}
//

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
