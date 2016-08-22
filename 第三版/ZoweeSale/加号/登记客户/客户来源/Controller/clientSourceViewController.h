//
//  clientSourceViewController.h
//  ZoweeSale
//
//  Created by wanglj on 16/2/26.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SelectdSourceBlock)(NSNumber *ID,NSString *Name);

@interface clientSourceViewController : UITableViewController

@property (nonatomic ,strong)SelectdSourceBlock block;

@end
