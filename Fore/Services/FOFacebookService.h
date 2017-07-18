//
//  FOFacebookService.h
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOBaseService.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "FOFacebookLoginDelegate.h"

typedef void(^FacebookSessionCallback)();

@interface FOFacebookService : FOBaseService

+(id)sharedInstance;

@property (nonatomic,strong) NSArray *readPermissions;
@property (nonatomic,strong) NSArray *publishPermissions;

@property (nonatomic, weak) id<FOFacebookLoginDelegate> facebookLoginDelegate;

-(void)login:(UIViewController*)viewController;
-(void)logout;
-(void)getUserDetails:(NSDictionary*)params withCallback:(ServiceCompletion)callback;
-(void)getMyFacebookFriends:(ServiceCompletion)callback;

@end
