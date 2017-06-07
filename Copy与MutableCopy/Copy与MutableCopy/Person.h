//
//  Person.h
//  Copy与MutableCopy
//
//  Created by cgs on 2017/6/5.
//  Copyright © 2017年 cgs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCopying>


@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

-(instancetype)initWithName:(NSString *)name withAge:(NSInteger)age;



@end
