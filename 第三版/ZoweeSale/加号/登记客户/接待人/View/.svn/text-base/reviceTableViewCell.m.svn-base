//
//  reviceTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/26.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "reviceTableViewCell.h"
#import "UIImageView+WebCache.h"
@interface reviceTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *photeImage;
@property (weak, nonatomic) IBOutlet UIImageView *select;

@property (weak, nonatomic) IBOutlet UILabel *nameLab;

@end

@implementation reviceTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.select.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setName:(NSString *)name {
    _name = name;
    self.nameLab.text = name;
}

- (void)setPhoteImg:(NSString *)photeImg {
    _photeImg = photeImg;
    if(photeImg) {
        [[SDWebImageDownloader sharedDownloader]downloadImageWithURL:[NSURL URLWithString:photeImg] options:0 progress:nil completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
            if(!error){
                dispatch_async(dispatch_get_main_queue(), ^{
                    _photeImage.image =[UIImage imageWithData:data];
                });
            }
        }];
    }
}


- (void)setIsSelectd:(BOOL)isSelectd {
    _isSelectd = isSelectd;
    if (isSelectd) {
        self.select.hidden = NO;
    }else {
        self.select.hidden = YES;
    }
}
@end
