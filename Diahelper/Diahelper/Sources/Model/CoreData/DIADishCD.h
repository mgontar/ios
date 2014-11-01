//
//  DIADishCD.h
//  Diahelper
//
//  Created by Nikita Levintsov on 11/1/14.
//  Copyright (c) 2014 Diahelper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DIADishCD : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * breadUnits;
@property (nonatomic, retain) NSManagedObject *category;
@property (nonatomic, retain) NSSet *products;
@end

@interface DIADishCD (CoreDataGeneratedAccessors)

- (void)addProductsObject:(NSManagedObject *)value;
- (void)removeProductsObject:(NSManagedObject *)value;
- (void)addProducts:(NSSet *)values;
- (void)removeProducts:(NSSet *)values;

@end
