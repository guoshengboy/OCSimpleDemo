//
//  Person.m
//  Copy与MutableCopy
//
//  Created by cgs on 2017/6/5.
//  Copyright © 2017年 cgs. All rights reserved.
//

#import "Person.h"

@implementation Person



-(instancetype)initWithName:(NSString *)name withAge:(NSInteger)age{
    
    if ((self = [super init])) {
        
        _name = [name copy];
        _age = age;
    }
    return self;
}



/**
 实现copy功能

 @param zone <#zone description#>
 @return <#return value description#>
 */
-(id)copyWithZone:(NSZone *)zone{
    
    id copy = [[[self class] allocWithZone:zone] initWithName:_name withAge:_age];
    return copy;
}


-(NSString *)description{
    
    return [NSString stringWithFormat:@"%@  %ld",_name, _age];
}

@end
