//
//  Person.m
//  Block
//
//  Created by cgs on 2017/6/9.
//  Copyright © 2017年 cgs. All rights reserved.
//

#import "Person.h"

@implementation Person



-(void)startWork:(haveFinishWorkBlock)finishBlcok{
    
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [weakSelf test:@"0000"];
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        [weakSelf test:@"1111"];
    });
    
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        
//       [weakSelf test:@"2222"];
//    });    
//     
    
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        
        [weakSelf test:@"3333"];
    });
}

-(void)test:(NSString *)testStr{
    
    NSLog(@"%@",testStr);
}


@end
