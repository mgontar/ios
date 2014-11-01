//
//  CoreDataGateway+Requests.h
//  CoreDataBase
//
//  Created by Nikita Levintsov on 10/30/14.
//  Copyright (c) 2014 Nikita Levintsov. All rights reserved.
//

#import "CoreDataGateway.h"

@interface CoreDataGateway (Requests)
#pragma mark - Getters For Managed Objects

- (id)objectForID:(NSManagedObjectID *)objectID;

- (id)objectWithEntityName:(NSString *)name
                    ofType:(NSFetchRequestResultType)type;

- (id)objectWithEntityName:(NSString *)name
           predicateString:(NSString *)predicateString
                 arguments:(NSArray *)arguments
                    ofType:(NSFetchRequestResultType)type;

- (NSArray *)objectsWithEntityName:(NSString *)name
                   predicateString:(NSString *)predicateString
                         arguments:(NSArray *)arguments
                            ofType:(NSFetchRequestResultType)type;

- (NSArray *)objectsWithEntityName:(NSString *)name
                   predicateString:(NSString *)predicateString
                         arguments:(NSArray *)arguments
                          sortKeys:(NSArray *)sortKeys
                            ofType:(NSFetchRequestResultType)type;

- (NSArray *)performRequest:(NSFetchRequest *)request;

#pragma mark - Creatng Requests

- (NSFetchRequest *)fetchRequestForObjectsWithEntityName:(NSString *)name
                                         predicateString:(NSString *)predicateString
                                               arguments:(NSArray *)arguments
                                                sortKeys:(NSArray *)sortKeys
                                                   limit:(NSUInteger)limit
                                                  ofType:(NSFetchRequestResultType)type;

#pragma mark - Creating Managed Objects

- (id)createObjectWithEntityName:(NSString *)entityName;
- (NSEntityDescription *)entityDescriptionWithName:(NSString *)entityName;

#pragma mark - Deleting Managed Objects

- (void)deleteObject:(NSManagedObject *)object;

@end
