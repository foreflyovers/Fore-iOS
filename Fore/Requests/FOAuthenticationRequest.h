//
//  FOAuthenticationRequest.h
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOBaseRequest.h"
#import "User.h"

extern NSString * const OUAuthenticationTokenService;

@interface FOAuthenticationRequest : FOBaseRequest
    
-(void)registerAccount:(NSDictionary *)userDetails withProfileImage:(UIImage *)image completion:(RequestCompletion)completionBlock;
-(void)login:(NSDictionary *)userDetails completion:(RequestCompletion)completionBlock;

@end
