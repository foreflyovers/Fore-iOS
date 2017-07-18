//
//  FOAccountService.m
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOAccountService.h"
#import "FOAuthenticationRequest.h"
#import "FOUserRequest.h"
#import <MagicalRecord/MagicalRecord.h>
#import <SSKeychain/SSKeychain.h>
    
@interface FOAccountService()
    
@property (nonatomic,strong) NSData *deviceToken;
    
@end

@implementation FOAccountService
    
-(void)updateProfileImage:(UIImage*)image completion:(ServiceCompletion)completionBlock;
{
    [[self userRequest] updateProfileImage:image completion:completionBlock];
}
    
-(void)registerAccount:(NSDictionary *)userDetails withProfileImage:(UIImage *)image completion:(ServiceCompletion)completionBlock;
{
    __weak typeof(self) weakSelf = self;
    [[self authenticationRequest] registerAccount:userDetails withProfileImage:image completion:^(NSError *error, User *user) {
        if (!error) {
            [weakSelf setLoggedInUser:user];
        }
        
        completionBlock(error, user);
    }];
}
    
-(void)login:(NSDictionary *)userDetails completionBlock:(ServiceCompletion)completionBlock;
{
    __weak typeof(self) weakSelf = self;
    [[self authenticationRequest] login:userDetails completion:^(NSError *error, User *user) {
        if (!error) {
            [weakSelf setLoggedInUser:user];
        }
        completionBlock(error, user);
    }];
}

-(void)getMeWithCompletionBlock:(ServiceCompletion)completionBlock;
    {
        completionBlock(nil, [self currentUser]);
        [[self userRequest] getMeWithCompletion:completionBlock];
    }
    
-(void)getUser:(User*)user withCompletionBlock:(ServiceCompletion)completionBlock;
    {
        completionBlock(nil, user);
        if (user == [self currentUser]) {
            [self getMeWithCompletionBlock:completionBlock];
        }else{
            [[self userRequest] getUser:user completion:completionBlock];
        }
    }
    
-(void)setDeviceToken:(NSData *)deviceToken
    {
        _deviceToken = deviceToken;
        
        [[NSUserDefaults standardUserDefaults] setObject:deviceToken forKey:@"deviceToken"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        if ([self userAccountExists]) {
            [self registerUserDeviceForPushNotifications];
        }
    }
    
-(void)registerForNotifications;
{
    UIApplication *application = [UIApplication sharedApplication];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
        
        [application registerUserNotificationSettings:settings];
        [application registerForRemoteNotifications];
    }else{
        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound];
    }
}
    
-(void)registerUserDeviceForPushNotifications;
    {
        if ([self currentUserToken] != nil) {
            NSString* deviceTokenString = [[NSString stringWithFormat:@"%@",[self currentUserDeviceToken]]
                                           stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
            
            NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:deviceTokenString,@"token",@"apns",@"type", nil];
            
            [self registerUserWithDeviceToken:dictionary withCompletion:^(NSError *error, id results) {
                
            }];
        }
    }
    
-(void)registerUserWithDeviceToken:(NSDictionary *)params withCompletion:(ServiceCompletion)completionBlock;
    {
        [[self userRequest] registerUserWithDeviceToken:params withCompletion:completionBlock];
    }
    
-(void)unRegisterUserWithDeviceToken:(NSDictionary *)params withCompletion:(ServiceCompletion)completionBlock;
    {
        [[self userRequest] unRegisterUserWithDeviceToken:params withCompletion:completionBlock];
    }
    
-(void)receivedNotificationFromUser:(NSDictionary *)userInfo forApplicationState:(UIApplicationState)state
    {
        switch (state) {
            case UIApplicationStateActive:{
                //do in app notifications
                break;
            }
            
            case UIApplicationStateBackground:{
                break;
            }
            
            case UIApplicationStateInactive:{
                break;
            }
            
            default:
            break;
            
        }
    }
    
-(void)updateMe:(NSDictionary *)params withCompletion:(ServiceCompletion)completionBlock;
    {
        [[self userRequest] updateMe:params withCompletion:completionBlock];
    }
    
-(User *)currentUser;
    {
        User *user = [User MR_findFirstByAttribute:@"id" withValue:[self currentUserID]];
        if (!user) {
            
        }
        
        return user;
    }
    
-(void)setLoggedInUser:(User *)user;
    {
        [[NSUserDefaults standardUserDefaults] setObject:user.id forKey:@"currentUserID"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
-(NSNumber *)currentUserID;
    {
        return [[NSUserDefaults standardUserDefaults] objectForKey:@"currentUserID"];
    }
    
-(NSString *)currentUserToken;
    {
        return [[NSUserDefaults standardUserDefaults] objectForKey:@"currentUserToken"];
    }
    
-(NSString *)currentUserDeviceToken;
    {
        return [[NSUserDefaults standardUserDefaults] objectForKey:@"deviceToken"];
    }
    
-(BOOL)userAccountExists;
    {
        return ([self currentUserID] != nil);
    }
    
-(void)logout;
    {
        NSString* deviceTokenString = [[NSString stringWithFormat:@"%@",[self currentUserDeviceToken]]
                                       stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
        
        NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:deviceTokenString,@"token", nil];
        
        [self unRegisterUserWithDeviceToken:dictionary withCompletion:^(NSError *error, id results) {
            
        }];
        
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"currentUserID"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"deviceToken"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
@end
