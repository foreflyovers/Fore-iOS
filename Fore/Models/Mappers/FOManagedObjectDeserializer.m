//
//  FOManagedObjectDeserializer.m
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOManagedObjectDeserializer.h"
#import <CoreData/CoreData.h>
#import "MagicalRecord.h"

@implementation FOManagedObjectDeserializer

+(id)deserializeObjectExternalRepresentation:(NSDictionary *)externalRepresentation
                                usingMapping:(FEMManagedObjectMapping *)mapping
                                     context:(NSManagedObjectContext *)context;
{
    id returnObject = [super deserializeObjectExternalRepresentation:externalRepresentation usingMapping:mapping context:context];
    
    [context MR_saveToPersistentStoreWithCompletion:nil];
    
    return returnObject;
}
    
+(NSArray *)deserializeCollectionExternalRepresentation:(NSArray *)externalRepresentation
                                           usingMapping:(FEMManagedObjectMapping *)mapping
                                                context:(NSManagedObjectContext *)context;
{
    NSArray *returnArray = [super deserializeCollectionExternalRepresentation:externalRepresentation usingMapping:mapping context:context];
    
    [context MR_saveToPersistentStoreWithCompletion:nil];
    
    return returnArray;
}
    
@end
