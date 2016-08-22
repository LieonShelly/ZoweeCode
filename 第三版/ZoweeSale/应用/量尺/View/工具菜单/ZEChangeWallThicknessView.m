//
//  ZEChangeWallThicknessView.m
//  ZoweeSale
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 TH. All rights reserved.
//


#define filePath  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
#define wallThicknessInView [filePath stringByAppendingPathComponent:@"wallThickInView.plist"]

#import "ZEChangeWallThicknessView.h"

@interface ZEChangeWallThicknessView (){

    CGFloat _thick;
}
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (weak, nonatomic) IBOutlet UILabel *valueLable;
@property (weak, nonatomic) IBOutlet UIView *changWallView;

@end
@implementation ZEChangeWallThicknessView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self. changWallView.backgroundColor = hexColorString(@"e7e7e7");
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.titleLable.textColor = hexColorString(@"2e2e2e");
    self.valueLable.textColor = self.titleLable.textColor;
    self.slider.maximumTrackTintColor = hexColorString(@"dcdcdc");
    self.slider.minimumTrackTintColor = hexColorString(@"c57300");
    
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    ZEChangeWallThicknessView * cell = [tableView dequeueReusableCellWithIdentifier:@"changeWallThickness"];
    if(cell == nil)
    {
        cell = [[ZEChangeWallThicknessView  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"changeWallThickness"];
  
        
    }
    return cell;
    
}

- (IBAction)sliderValueChanged:(UISlider*)sender {
  
    NSString * wThicnknessStr = [NSString stringWithContentsOfFile:wallThicknessInView encoding:NSUTF8StringEncoding error:nil];
    
    self.valueLable.text =[NSString stringWithFormat:@"%.3fm",wThicnknessStr.floatValue ];
    
    if ([self.delegate respondsToSelector:@selector(changeWallThicknessView: DidChangeWallThickness:)]) {
        [self.delegate changeWallThicknessView:self DidChangeWallThickness:self.slider.value];
    }

  
    
}

#pragma mark - publicMethod

// 显示墙的厚度为在ipad上的实际厚度的100倍
#warning TODO silder的显示还是不完美，要优化
- (void)setWThick:(NSNumber *)WThick
{
    _WThick = WThick;
    self.slider.value =  WThick.floatValue ;
    self.valueLable.text =[NSString stringWithFormat:@"%.3fm",self.slider.value];
}


@end
