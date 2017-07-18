//
//  FODAOProtocol.h
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@protocol FODAOProtocol <NSObject>

-(id<FODAOProtocol>)initWithModelClass:(Class)clazz;
    
-(NSArray *)all;
-(NSArray *)allWithPredicate:(NSPredicate *)predicate;
    
-(NSArray *)allSortedBy:(NSArray *)sortDescriptors;
-(NSArray *)allWithPredicate:(NSPredicate *)predicate sortedBy:(NSArray *)sortDescriptors;
    
-(NSManagedObject *)create;

@end
