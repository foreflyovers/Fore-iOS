//
//  FOAccountService.h
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FOBaseService.h"
#import "User.h"

@class FODAO, FOAuthenticationRequest, FOUserRequest;

@interface FOAccountService : FOBaseService
    
@property (nonatomic, strong) FODAO *userDao;
@property (nonatomic, strong) FOAuthenticationRequest *authenticationRequest;
@property (nonatomic, strong) FOUserRequest *userRequest;
    
-(void)updateProfileImage:(UIImage*)image completion:(ServiceCompletion)completionBlock;
    
-(void)registerAccount:(NSDictionary *)userDetails
      withProfileImage:(UIImage *)image
            completion:(ServiceCompletion)completionBlock;
    
-(void)login:(NSDictionary *)userDetails completionBlock:(ServiceCompletion)completionBlock;
-(void)logout;
    
-(User *)currentUser;
-(void)setLoggedInUser:(User *)user;
-(NSNumber *)currentUserID;
-(NSString *)currentUserToken;
-(BOOL)userAccountExists;
    
-(void)setDeviceToken:(NSData*)deviceToken;
    
-(void)registerUserDeviceForPushNotifications;
    
-(void)registerForNotifications;
-(void)receivedNotificationFromUser:(NSDictionary *)userInfo forApplicationState:(UIApplicationState)state;
    
-(void)getMeWithCompletionBlock:(ServiceCompletion)completionBlock;
-(void)getUser:(User*)user withCompletionBlock:(ServiceCompletion)completionBlock;
    
-(void)registerUserWithDeviceToken:(NSDictionary *)params withCompletion:(ServiceCompletion)completionBlock;
-(void)unRegisterUserWithDeviceToken:(NSDictionary *)params withCompletion:(ServiceCompletion)completionBlock;
    
-(void)updateMe:(NSDictionary *)params withCompletion:(ServiceCompletion)completionBlock;
    
@end
