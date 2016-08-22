//
//  ZERecommandCollectionViewCell.m
//  ZoweeSale
//
//  Created by lieon on 16/7/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZERecommandCollectionViewCell.h"


@interface ZERecommandCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *degreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *ndegreeLbel;
@property (weak, nonatomic) IBOutlet UILabel *matchLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *degreeLabelWidthCons;
@property (weak, nonatomic) IBOutlet UIView *progressView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *matchLabelWidthCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *progressViewTralingCons;

@end
@implementation ZERecommandCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    self.matchLabel.textColor = hexColorString(@"2e2d2d");
    self.ndegreeLbel.backgroundColor = hexColorString(@"fcfcfc");
    self.backgroundColor = [UIColor whiteColor];
    [self updateConstraints];
}

- (void)setModel:(ZERecommandModel *)model
{
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.Url]];
    
    CGFloat width = self.width - self.matchLabelWidthCons.constant - self.progressViewTralingCons.constant;
    
//    NSLog(@"%f,%f,%f,%f,%f",self.width,self.matchLabelWidthCons.constant ,self.progressViewTralingCons.constant,self.width - self.matchLabelWidthCons.constant - self.progressViewTralingCons.constant,(90 /100.0) * width);
    self.degreeLabel.backgroundColor = [self colorWithPercentRatio:model.Degree.integerValue];
    self.progressView.backgroundColor = self.degreeLabel.backgroundColor;
    self.degreeLabelWidthCons.constant =  (model.Degree.doubleValue /100.0) * width;
    [self.degreeLabel layoutIfNeeded];
    [self.ndegreeLbel layoutIfNeeded];
    self.degreeLabel.text = [NSString stringWithFormat:@"  %@%@        .",model.Degree,@"%"];
}

- (UIColor*)colorWithPercentRatio:(NSInteger)ratio
{
    switch (ratio) {
        case 0 ... 9:
            
            break;
            
        case 10 ... 19:
            
            break;
        case 20 ... 29:
            
            break;
        case 30 ... 39:
            
            break;
        case 40 ... 49:
            
            break;
        case 50 ... 59:
            
            break;
        case 60 ... 69:
            
            break;
        case 70 ... 79:
            
            break;
        case 80 ... 89:
            
            break;
        case 90 ... 100:
            return  hexColorString(@"379d37");
            break;
            
        default:
            break;
    }
    return [UIColor greenColor];
}
@end
