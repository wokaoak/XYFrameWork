//
//  XYBaseRequest.m
//  XYFrameWork
//
//  Created by xiaoyao on 16/4/22.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "XYBaseRequest.h"
@interface XYBaseRequest()
@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) Class modelType;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) YTKRequestMethod requestMethod;
@end
@implementation XYBaseRequest


- (id)initWithRequsetParameters:(NSDictionary *)parameters Path:(NSString *)path ModelType:(Class)modelType
{
    if (self = [super init]) {
        _parameters = parameters;
        _path = path;
        _modelType = modelType;
    }
    return self;
}

- (id)initWithImage:(UIImage *)image{
    if (self = [super init]) {
        _image = image;
    }
    return self;
}

- (void)getWithCompletionBlockWithSuccess:(XYRequestCompletionBlock)success failure:(YTKRequestCompletionBlock)failure{
    _requestMethod = YTKRequestMethodGet;
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        id obj = [[_modelType alloc] initWithString:request.responseString error:nil];
        if (!obj) {
            NSData *data = [request.responseString dataUsingEncoding:NSUTF8StringEncoding];
            obj = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        }
        success(request, obj);
    } failure:^(__kindof YTKBaseRequest *request) {
        failure(request);
    }];
}

- (void)postWithCompletionBlockWithSuccess:(XYRequestCompletionBlock)success failure:(YTKRequestCompletionBlock)failure{
    _requestMethod = YTKRequestMethodPost;
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        id obj = [[_modelType alloc] initWithString:request.responseString error:nil];
        if (!obj) {
            obj = request.responseString;
        }
        success(request, obj);
    } failure:^(__kindof YTKBaseRequest *request) {
        failure(request);
    }];
}

- (void)uploadImageWithWithSuccess:(XYRequestCompletionBlock)success
                           failure:(YTKRequestCompletionBlock)failure
{
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        id obj = [[_modelType alloc] initWithString:request.responseString error:nil];
        success(request, obj);
    } failure:^(__kindof YTKBaseRequest *request) {
        failure(request);
    }];
}

- (NSString *)requestUrl {
    return _path;
}

- (YTKRequestMethod)requestMethod {
    if (_image) {
        return YTKRequestMethodPost;
    }
    return _requestMethod;
}


- (id)requestArgument {
    return _parameters;
}

- (AFConstructingBlock)constructingBodyBlock {
    return ^(id<AFMultipartFormData> formData) {
        NSData *data = UIImageJPEGRepresentation(_image, 0.9);
        NSString *name = @"image";
        NSString *formKey = @"image";
        NSString *type = @"image/jpeg";
        [formData appendPartWithFileData:data name:formKey fileName:name mimeType:type];
    };
}

@end
