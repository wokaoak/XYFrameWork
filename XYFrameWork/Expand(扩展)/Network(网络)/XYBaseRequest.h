//
//  XYBaseRequest.h
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/22.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "YTKBaseRequest.h"

typedef void(^XYRequestCompletionBlock)(__kindof YTKBaseRequest *request, id model);

@interface XYBaseRequest : YTKBaseRequest

- (id)initWithRequsetParameters:(NSDictionary *)parameters Path:(NSString *)path ModelType:(Class)modelType;

- (id)initWithImage:(UIImage *)image;

- (void)getWithCompletionBlockWithSuccess:(XYRequestCompletionBlock)success
                                    failure:(YTKRequestCompletionBlock)failure;

- (void)postWithCompletionBlockWithSuccess:(XYRequestCompletionBlock)success
                                    failure:(YTKRequestCompletionBlock)failure;

- (void)uploadImageWithWithSuccess:(XYRequestCompletionBlock)success
                           failure:(YTKRequestCompletionBlock)failure;
@end
