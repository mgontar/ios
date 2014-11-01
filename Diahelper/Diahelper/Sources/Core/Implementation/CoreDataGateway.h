//
//  CoreDataGateway.h
//  CoreDataBase
//
//  Created by Nikita Levintsov on 10/30/14.
//  Copyright (c) 2014 Nikita Levintsov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataGateway : NSObject
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) NSString * databaseName;

+ (CoreDataGateway *)defaultGateway;
- (void)saveContext;
- (BOOL)saveContext:(NSError **)error;


@end
