//
//  FOBaseRequest.m
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOBaseRequest.h"
#import "User.h"

@interface FOBaseRequest ()
    
@property (nonatomic, strong) NSURL *baseURL;
@property (nonatomic, strong) AFHTTPRequestOperationManager *jsonManager;
    
@end

@implementation FOBaseRequest
    
#pragma mark - Authentication
    
-(void)setUsesTokenAuthorization;
{
    NSString *tokenHeader = [NSString stringWithFormat:@"Token %@",[[self accountService] currentUserToken]];
    [[[self jsonManager] requestSerializer] setValue:tokenHeader forHTTPHeaderField:@"Authorization"];
}
    
#pragma mark - Utilities
    
-(NSString *)buildURL:(NSString *)path;
{
    return [[[self baseURL] URLByAppendingPathComponent:path] absoluteString];
}
    
-(NSError *)errorWithStatusCode:(AFHTTPRequestOperation *)operation withBaseError:(NSError *)error;
{
    return [NSError errorWithDomain:error.domain code:operation.response.statusCode userInfo:error.userInfo];
}
    
#pragma mark - GET
    
-(void)GET:(NSString *)url withParams:(NSDictionary *)params withCompletionBlock:(RequestCompletion)completionBlock;
{
    [self setUsesTokenAuthorization];
    [[self jsonManager] GET:[self buildURL:url] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(nil,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock([self errorWithStatusCode:operation withBaseError:error], nil);
    }];
}

-(void)GETForWeather:(NSString *)url withParams:(NSDictionary *)params withCompletionBlock:(RequestCompletion)completionBlock;
{
    [[self jsonManager] GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(nil,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock([self errorWithStatusCode:operation withBaseError:error], nil);
    }];
}

    
-(void)paginationGET:(NSString *)url withParams:(NSDictionary *)params withCompletionBlock:(RequestPaginationCompletion)completionBlock;
{
    [self setUsesTokenAuthorization];
    [[self jsonManager] GET:[self buildURL:url] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(nil,responseObject[@"results"],[responseObject[@"count"] integerValue]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock([self errorWithStatusCode:operation withBaseError:error], nil, 0);
    }];
}
    
#pragma mark - POST
    
-(void)noTokenPOST:(NSString *)url withParams:(NSDictionary *)params  withCompletionBlock:(RequestCompletion)completionBlock;
{
    [[[self jsonManager] requestSerializer] clearAuthorizationHeader];
    [[self jsonManager] POST:[self buildURL:url] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(nil,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock([self errorWithStatusCode:operation withBaseError:error],nil);
    }];
}
    
-(void)POST:(NSString *)url withParams:(NSDictionary *)params  withCompletionBlock:(RequestCompletion)completionBlock;
{
    [self setUsesTokenAuthorization];
    [[self jsonManager] POST:[self buildURL:url] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(nil,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock([self errorWithStatusCode:operation withBaseError:error],nil);
    }];
}
    
-(void)noTokenPOST:(NSString *)url withParams:(NSDictionary *)params withBody:(void (^)(id <AFMultipartFormData> formData))body withCompletionBlock:(RequestCompletion)completionBlock;
{
    [[[self jsonManager] requestSerializer] clearAuthorizationHeader];
    [[self jsonManager] POST:[self buildURL:url] parameters:params constructingBodyWithBlock:body success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(nil,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock([self errorWithStatusCode:operation withBaseError:error],nil);
    }];
}
    
-(void)POST:(NSString *)url withParams:(NSDictionary *)params withBody:(void (^)(id <AFMultipartFormData> formData))body withCompletionBlock:(RequestCompletion)completionBlock;
{
    [self setUsesTokenAuthorization];
    [[self jsonManager] POST:[self buildURL:url] parameters:params constructingBodyWithBlock:body success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(nil,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock([self errorWithStatusCode:operation withBaseError:error],nil);
    }];
}
    
#pragma mark - PUT
    
-(void)PUT:(NSString *)url withParams:(NSDictionary *)params withCompletionBlock:(RequestCompletion)completionBlock;
{
    [self setUsesTokenAuthorization];
    [[self jsonManager] PUT:[self buildURL:url] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(nil,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock([self errorWithStatusCode:operation withBaseError:error],nil);
    }];
}
    
#pragma mark - PATCH
    
-(void)PATCH:(NSString *)url withParams:(NSDictionary *)params withCompletionBlock:(RequestCompletion)completionBlock;
{
    [self setUsesTokenAuthorization];
    [[self jsonManager] PATCH:[self buildURL:url] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(nil,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock([self errorWithStatusCode:operation withBaseError:error],nil);
    }];
}
    
#pragma mark - DELETE
    
-(void)DELETE:(NSString *)url withParams:(NSDictionary *)params withCompletionBlock:(RequestCompletion)completionBlock;
{
    [self setUsesTokenAuthorization];
    [[self jsonManager] DELETE:[self buildURL:url] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(nil,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock([self errorWithStatusCode:operation withBaseError:error],nil);
    }];
}
    
#pragma mark - Mappings
    
-(User *)mapUser:(NSDictionary *)details;
    {
        return [FOManagedObjectDeserializer deserializeObjectExternalRepresentation:details
                                                                       usingMapping:[[self mappingProvider] userMapping]
                                                                            context:[self objectContext]];
    }
    
-(NSArray *)mapUsers:(NSArray *)users;
    {
        return [FOManagedObjectDeserializer deserializeCollectionExternalRepresentation:users
                                                                           usingMapping:[[self mappingProvider] userMapping]
                                                                                context:[self objectContext]];
    }

#pragma mark - Lazy Loading
    
-(AFHTTPRequestOperationManager *)jsonManager;
{
    if (_jsonManager) {
        return _jsonManager;
    }
    
    _jsonManager = [AFHTTPRequestOperationManager manager];
    [_jsonManager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [_jsonManager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    return _jsonManager;
}
    
-(AFHTTPRequestOperationManager *)httpManager;
{
    if (_httpManager) {
        return _httpManager;
    }
    
    _httpManager = [AFHTTPRequestOperationManager manager];
    AFImageResponseSerializer *serializer = [AFImageResponseSerializer serializer];
    serializer.acceptableContentTypes = [serializer.acceptableContentTypes setByAddingObject:@"binary/octet-stream"];
    [_httpManager setResponseSerializer:serializer];
    return _httpManager;
}
    
@end

