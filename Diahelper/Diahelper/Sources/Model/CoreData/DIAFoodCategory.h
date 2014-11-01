//
//  DIAFoodCategory.h
//  Diahelper
//
//  Created by Nikita Levintsov on 11/1/14.
//  Copyright (c) 2014 Diahelper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DIADishCD;

@interface DIAFoodCategory : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *dishes;
@end

@interface DIAFoodCategory (CoreDataGeneratedAccessors)

- (void)addDishesObject:(DIADishCD *)value;
- (void)removeDishesObject:(DIADishCD *)value;
- (void)addDishes:(NSSet *)values;
- (void)removeDishes:(NSSet *)values;

@end
