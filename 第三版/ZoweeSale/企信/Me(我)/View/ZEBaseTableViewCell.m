//
//  ZEBaseTableViewCell.m
//  ZoweeSale
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEBaseTableViewCell.h"

@interface ZEBaseTableViewCell()
@property(nonatomic,strong) UIImageView * imageV;
@property(nonatomic,weak)UIView *divider;
@property(nonatomic,copy) NSString * versionNumber;

@end

@implementation ZEBaseTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

//重写该方法，设置cell的样式
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
    UIView * selView = [[UIView alloc]init];
    selView.backgroundColor = [UIColor colorWithRed:238/255.0 green:233/255.0 blue:218/255.0 alpha:1];
    self.selectedBackgroundView =selView;
  
    UIView * norView = [[UIView alloc]init];
    norView.backgroundColor = [UIColor whiteColor];
    self.backgroundView = norView;
  
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.detailTextLabel.backgroundColor = [UIColor clearColor];
    UIView *divider = [[UIView alloc]init];
    divider.backgroundColor = hexColorString(@"dddddd");
    [self.contentView addSubview:divider];
    
    self.divider = divider;
 
        
    }
    return self;
}

//分割线的frame
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat diviederX =0;
    CGFloat dividerY = self.contentView.bounds.size.height - 1;
    CGFloat dividerW = self.width;
    CGFloat dividerH = 1;
    self.divider.frame = CGRectMake(diviederX, dividerY, dividerW, dividerH);
}

-(UIImageView *)imageV
{
    if(_imageV == nil)
    {
        _imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
    }
    return _imageV;
}


 -(NSString *)versionNumber
{
    if ( _versionNumber == nil) {
        //   版本号的关键字为 CFBundleVersion
        NSString * versionkey =@"CFBundleShortVersionString";
        //    获取当前打开软件时的版本号（info.plist）
        NSString *currentVersion=[NSBundle mainBundle].infoDictionary[versionkey];
        _versionNumber = currentVersion;
    }
    return _versionNumber;
}

- (void)setItem:(ZEItem *)item
{
    _item = item;
   
    self.textLabel.text = item.title;
    if([item isKindOfClass:[ZEArrowItem class]])
    {
        self.accessoryView = self.imageV;
        // 版本号
        self.detailTextLabel.text = self.versionNumber;
    }else if([item isKindOfClass:[ZENoArrowItem class]])
    {
        self.textLabel.textColor = hexColorString(@"fa5a5a");
        self.accessoryView = nil;
        
    }else  if([item isKindOfClass:[ZENoSubtitleItem class]])
    {
        self.accessoryView = self.imageV;
        self.detailTextLabel.text = nil;
    }
    else
    {
        self.accessoryView = nil;
    }

}

 - (void)setHiddeDivider:(BOOL)hiddeDivider
{
    _hiddeDivider =hiddeDivider;
    self.divider.hidden = hiddeDivider;
}
@end
