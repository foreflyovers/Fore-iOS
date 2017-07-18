//
//  FOBaseRequest.h
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <CoreData/CoreData.h>
#import "FOAccountService.h"
#import "FOMappingProvider.h"
#import "FOManagedObjectDeserializer.h"

typedef void(^RequestCompletion)(NSError *error, id results);
typedef void(^RequestPaginationCompletion)(NSError *error, id results, NSInteger totalCount);

@interface FOBaseRequest : NSObject
    
@property (nonatomic, strong) NSManagedObjectContext *objectContext;
@property (nonatomic, strong) FOMappingProvider *mappingProvider;
@property (nonatomic, strong) FOAccountService *accountService;
    
@property (nonatomic, strong) AFHTTPRequestOperationManager *httpManager;
@property (nonatomic, strong) AFHTTPRequestOperationManager *s3Manager;
    
-(AFHTTPRequestOperationManager *)jsonManager;
    
-(void)setUsesTokenAuthorization;
    
-(NSString *)buildURL:(NSString *)path;
-(NSError *)errorWithStatusCode:(AFHTTPRequestOperation *)operation withBaseError:(NSError *)error;
    
-(void)GET:(NSString *)url withParams:(NSDictionary *)params  withCompletionBlock:(RequestCompletion)completionBlock;
-(void)GETForWeather:(NSString *)url withParams:(NSDictionary *)params withCompletionBlock:(RequestCompletion)completionBlock;

-(void)paginationGET:(NSString *)url withParams:(NSDictionary *)params withCompletionBlock:(RequestPaginationCompletion)completionBlock;
-(void)noTokenPOST:(NSString *)url withParams:(NSDictionary *)params  withCompletionBlock:(RequestCompletion)completionBlock;
-(void)POST:(NSString *)url withParams:(NSDictionary *)params  withCompletionBlock:(RequestCompletion)completionBlock;
-(void)noTokenPOST:(NSString *)url withParams:(NSDictionary *)params withBody:(void (^)(id <AFMultipartFormData> formData))body withCompletionBlock:(RequestCompletion)completionBlock;
-(void)POST:(NSString *)url withParams:(NSDictionary *)params withBody:(void (^)(id <AFMultipartFormData> formData))body withCompletionBlock:(RequestCompletion)completionBlock;
-(void)PUT:(NSString *)url withParams:(NSDictionary *)params  withCompletionBlock:(RequestCompletion)completionBlock;
-(void)PATCH:(NSString *)url withParams:(NSDictionary *)params  withCompletionBlock:(RequestCompletion)completionBlock;
-(void)DELETE:(NSString *)url withParams:(NSDictionary *)params withCompletionBlock:(RequestCompletion)completionBlock;
    
#pragma mark - Mappings
    
-(User *)mapUser:(NSDictionary *)details;
-(NSArray *)mapUsers:(NSArray *)users;

@end
