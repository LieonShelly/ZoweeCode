//
//  ZEAttachmentsTable.m
//  ZoweeSale
//
//  Created by wanglj on 16/6/3.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEAttachmentsTable.h"
#import "HZPhotoBrowser.h"
#import "UIImageView+WebCache.h"

@interface ZEAttachment()<HZPhotoBrowserDelegate>

@end

@implementation ZEAttachmentsTable{
    ZEAttachment *selectment;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setupAfter{
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)setAttachments:(NSArray *)attachments{
    _attachments = [attachments copy];
    [self tableShow];
    [self reloadData];
}

- (void)tableShow{
    [self.viewModel.sectionModelArray removeAllObjects];
    YZSTableViewSectionModel *sectionModel = [[YZSTableViewSectionModel alloc] init];
    [self.viewModel.sectionModelArray addObject:sectionModel];
    
    for (ZEAttachment *attachment in self.attachments) {
        YZSTableViewCellModel *cellModel = [[YZSTableViewCellModel alloc] init];
        cellModel.height = 88;
        [sectionModel.cellModelArray addObject:cellModel];
        cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
            ZEAttachmentsCell *cell = [tableView dequeueReusableCellWithIdentifier:[ZEAttachmentsCell CellIdentifier]];
            if (!cell) {
                cell = [[ZEAttachmentsCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                reuseIdentifier:[ZEAttachmentsCell CellIdentifier]];
            }
            cell.attachment = attachment;
            return cell;
        };
        cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            if ([attachment.FileName hasSuffix:@".jpeg"] ||[attachment.FileName hasSuffix:@".jpg"]) {
                //启动图片浏览器
                HZPhotoBrowser *browserVc = [[HZPhotoBrowser alloc] init];
                ZEAttachmentsCell *collectCell = (ZEAttachmentsCell *)[tableView cellForRowAtIndexPath:indexPath];
                selectment = attachment;
                browserVc.sourceImagesContainerView = collectCell.imageview.superview; // 原图的父控件
                browserVc.imageCount = 1; // 图片总数
                browserVc.currentImageIndex = 0;
                browserVc.isPortraitorLeft = NO;
                browserVc.delegate = self;
                [browserVc showWithController:[HZURLNavigation currentViewController]];
            }
        };
    }

}

#pragma mark - photobrowser代理方法
- (UIImage *)photoBrowser:(HZPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    UIImageView *imageView = [[UIImageView alloc]init];
    [imageView sd_setImageWithURL:[NSURL URLWithString:selectment.ThumbnailPath]];
    return imageView.image;
}

- (NSURL *)photoBrowser:(HZPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    return [NSURL URLWithString:selectment.FilePath];
}


@end
