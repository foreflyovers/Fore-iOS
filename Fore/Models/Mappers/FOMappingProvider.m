//
//  FOMappingProvider.m
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOMappingProvider.h"

@implementation FOMappingProvider

- (FEMManagedObjectMapping *)userMapping {
    return [FEMManagedObjectMapping mappingForEntityName:@"User" configuration:^(FEMManagedObjectMapping *mapping) {
        [mapping setPrimaryKey:@"id"];  // object uniquing
        
        [mapping addAttributesFromArray:@[@"id",@"name",@"email",@"profileImage",@"facebookID"]];
    }];
}
    
@end
