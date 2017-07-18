//
//  FOFacebookService.m
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOFacebookService.h"
#import <AsyncImageDownloader/AsyncImageDownloader.h>

static FOFacebookService *sharedInstance = nil;

@implementation FOFacebookService

+(id)sharedInstance;
{
    static FOFacebookService *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[FOFacebookService alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

-(NSArray*)allPermissions;
{
    NSMutableArray *permissions = [NSMutableArray new];
    [permissions addObjectsFromArray:[self readPermissions]];
    [permissions addObjectsFromArray:[self publishPermissions]];
    
    return [permissions copy];
}

-(void)login:(UIViewController*)viewController;
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    
    __weak typeof(self) weakSelf = self;
    [login logInWithReadPermissions:[self readPermissions] fromViewController:viewController handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (error) {
            [[strongSelf facebookLoginDelegate] facebookLoginDidFail:error];
        } else if (result.isCancelled) {
            // Handle cancellations
        } else {
            FBSDKAccessToken *accessToken = [result token];
            NSString *tokenString = [accessToken tokenString];
            
            FBSDKGraphRequest *userIDRequest = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me"
                                                                                 parameters:nil];
            [userIDRequest startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                if (error) {
                    [[strongSelf facebookLoginDelegate] facebookLoginDidFail:error];
                }else{
                    NSMutableDictionary *params = [result mutableCopy];
                    params[@"accessToken"] = tokenString;
                    [[strongSelf facebookLoginDelegate] facebookLoginDidSucceed:params];
                }
            }];
        }
    }];
}

-(void)getUserDetails:(NSDictionary*)params withCallback:(ServiceCompletion)callback;
{
    FBSDKProfile *profile = [[FBSDKProfile alloc] initWithUserID:params[@"id"]
                                                       firstName:nil
                                                      middleName:nil
                                                        lastName:nil
                                                            name:nil
                                                         linkURL:nil
                                                     refreshDate:nil];
        
    NSString *picture = [NSString stringWithFormat:@"https://graph.facebook.com/%@",[profile imageURLForPictureMode:FBSDKProfilePictureModeSquare size:CGSizeMake(320, 320)]];
    
    [[[AsyncImageDownloader alloc] initWithMediaURL:picture successBlock:^(UIImage *image) {
        [params setValue:image forKey:@"picture"];
        callback(nil,params);
    } failBlock:^(NSError *error) {
        callback(error,params);
    }] startDownload];
}

-(void)getMyFacebookFriends:(ServiceCompletion)callback;
{
    [self getMyFacebookFriendsWithArray:[NSMutableArray new] withCompletion:callback];
}

-(void)getMyFacebookFriendsWithArray:(NSMutableArray*)friends withCompletion:(ServiceCompletion)callback;
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{@"fields":@"picture.type(large),name"}];
    
    if ([friends count]>0) {
        [params setObject:@"25" forKey:@"limit"];
        [params setObject:[@([friends count]) stringValue] forKey:@"offset"];
    }
    
    FBSDKGraphRequest *friendsRequest = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me/friends"
                                                                          parameters:params];
    [friendsRequest startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        NSArray *data = [result objectForKey:@"data"];
        
        if ([data count]>0) {
            for (NSDictionary *dict in data) {
                FBSDKProfile *profile = [[FBSDKProfile alloc] initWithUserID:dict[@"id"]
                                                                   firstName:nil
                                                                  middleName:nil
                                                                    lastName:nil
                                                                        name:dict[@"name"]
                                                                     linkURL:nil
                                                                 refreshDate:nil];
                [friends addObject:profile];
            }
        }
        
        if ([[result objectForKey:@"paging"] objectForKey:@"next"]) {
            [self getMyFacebookFriendsWithArray:friends withCompletion:callback];
        }else{
            if (callback) {
                [friends sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]]];
                
                callback(error,friends);
            }
        }
    }];
}

-(void)logout;
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logOut];
}

@end
