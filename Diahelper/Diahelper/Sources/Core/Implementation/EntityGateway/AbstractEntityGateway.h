//
//  AbstractEntityGateway.h
//  CoreDataBase
//
//  Created by Nikita Levintsov on 10/31/14.
//  Copyright (c) 2014 Nikita Levintsov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "EntityGatewayProtocol.h"
#import "CoreDataGateway+Requests.h"

@interface AbstractEntityGateway : NSObject <EntityGatewayProtocol>

@property (nonatomic, strong, readonly) NSEntityDescription * entityDescription;
@property (nonatomic, strong, readonly) NSString * entityName;

- (id)objectWithPredicateString:(NSString *)predicateString arguments:(NSArray *)arguments;

- (NSArray *)objectsWithPredicateString:(NSString *)predicateString arguments:(NSArray *)arguments;

- (NSArray *)objectsWithPredicateString:(NSString *)predicateString
                              arguments:(NSArray *)arguments
                               sortKeys:(NSArray *)sortKeys;


@end

@interface AbstractEntityGateway ( Abstract )

+ (id)defaultEntityGateway;

- (NSString *)entityName;

@end
