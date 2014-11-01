//
//  EntityGatewayProtocol.h
//  CoreDataBase
//
//  Created by Nikita Levintsov on 10/31/14.
//  Copyright (c) 2014 Nikita Levintsov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EntityGatewayProtocol <NSObject>
@required

- (id)anyObject;
- (NSArray *)objects;
//- (NSNumber *)objectsCount;

- (id)createObject;

- (id)saveObject:(id)object error:(NSError **)anError;
- (NSArray *)saveObjects:(id)objects error:(NSError **)anError;

- (void)deleteObject:(id)object;
- (void)deleteObjectWithoutSaving:(id)object;
- (void)deleteObjects:(id <NSFastEnumeration>)objects;
@end
