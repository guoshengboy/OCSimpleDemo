//
//  Person.h
//  Block
//
//  Created by cgs on 2017/6/9.
//  Copyright © 2017年 cgs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSInteger(^haveFinishWorkBlock)();

@interface Person : NSObject


-(void)startWork:(haveFinishWorkBlock)finishBlcok;



@end
