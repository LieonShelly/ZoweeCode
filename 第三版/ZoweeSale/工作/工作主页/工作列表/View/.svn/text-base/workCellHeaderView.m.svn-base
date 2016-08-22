//
//  workCellHeaderView.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/10.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "workCellHeaderView.h"
#import "UIImageView+WebCache.h"
#import "NSDate+string.h"
@interface missionNumber : UILabel

/**
 *  任务执行总人数
 */
@property (nonatomic ,strong)NSNumber *ExecutorNumber;
/**
 *  任务完成总人数
 */
@property (nonatomic ,strong)NSNumber *FinishNumber;

- (void)setFinshNumber:(NSNumber *)finish AndExectorNumber:(NSNumber *)excutor;

@end

@implementation missionNumber

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self UIinit];
    }
    return self;
}

- (void)UIinit{
    self.font = [UIFont systemFontOfSize:12];
    self.textColor = hexColorString(@"a80000");
    self.textAlignment = NSTextAlignmentRight;
}

- (void)setFinshNumber:(NSNumber *)finish AndExectorNumber:(NSNumber *)excutor{
    _ExecutorNumber = excutor;
    _FinishNumber = finish;
    self.text = [NSString stringWithFormat:@"%@/%@",finish,excutor];
    if ([_ExecutorNumber isEqual:@1]) {
        self.hidden = YES;
    }else{
        self.hidden = NO;
    }
}
@end


@implementation workCellHeaderView{
    UIImageView *_headImage;
    UILabel *_nameLab;
    UILabel *_timeLab;
    UILabel *_tagLab;
    UILabel *_missionState;
    missionNumber *_number;
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
        [self UIsetup];
    }
    return self;
}

- (void)UIsetup{
    self.backgroundColor = [UIColor whiteColor];
    _headImage = [[UIImageView alloc]init];
    [self addSubview:_headImage];
    _headImage.sd_layout
    .topSpaceToView(self,10)
    .leftSpaceToView(self,10)
    .widthIs(49)
    .heightIs(49);
    _headImage.sd_cornerRadiusFromWidthRatio = @0.5;
    
    _nameLab = [UILabel new];
    _nameLab.font = [UIFont systemFontOfSize:17];
    [self addSubview:_nameLab];
    _nameLab.sd_layout
    .topSpaceToView(self,13)
    .leftSpaceToView(_headImage,10)
    .widthIs(100)
    .heightIs(17);
    
    _timeLab = [UILabel new];
    _timeLab.textColor = hexColorString(@"6f7179");
    _timeLab.font = [UIFont systemFontOfSize:12];
    [self addSubview:_timeLab];
    _timeLab.sd_layout
    .topSpaceToView(_nameLab,15)
    .leftSpaceToView(_headImage,10)
    .widthIs(100)
    .heightIs(12);
    
    _tagLab = [UILabel new];
    _tagLab.textColor = hexColorString(@"6f7179");
    _tagLab.font = [UIFont systemFontOfSize:12];
    [self addSubview:_tagLab];
    _tagLab.sd_layout
    .topEqualToView(_timeLab)
    .leftSpaceToView(_timeLab,10)
    .rightSpaceToView(self,30)
    .heightIs(12);
    
    _missionState = [UILabel new];
    _missionState.font = [UIFont systemFontOfSize:13];
    [self addSubview:_missionState];
    _missionState.sd_layout
    .rightSpaceToView(self,10)
    .centerYEqualToView(_nameLab)
    .widthIs(39)
    .heightIs(13);
    
    UILabel *mission = [UILabel new];
    mission.text = @"任务 -";
    mission.textColor = hexColorString(@"6f7179");
    mission.font = [UIFont systemFontOfSize:13];
    [self addSubview:mission];
    mission.sd_layout
    .centerYEqualToView(_missionState)
    .rightSpaceToView(_missionState,3)
    .heightIs(13)
    .widthIs(40);
    
    _number = [[missionNumber alloc]init];
    [self addSubview:_number];
    _number.sd_layout
    .topSpaceToView(_missionState,5)
    .rightEqualToView(_missionState)
    .leftEqualToView(_missionState)
    .heightIs(12);
    
    [self setupAutoHeightWithBottomView:_headImage bottomMargin:10];
}

- (void)setWorkModel:(ZeroWork *)workModel{
    _workModel = workModel;
    [_headImage sd_setImageWithURL:[NSURL URLWithString:workModel.HeadUrl] placeholderImage:[UIImage imageNamed:@"头像"]];
    _nameLab.text = workModel.UserName;
    _timeLab.text = [NSDate stringFormateWithString:workModel.PublishTime];
    CGFloat width = [_timeLab.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}].width;
    _timeLab.sd_layout.widthIs(width);
    _tagLab.text = [NSString stringWithFormat:@"来自%@",workModel.PublishTag];
    _missionState.text = [self stateStr:workModel.State];
    [_number setFinshNumber:workModel.FinishNumber AndExectorNumber:workModel.ExecutorNumber];
}

- (NSString *)stateStr:(NSNumber *)state {
    if ([state isEqual:@0]) {
        _missionState.textColor = hexColorString(@"6f7179");
        return @"未开始";
    }else if ([state isEqual:@1]) {
        _missionState.textColor = hexColorString(@"6f7179");
        return @"进行中";
    }else if ([state isEqual:@2]) {
        _missionState.textColor = hexColorString(@"6f7179");
        return @"已完成";
    }else if ([state isEqual:@3]) {
        _missionState.textColor = hexColorString(@"6f7179");
        return @"已取消";
    }else if ([state isEqual:@4]) {
        _missionState.textColor = hexColorString(@"a80000");
        return @"已过期";
    }
    return @"";
    
}

@end

