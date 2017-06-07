//
//  NSArray+OtherMethod.m
//  Copy与MutableCopy
//
//  Created by cgs on 2017/6/5.
//  Copyright © 2017年 cgs. All rights reserved.
//

#import "NSArray+OtherMethod.h"
#import "Person.h"

@implementation NSArray (OtherMethod)



/**
 深拷贝
 
 @return <#return value description#>
 */
-(NSArray *)deepCopy{
    
    Person *p1;
    for (Person * p in self) {
        
        p1 = [p copy];
    }
    return [[NSArray alloc] initWithObjects:p1, nil];
}

@end
