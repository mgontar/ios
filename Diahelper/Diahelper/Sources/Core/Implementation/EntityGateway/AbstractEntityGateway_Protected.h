//
//  AbstractEntityGateway_Protected.h
//  Diahelper
//
//  Created by Nikita Levintsov on 10/31/14.
//  Copyright (c) 2014 Diahelper. All rights reserved.
//

#import "AbstractEntityGateway.h"
#import <CoreData/CoreData.h>
#import "CoreDataGateway+Requests.h"
#define CD_ENTITY_GATEWAY_SINGLETON_INIT(__EntityKey__) \
                                                        \
+ (id)defaultEntityGateway {                            \
    static id instance;                                 \
    static dispatch_once_t once;                        \
        dispatch_once(&once, ^{                         \
            instance = [self new];                      \
        });                                             \
    return instance;                                    \
}                                                       \
                                                        \
- (NSString *)entityName {                              \
    return __EntityKey__;                               \
}                                                       \

@interface AbstractEntityGateway ()

#pragma mark - Internal Fetching

- (id)objectOfType:(NSFetchRequestResultType)type;

- (id)objectWithPredicateString:(NSString *)predicateString
                      arguments:(NSArray *)arguments
                         ofType:(NSFetchRequestResultType)type;

- (NSArray *)objectsWithPredicateString:(NSString *)predicateString
                              arguments:(NSArray *)arguments
                                 ofType:(NSFetchRequestResultType)type;

- (NSArray *)objectsWithPredicateString:(NSString *)predicateString
                              arguments:(NSArray *)arguments
                               sortKeys:(NSArray *)sortKeys
                                 ofType:(NSFetchRequestResultType)type;

@end
