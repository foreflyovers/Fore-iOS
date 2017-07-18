//
//  FODAO.m
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOBaseModelMRProtocol.h"
#import <MagicalRecord/MagicalRecord.h>
#import "FODAO.h"

@interface FODAO ()
    
@property (nonatomic, strong) Class<FOBaseModelMRProtocol> modelClass;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation FODAO
    
-(instancetype)initWithModelClass:(Class)clazz;
    {
        self = [super init];
        if (self) {
            [self setModelClass:clazz];
        }
        return self;
    }
    
-(NSArray *)all;
    {
        return [[self modelClass] MR_findAll];
    }
    
-(NSArray *)allWithPredicate:(NSPredicate *)predicate;
    {
        return [[self modelClass] MR_findAllWithPredicate:predicate];
    }
    
-(NSArray *)allSortedBy:(NSArray *)sortDescriptors;
    {
        return [[[self modelClass] MR_findAll] sortedArrayUsingDescriptors:sortDescriptors];
    }
    
-(NSArray *)allWithPredicate:(NSPredicate *)predicate sortedBy:(NSArray *)sortDescriptors;
    {
        return [[[self modelClass] MR_findAllWithPredicate:predicate] sortedArrayUsingDescriptors:sortDescriptors];
    }
    
-(NSManagedObject *)create;
    {
        return [[self modelClass] MR_createEntity];
    }
    @end
