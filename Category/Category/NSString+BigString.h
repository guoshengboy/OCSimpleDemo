//
//  NSString+BigString.h
//  Category
//
//  Created by cgs on 2017/6/6.
//  Copyright © 2017年 cgs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BigString)


/**
 分类中定义属性不会自动生成getter和setter方法  可以通过关联来实现(不推荐在分类加属性)
 */
@property (nonatomic, copy) NSString *isRight;


/**
 分类可以加方法
 */
+(NSString *)getBigString;



@end
