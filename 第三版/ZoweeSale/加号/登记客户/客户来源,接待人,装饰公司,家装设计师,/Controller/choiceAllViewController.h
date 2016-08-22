//
//  choiceAllViewController.h
//  ZoweeSale
//
//  Created by wanglj on 16/4/20.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^SelectdBlock)(NSNumber *ID,NSString *Name);

@interface choiceAllViewController : UIViewController

@property (nonatomic)NSString *titleName;
@property (nonatomic) NSNumber *ID;

@property (nonatomic,strong) SelectdBlock block;
@end
