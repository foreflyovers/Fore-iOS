//
//  FOAuthenticationRequest.m
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOAuthenticationRequest.h"
#import "FOMappingProvider.h"
#import <SSKeychain/SSKeychain.h>

@implementation FOAuthenticationRequest
    
NSString * const OUAuthenticationTokenService = @"OUAuthenticationTokenService";
    
-(void)registerAccount:(NSDictionary *)userDetails withProfileImage:(UIImage *)image completion:(RequestCompletion)completionBlock;
    {
        NSString *uuidString = [[NSUUID UUID] UUIDString];
        
        __weak typeof(self) weakSelf = self;
        [self noTokenPOST:@"signup/" withParams:userDetails withBody:^(id<AFMultipartFormData> formData) {
            [formData appendPartWithFileData:UIImagePNGRepresentation(image) name:@"profileimage" fileName:[NSString stringWithFormat:@"%@.png",uuidString] mimeType:@"image/png"];
        } withCompletionBlock:^(NSError *error, id results) {
            if (error) {
                completionBlock(error, nil);
            } else {
                completionBlock(nil, [weakSelf storeTokenAndMapUser:results]);
            }
        }];
    }
    
-(void)login:(NSDictionary *)userDetails completion:(RequestCompletion)completionBlock;
    {
        NSDictionary *params = @{
                                 @"facebookID":userDetails[@"id"],
                                 @"facebookToken":userDetails[@"accessToken"]
                                 };
        
        __weak typeof(self) weakSelf = self;
        [self noTokenPOST:@"login/" withParams:params withCompletionBlock:^(NSError *error, id results) {
            if (error) {
                completionBlock(error, nil);
            } else {
                completionBlock(nil, [weakSelf storeTokenAndMapUser:results]);
            }
        }];
    }
    
-(User *)storeTokenAndMapUser:(NSDictionary *)details;
    {
        [self storeToken:details[@"token"] forAccount:details[@"user"][@"id"]];
        
        NSDictionary *user = details[@"user"];
        return [FEMManagedObjectDeserializer deserializeObjectExternalRepresentation:user
                                                                        usingMapping:[[self mappingProvider] userMapping]
                                                                             context:[self objectContext]];
    }
    
-(void)storeToken:(NSString *)token forAccount:(NSNumber *)account;
    {
        [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"currentUserToken"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    @end
