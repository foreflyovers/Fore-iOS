//
//  FOBaseModelMRProtocol.h
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@protocol FOBaseModelMRProtocol <NSObject>
    
+(NSArray *)MR_findAll;
+(NSArray *)MR_findAllWithPredicate:(NSPredicate *)predicate;
+(NSManagedObject *)MR_createEntity;
    
@end
