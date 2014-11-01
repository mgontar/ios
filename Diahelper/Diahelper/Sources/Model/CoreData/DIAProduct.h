//
//  DIAProduct.h
//  Diahelper
//
//  Created by Nikita Levintsov on 11/1/14.
//  Copyright (c) 2014 Diahelper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DIADishCD;

@interface DIAProduct : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * breadUnits;
@property (nonatomic, retain) NSSet *dishes;
@end

@interface DIAProduct (CoreDataGeneratedAccessors)

- (void)addDishesObject:(DIADishCD *)value;
- (void)removeDishesObject:(DIADishCD *)value;
- (void)addDishes:(NSSet *)values;
- (void)removeDishes:(NSSet *)values;

@end
