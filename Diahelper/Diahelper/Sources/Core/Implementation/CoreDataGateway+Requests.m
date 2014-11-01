//
//  CoreDataGateway+Requests.m
//  CoreDataBase
//
//  Created by Nikita Levintsov on 10/30/14.
//  Copyright (c) 2014 Nikita Levintsov. All rights reserved.
//

#import "CoreDataGateway+Requests.h"

static NSString * const minusString = @"-";

@implementation CoreDataGateway (Requests)
#pragma mark - Getters For Managed Objects

- (id)objectForID:(NSManagedObjectID *)managedObjectID {
    return [[self managedObjectContext] objectWithID:managedObjectID];
}

- (id)objectWithEntityName:(NSString *)name
                    ofType:(NSFetchRequestResultType)type {
    
    return [self objectWithEntityName:name
                      predicateString:nil
                            arguments:nil
                               ofType:type];
}

- (id)objectWithEntityName:(NSString *)name
           predicateString:(NSString *)predicateString
                 arguments:(NSArray *)arguments
                    ofType:(NSFetchRequestResultType)type; {
    
    return [[self performRequest:[self fetchRequestForObjectsWithEntityName:name
                                                            predicateString:predicateString
                                                                  arguments:arguments
                                                                   sortKeys:nil
                                                                      limit:1
                                                                     ofType:type]] lastObject];
}

- (NSArray *)objectsWithEntityName:(NSString *)name
                   predicateString:(NSString *)predicateString
                         arguments:(NSArray *)arguments
                            ofType:(NSFetchRequestResultType)type {
    
    return [self objectsWithEntityName:name
                       predicateString:predicateString
                             arguments:arguments
                              sortKeys:nil
                                ofType:type];
}

- (NSArray *)objectsWithEntityName:(NSString *)name
                   predicateString:(NSString *)predicateString
                         arguments:(NSArray *)arguments
                          sortKeys:(NSArray *)sortKeys
                            ofType:(NSFetchRequestResultType)type {
    
    return [self performRequest:[self fetchRequestForObjectsWithEntityName:name
                                                           predicateString:predicateString
                                                                 arguments:arguments
                                                                  sortKeys:sortKeys
                                                                     limit:0
                                                                    ofType:type]];
}


- (NSArray *)performRequest:(NSFetchRequest *)request {
    NSError *error = nil;
    NSArray *result = [[self managedObjectContext] executeFetchRequest:request error:&error];
    if (error) {
        NSLog(@"Request ERROR: %@", error);
    }
    return result;
}

#pragma mark - Creating Requests

- (NSFetchRequest *)fetchRequestForObjectsWithEntityName:(NSString *)name
                                         predicateString:(NSString *)predicateString
                                               arguments:(NSArray *)arguments
                                            firstSortKey:(NSString *)firstSortKey
                                           secondSortKey:(NSString *)secondSortKey
                                                   limit:(NSUInteger)limit
                                                  ofType:(NSFetchRequestResultType)type {
    
    
    NSArray *sortDescriptorKeys = [NSArray arrayWithObjects:firstSortKey, secondSortKey, nil];
    
    return [self fetchRequestForObjectsWithEntityName:name
                                      predicateString:predicateString
                                            arguments:arguments
                                             sortKeys:sortDescriptorKeys
                                                limit:limit
                                               ofType:type];
}

- (NSFetchRequest *)fetchRequestForObjectsWithEntityName:(NSString *)name
                                         predicateString:(NSString *)predicateString
                                               arguments:(NSArray *)arguments
                                                sortKeys:(NSArray *)sortKeys
                                                   limit:(NSUInteger)limit
                                                  ofType:(NSFetchRequestResultType)type {
#warning - check name, what's if it's empty
    NSFetchRequest *request = [NSFetchRequest new];
    request.entity = [self entityDescriptionWithName:name];
    
    if (predicateString != nil) {
        request.predicate = [NSPredicate predicateWithFormat:predicateString argumentArray:arguments];
    }
    
    if (sortKeys) {
        BOOL ascending = YES;
        NSMutableArray *mutableSortDescriptors = [NSMutableArray arrayWithCapacity:sortKeys.count];
        for (NSString *sortKeyEnumerator in sortKeys) {
            NSString * sortKey = [NSString stringWithString:sortKeyEnumerator];
            if (sortKey.length > 1 && [[sortKey substringToIndex:1] isEqualToString:minusString]) {
                sortKey = [sortKey substringFromIndex:1];
                ascending = NO;
            }
            else {
                ascending = YES;
            }
            [mutableSortDescriptors addObject:[NSSortDescriptor sortDescriptorWithKey:sortKey ascending:ascending]];
        }
        request.sortDescriptors = [NSArray arrayWithArray:mutableSortDescriptors];
        mutableSortDescriptors = nil;
    }
    
    request.fetchLimit = limit;
    request.resultType = type;
    
    return request;
}

#pragma mark - Creating Managed Objects

- (id)createObjectWithEntityName:(NSString *)entityName {
    return [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:[self managedObjectContext]];
}

- (NSEntityDescription *)entityDescriptionWithName:(NSString *)entityName {
    return [NSEntityDescription entityForName:entityName inManagedObjectContext:[self managedObjectContext]];
}

#pragma mark - Deleting Managed Objects

- (void)deleteObject:(NSManagedObject *)object {
    [[self managedObjectContext] deleteObject:object];
}

@end
