//
//  NSDictionary+XYBaseRequest.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/22.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "NSDictionary+XYBaseRequest.h"


@implementation NSDictionary (XYBaseRequest)

- (void)xy_getWithModelType:(Class)modelType
                       Path:(NSString *)path
                    Success:(XYRequestCompletionBlock)success
                    failure:(YTKRequestCompletionBlock)failure
{
    XYBaseRequest *requestapi = [[XYBaseRequest alloc] initWithRequsetParameters:self Path:path ModelType:modelType];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication].delegate window]  animated:YES];
    [requestapi getWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request, id model) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hide:YES];
        });
        success(request, model);
    } failure:^(__kindof YTKBaseRequest *request) {
        hud.labelText = NSLocalizedString(@"网络错误",@"");
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hide:YES afterDelay:1.5];
        });
        
        failure(request);
    }];
}

- (void)xy_postWithModelType:(Class)modelType
                       Path:(NSString *)path
                    Success:(XYRequestCompletionBlock)success
                    failure:(YTKRequestCompletionBlock)failure
{
    XYBaseRequest *requestapi = [[XYBaseRequest alloc] initWithRequsetParameters:self Path:path ModelType:modelType];
    [requestapi postWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request, id model) {
        success(request, model);
    } failure:^(__kindof YTKBaseRequest *request) {
        failure(request);
    }];
}

@end
