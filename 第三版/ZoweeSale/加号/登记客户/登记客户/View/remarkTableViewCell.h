//
//  remarkTableViewCell.h
//  ZoweeSale
//
//  Created by wanglj on 16/2/25.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface remarkTableViewCell : UITableViewCell

@property (nonatomic ,strong)NSString *remark;

@property (weak, nonatomic) IBOutlet UITextField *remarkText;

@end
