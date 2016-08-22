//
//  ZEAwsomeMenu.m
//  ZoweeSale
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 TH. All rights reserved.
// 

#import "ZEAwsomeMenu.h"
#import "ZEAwsomeMenuModel.h"

#import "ZEAwsomeMenuButton.h"
@interface ZEAwsomeMenu ()


@end

@implementation ZEAwsomeMenu


- (void)btnClick:(ZEAwsomeMenuButton *)sender
{
    self.alpha = 0;
    if ([self.delegate respondsToSelector:@selector(awsomeMenuBtnClick:)]) {
        [self.delegate awsomeMenuBtnClick:sender.tag];
    }
}

- (void)setCustomerOperationType:(NSString *)CustomerOperationType
{
    NSLog(@"CustomerOperationType:%@",CustomerOperationType);
    _CustomerOperationType = [CustomerOperationType copy];
    int a[100] = {0};
    NSLog(@"%@",_CustomerOperationType);
    NSUInteger length = CustomerOperationType.length;
    if (length % 2 != 0) {
        length = length - 1;
        a[length+1] = [CustomerOperationType characterAtIndex:length];
    }
    for (NSUInteger i = 0; i <= length/2; i++) {
        NSUInteger index = i * 2;
        NSString * value = [CustomerOperationType substringWithRange:NSMakeRange(index, 1)] ;
        NSLog(@"%@",value);
    }
    
 
    
}



- (void)setIndexArray:(NSArray *)indexArray
{
    _indexArray = indexArray;
    if (_indexArray.count == 0) {
        return;
    }
    NSDictionary * models = [ZEAwsomeMenuModel awsomeMenuModels];
    NSInteger count = 0;
    
    for (NSString * index in indexArray) {
        
        NSInteger i = index.integerValue;
        ZEAwsomeMenuModel * model = [models valueForKey:index];
        UIImage * image = [UIImage imageNamed:model.iconName];
        NSString * title = model.tittle;
        ZEAwsomeMenuButton * btn = [[ZEAwsomeMenuButton alloc]init];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:image forState:UIControlStateNormal];
        [btn setTitle:title forState:UIControlStateNormal];
        btn.tag = i;
        [self addSubview:btn];
        
        CGFloat margin = 5;
        btn.sd_layout.bottomSpaceToView(self,(65 + margin) * count)
        .centerXEqualToView(self)
        .widthIs(45)
        .heightIs(65);
        
        count ++;
        
    }
    
}
@end
