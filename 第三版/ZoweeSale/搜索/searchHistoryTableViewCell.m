//
//  searchHistoryTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/21.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "searchHistoryTableViewCell.h"
#import "SKTagView.h"
#import "HexColors.h"


@interface UIImage (SKTagView)
+ (UIImage *)imageWithColor: (UIColor *)color;
@end

@interface searchHistoryTableViewCell ()

@property (weak, nonatomic) IBOutlet SKTagView *tagView;

@end

@implementation searchHistoryTableViewCell

- (void)awakeFromNib {
    // Initialization code
     self.selectionStyle = UITableViewCellSelectionStyleNone;
    //self.userInteractionEnabled = YES;
    _tagView.didTapTagAtIndex = ^(NSUInteger index){
        if ([self.delegate respondsToSelector:@selector(selectdSearchHistory:)]) {
            [self.delegate selectdSearchHistory:_searchHistory[index]];
        }
    };
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)allClearBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(clearAllHistory)]) {
        [self.delegate clearAllHistory];
    }
    
}

- (void)setSearchHistory:(NSArray *)searchHistory {
    _searchHistory = searchHistory;
    self.tagView.preferredMaxLayoutWidth = SCREEN_WIDTH;
    self.tagView.padding = UIEdgeInsetsMake(0, 20, 0, 20);
    self.tagView.interitemSpacing = 10;
    self.tagView.lineSpacing = 5;
    [self.tagView removeAllTags];
    [searchHistory enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SKTag *tag = [SKTag tagWithText:obj];
        tag.textColor = hexColorString(@"808080");
        tag.fontSize = 15;
        tag.padding = UIEdgeInsetsMake(5, 10, 5, 10);
        tag.borderColor = hexColorString(@"808080");
        tag.borderWidth = 1.0f;
        //tag.bgImg = [UIImage imageWithColor:[UIColor hx_colorWithHexString:@"2e2e2e"]];
        tag.cornerRadius = 3;
        tag.enable = NO;
        [self.tagView addTag:tag];
    }];
}

@end

@implementation UIImage (SKTagView)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end


