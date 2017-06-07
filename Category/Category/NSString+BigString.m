//
//  NSString+BigString.m
//  Category
//
//  Created by cgs on 2017/6/6.
//  Copyright © 2017年 cgs. All rights reserved.
//

#import "NSString+BigString.h"
#import <objc/runtime.h>

static const char *kIsRight = "kIsRightKey";

@implementation NSString (BigString)


-(void)setIsRight:(NSString *)isRight{
    
    objc_setAssociatedObject(self, kIsRight, isRight, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)isRight{
    
    return  objc_getAssociatedObject(self, kIsRight);
}


+(NSString *)getBigString{
    
    return @"100000000";
}


@end
