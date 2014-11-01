//
//  DIACoreDataPlayground.m
//  Diahelper
//
//  Created by Nikita Levintsov on 10/31/14.
//  Copyright (c) 2014 Diahelper. All rights reserved.
//

#import "DIACoreDataPlayground.h"

//look on EntityGatewayProtocol.h to check available operations
@implementation DIACoreDataPlayground

- (void)howToUse {
    //create objects
    DIAFoodCategory * fc = [[DIAFoodCategoryGateway defaultEntityGateway] createObject];
    fc.name = @"Borshch";
    NSError * error = nil;
    [[DIAFoodCategoryGateway defaultEntityGateway] saveObject:fc error:&error];
    
    //get all objects
    NSArray * allobjects = [[DIAFoodCategoryGateway defaultEntityGateway] objects];
    NSLog(@"%ld", allobjects.count);
    
    //save several objects
    DIAFoodCategory * fc2 = [[DIAFoodCategoryGateway defaultEntityGateway] createObject];
    fc2.name = @"Soup";
    [[DIAFoodCategoryGateway defaultEntityGateway] saveObjects:[NSSet setWithObjects:fc, fc2, nil] error:&error];
    
    //delete object
    DIAFoodCategory * fc3 = [[DIAFoodCategoryGateway defaultEntityGateway] anyObject];
    [[DIAFoodCategoryGateway defaultEntityGateway] deleteObject:fc3];
    
}


@end
