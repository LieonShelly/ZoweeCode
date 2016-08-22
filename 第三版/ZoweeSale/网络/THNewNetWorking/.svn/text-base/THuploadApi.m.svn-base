//
//  THuploadApi.m
//  YTKNetworkDemo
//
//  Created by wanglj on 16/6/12.
//  Copyright © 2016年 yuantiku.com. All rights reserved.
//

#import "THuploadApi.h"
#import "YTKNetworkConfig.h"

@implementation THuploadApi

- (id)requestArgument{
    return nil;
}

- (instancetype)initWithAction:(NSString *)action Requestparameter:(NSDictionary *)parameter file:(upLoadFile *)file{
    self = [super initWithAction:action Requestparameter:parameter];
    if (self) {
        _file = file;
    }
    return self;
}

- (NSString *)requestUrl{
    //格式化数据然后加密
    NSString *argument = [THNetworkPrivate requestCryptographyWithAction:self.action Parameter:self.parameter];
    
    NSString *url = [NSString stringWithFormat:@"%@%@?s=%@",[YTKNetworkConfig sharedInstance].baseUrl,@"UploadFile.aspx",argument];
    return url;
}

- (AFConstructingBlock)constructingBodyBlock {
    return ^(id<AFMultipartFormData> formData) {
        NSData *data = _file.fileData;
        NSString *fileName = _file.fileName;
        NSString *name = _file.name;
        NSString *type = _file.type;
        [formData appendPartWithFileData:data name:name fileName:fileName mimeType:type];
    };
}

- (id)responseJSONObject{
    return [super responseJSONObject];
}


@end
