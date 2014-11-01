//
//  AbstractEntityGateway.m
//  CoreDataBase
//
//  Created by Nikita Levintsov on 10/31/14.
//  Copyright (c) 2014 Nikita Levintsov. All rights reserved.
//

#import "AbstractEntityGateway.h"
#import "AbstractEntityGateway_Protected.h"
@interface AbstractEntityGateway()
@property (nonatomic, strong) NSString * entityName;

@end

@implementation AbstractEntityGateway
@synthesize entityDescription = _entityDescription;
#pragma mark - Creating

- (id)createObject {
    id object = [[CoreDataGateway defaultGateway] createObjectWithEntityName:self.entityName];
    [self applyDefaultSettingsForObject:object];
    //[self postDidChangeNotification];
    return object;
}

- (void)applyDefaultSettingsForObject:(id)object {
    
    NSAttributeDescription *attribute = nil;
    NSDictionary *attributesByName = self.entityDescription.attributesByName;
    
    for (NSString *name in self.entityDescription.attributesByName) {
        attribute = attributesByName[name];
        if (attribute.defaultValue) {
            [object setValue:attribute.defaultValue forKey:name];
        }
    }
}

- (void)refreshObject:(id)object {
    [[[CoreDataGateway defaultGateway] managedObjectContext] refreshObject:object mergeChanges:YES];
}

- (NSEntityDescription *)entityDescription {
    if (!_entityDescription) {
        _entityDescription = [[CoreDataGateway defaultGateway] entityDescriptionWithName:self.entityName];
    }
    return _entityDescription;
}

#pragma mark - Internal Fetching

- (id)objectOfType:(NSFetchRequestResultType)type {
    return [self objectWithPredicateString:nil
                                 arguments:nil
                                    ofType:type];
}

- (id)objectWithPredicateString:(NSString *)predicateString
                      arguments:(NSArray *)arguments
                         ofType:(NSFetchRequestResultType)type {
    
    return [[CoreDataGateway defaultGateway] objectWithEntityName:self.entityName
                                   predicateString:predicateString
                                         arguments:arguments
                                            ofType:type];
}

- (NSArray *)objectsOfType:(NSFetchRequestResultType)type {
    return [self objectsWithPredicateString:nil
                                  arguments:nil
                                     ofType:type];
    
}

- (NSArray *)objectsWithPredicateString:(NSString *)predicateString
                              arguments:(NSArray *)arguments
                                 ofType:(NSFetchRequestResultType)type {
    
    return [self objectsWithPredicateString:predicateString
                                  arguments:arguments
                                   sortKeys:nil
                                     ofType:type];
}

- (NSArray *)objectsWithPredicateString:(NSString *)predicateString
                              arguments:(NSArray *)arguments
                               sortKeys:(NSArray *)sortKeys
                                 ofType:(NSFetchRequestResultType)type {
    
    return [[CoreDataGateway defaultGateway] objectsWithEntityName:self.entityName
                                    predicateString:predicateString
                                          arguments:arguments
                                           sortKeys:sortKeys
                                             ofType:type];
}




#pragma mark - Fetching

- (id)anyObject {
    return [self objectOfType:NSManagedObjectResultType];
}

- (id)objectWithPredicateString:(NSString *)predicateString
                      arguments:(NSArray *)arguments {
    
    return [[CoreDataGateway defaultGateway] objectWithEntityName:self.entityName
                                   predicateString:predicateString
                                         arguments:arguments
                                            ofType:NSManagedObjectResultType];
}

- (NSNumber *)objectsCount {
    return [[self objectsOfType:NSManagedObjectResultType] lastObject];
}

- (NSArray *)objects {
    return [self objectsOfType:NSManagedObjectResultType];
}


- (NSArray *)objectsWithPredicateString:(NSString *)predicateString
                              arguments:(NSArray *)arguments {
    return [[CoreDataGateway defaultGateway] objectsWithEntityName:self.entityName
                                    predicateString:predicateString
                                          arguments:arguments
                                           sortKeys:nil
                                             ofType:NSManagedObjectResultType];
}

- (NSArray *)objectsWithPredicateString:(NSString *)predicateString
                              arguments:(NSArray *)arguments
                               sortKeys:(NSArray *)sortKeys {
    
    return [[CoreDataGateway defaultGateway] objectsWithEntityName:self.entityName
                                    predicateString:predicateString
                                          arguments:arguments
                                           sortKeys:sortKeys
                                             ofType:NSManagedObjectResultType];
}

#pragma mark - Saving

- (id)saveObject:(id)object error:(NSError **)anError {
    
    NSError *error = nil;
    id returningObject = object;
    
    if (![object isKindOfClass:[NSManagedObject class]]) {
        //todo
        //implement for not CD objects
        return nil;
    }
    
    BOOL success = [[CoreDataGateway defaultGateway] saveContext:&error];
    
    if (returningObject != object && success) {
    }
    
    return success ? returningObject : nil;
}

- (NSArray *)saveObjects:(id)objects error:(NSError **)anError {
    
    NSError *error = nil;
    
    id savedObjects = objects;
    
    if (![[objects anyObject] isKindOfClass:[NSManagedObject class]]) {
       //todo
        //implement for not CD objects
        return nil;
    }
    
    BOOL success = [[CoreDataGateway defaultGateway] saveContext:&error];
    
    if (savedObjects != objects && success) {
        //todo notify context
    }
    
    return success ? savedObjects : nil;
}

#pragma mark - Deleting

- (void)deleteObjectWithoutSaving:(id)object; {
    if ([object isKindOfClass:[NSManagedObject class]]) {
        [[CoreDataGateway defaultGateway] deleteObject:object];
    }
}

- (void)deleteObject:(id)object {
    if (object) {
        [self deleteObjectWithoutSaving:object];
        [[CoreDataGateway defaultGateway] saveContext];
    }
}

- (void)deleteObjects:(id <NSFastEnumeration>)objects {
    for (id object in objects) {
        [self deleteObjectWithoutSaving:object];
    }
    [[CoreDataGateway defaultGateway] saveContext];
}


@end
