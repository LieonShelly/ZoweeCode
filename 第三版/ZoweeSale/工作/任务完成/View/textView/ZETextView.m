//
//  ZETextView.m
//  ZoweeSale
//
//  Created by apple on 16/3/14.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZETextView.h"
#import "UIView+Extension.h"

@interface ZETextView ()
@property(nonatomic,weak)UILabel* placeholderLabel;

@end

@implementation ZETextView

//warning 调用init时就会调用initWithFrame
-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        UILabel * placeholderLabel = [UILabel new];
        placeholderLabel.backgroundColor = [UIColor clearColor];
        placeholderLabel.numberOfLines = 0;
        
        self.placeholderLabel = placeholderLabel;
        self.placehodlerColor = [UIColor lightGrayColor];
        [self addSubview:placeholderLabel];
        //        设置默认的字体
        self.font = [UIFont systemFontOfSize:14];
        //        监听内部文字的改变
//warning 不要设置自己的代理为本身
        //        使用通知监听文本的改变
        /**
         *  当用户通过键盘修改了self的文字发生改变，self就会自动发出一个UITextViewTextDidChangeNotification的通知，一旦发出通知就会调用self的textDidchange方法
         */
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

#pragma mark -- 监听文字的改变
- (void)textDidChange
{
    self.placeholderLabel.hidden = self.text.length!= 0;
}

- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    self.placeholderLabel.text = _placeholder;
    

    //    有可能被中途更改提示文字，所以要重新设置下大小
    [self setNeedsLayout];
}

-(void)setPlacehodlerColor:(UIColor *)placehodlerColor
{
    _placehodlerColor = placehodlerColor;
    self.placeholderLabel.textColor = _placehodlerColor;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.placeholderLabel.x = 6;
    self.placeholderLabel.y = 8;
    self.placeholderLabel.width = self.width - 2 * self.placeholderLabel.x;
    //    根据文字计算label的高度
    CGSize maxSize = CGSizeMake(self.placeholderLabel.width, MAXFLOAT);
    NSMutableDictionary * attribute = [NSMutableDictionary dictionary];
    attribute[NSFontAttributeName] = self.placeholderLabel.font;

    CGSize placeholderSize = [self.placeholder boundingRectWithSize:maxSize options: NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    self.placeholderLabel.height = placeholderSize.height;
}


-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.placeholderLabel.font = font;

    //    有可能被中途更改提示文字的大小，所以要重新设置下大小
    [self setNeedsLayout];
}

// 有可能被别的程序员修改了外部的文字，那么也要隐藏self.placeholderlabel,注意程序的严谨性
-(void)setText:(NSString *)text{
    [super setText:text];
    [self textDidChange];
}



@end
