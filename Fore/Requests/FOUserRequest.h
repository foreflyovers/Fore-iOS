//
//  UserRequest.h
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOBaseRequest.h"

@interface FOUserRequest : FOBaseRequest

-(void)updateProfileImage:(UIImage*)image completion:(RequestCompletion)completionBlock;
    
-(void)getUser:(User *)user completion:(RequestCompletion)completionBlock;
-(void)getMeWithCompletion:(RequestCompletion)completionBlock;
    
-(void)getProfilePicture:(NSString *)imageURL withCompletionBlock:(RequestCompletion)completionBlock;

-(void)updateMe:(NSDictionary *)params withCompletion:(RequestCompletion)completionBlock;
    
-(void)registerUserWithDeviceToken:(NSDictionary *)params withCompletion:(RequestCompletion)completionBlock;
-(void)unRegisterUserWithDeviceToken:(NSDictionary *)params withCompletion:(RequestCompletion)completionBlock;

@end
