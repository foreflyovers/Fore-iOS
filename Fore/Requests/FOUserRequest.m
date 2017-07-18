//
//  UserRequest.m
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOUserRequest.h"
#import "User.h"

@implementation FOUserRequest
    
-(void)updateProfileImage:(UIImage *)image completion:(RequestCompletion)completionBlock;
{
    NSString *uuidString = [[NSUUID UUID] UUIDString];
    
    __weak typeof(self) weakSelf = self;
    [self POST:@"users/me/" withParams:nil withBody:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:UIImagePNGRepresentation(image) name:@"profileImage" fileName:[NSString stringWithFormat:@"%@.png",uuidString] mimeType:@"image/png"];
    } withCompletionBlock:^(NSError *error, id results) {
        if (error) {
            completionBlock(error, nil);
        } else {
            completionBlock(nil, [weakSelf mapUser:results]);
        }
    }];
}
    
-(void)getUser:(User *)user completion:(RequestCompletion)completionBlock;
{
    __weak typeof(self) weakSelf = self;
    [self GET:[NSString stringWithFormat:@"users/%@/",user.id] withParams:nil withCompletionBlock:^(NSError *error, id results) {
        if (error) {
            completionBlock(error, nil);
        } else {
            completionBlock(nil, [weakSelf mapUser:results]);
        }
    }];
}
    
-(void)getMeWithCompletion:(RequestCompletion)completionBlock;
{
    __weak typeof(self) weakSelf = self;
    [self GET:@"users/me/" withParams:nil withCompletionBlock:^(NSError *error, id results) {
        if (error) {
            completionBlock(error, nil);
        } else {
            completionBlock(nil, [weakSelf mapUser:results]);
        }
    }];
}
    
-(void)getProfilePicture:(NSString *)imageURL withCompletionBlock:(RequestCompletion)completionBlock;
{
    [[self httpManager] GET:[self buildURL:imageURL] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(nil,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock([self errorWithStatusCode:operation withBaseError:error], nil);
    }];
}
    
-(void)updateMe:(NSDictionary *)params withCompletion:(RequestCompletion)completionBlock;
{
    __weak typeof(self) weakSelf = self;
    [self PATCH:@"users/me/" withParams:params withCompletionBlock:^(NSError *error, id results) {
        if (error) {
            completionBlock(error, nil);
        } else {
            completionBlock(nil, [weakSelf mapUser:results]);
        }
    }];
}
    
-(void)registerUserWithDeviceToken:(NSDictionary *)params withCompletion:(RequestCompletion)completionBlock;
{
    [self POST:@"users/me/registerdevice/" withParams:params withCompletionBlock:^(NSError *error, id results) {
        if (error) {
            completionBlock(error, nil);
        } else {
            completionBlock(nil, nil);
        }
    }];
}
    
-(void)unRegisterUserWithDeviceToken:(NSDictionary *)params withCompletion:(RequestCompletion)completionBlock;
{
    [self POST:@"users/me/unregisterdevice/" withParams:params withCompletionBlock:^(NSError *error, id results) {
        if (error) {
            completionBlock(error, nil);
        } else {
            completionBlock(nil, nil);
        }
    }];
}
        
@end



