//
//  ViewController.m
//  Block
//
//  Created by cgs on 2017/6/9.
//  Copyright © 2017年 cgs. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <CoreFoundation/CFRunLoop.h>

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self asyncQueueTest];
//    [self syncAndSyncTest];
//    [self asyncAndSyncTest];
//      [self syncQueueTest];
    
//    [self barrierTest];
    
    [self timeGCD];
}


/**
 GCD time
 */
-(void)timeGCD{
    
    //NSEC_PER_SEC 纳秒
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 10.0 * NSEC_PER_SEC);
    //不会阻塞其他任务，只是等10秒再在主线程执行任务
    dispatch_after(time, dispatch_get_main_queue(), ^{
       
        NSLog(@"111111");
    });
    
    NSLog(@"112222222");
    
}


/**
 dispatch_barrier_async(<#dispatch_queue_t  _Nonnull queue#>, <#^(void)block#>)
 dispatch_barrier_sync(<#dispatch_queue_t  _Nonnull queue#>, <#^(void)block#>)
 栅栏是当执行异步并发时，在并行队列中栅栏必须要单独执行，不能与其他快并行。这只针对并行队列有意义，因为串行队列是顺序执行的
 */
-(void)barrierTest{
    
    __block NSString *str = @"";
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        str = @"000000";
        NSLog(@"\n0000---->%@", str);
    });
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        str = @"222222";
        NSLog(@"\n2222---->%@", str);
    });

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        str = @"333333";
        NSLog(@"\n3333---->%@", str);
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        str = @"444444";
        NSLog(@"\n4444---->%@", str);
    });
    
    dispatch_barrier_async(dispatch_get_global_queue(0, 0), ^{
        
        str = @"111111";
        NSLog(@"\n1111---->%@", str);
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        str = @"555555";
        NSLog(@"\n5555---->%@", str);
    });
    
    
}


-(void)asyncQueueTest{
    
    
    
    char *asyncStr = "asycnQ";
    dispatch_queue_t asyncQ = dispatch_queue_create(asyncStr, DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(asyncQ, ^{
        
        NSLog(@"异步并行队列  线程------>%@  数字------>%d", [NSThread currentThread], 1);
    });
    
    dispatch_async(asyncQ, ^{
        
        NSLog(@"异步并行队列  线程------>%@  数字------>%d", [NSThread currentThread], 2);
    });
    
    dispatch_sync(asyncQ, ^{
        
        NSLog(@"同步并行队列  线程------>%@  数字------>%d", [NSThread currentThread], 3);
    });
    
    dispatch_async(asyncQ, ^{
        
        NSLog(@"异步并行队列  线程------>%@  数字------>%d", [NSThread currentThread], 4);
    });
    
    dispatch_async(asyncQ, ^{
        
        NSLog(@"异步并行队列  线程------>%@  数字------>%d", [NSThread currentThread], 5);
    });
    
//
//
//    for (int i = 0; i < 10; i++) {
//        
//        if (i % 2) {//奇数
//            
//            dispatch_async(asyncQ, ^{
//                
//                NSLog(@"异步并行队列  线程------>%@  数字------>%d", [NSThread currentThread], i);
//            });
//            
//        }else{//偶数
//            
//            dispatch_sync(asyncQ, ^{
//                
//                NSLog(@"同步并行队列  线程------>%@  数字------>%d", [NSThread currentThread], i);
//            });
//        }
//    }
}



/**
 同步队列：按把任务丢进队列的顺序，同步执行（无论是同步派发还是异步派发：只是影响在哪个线程执行这个任务）。
 */
-(void)syncQueueTest{
    
    char *syncStr = "sycnQ";
    dispatch_queue_t syncQ = dispatch_queue_create(syncStr, DISPATCH_QUEUE_SERIAL);
    
    
    for (int i = 0; i < 10; i++) {
        
        if (i % 2) {//奇数
            
            dispatch_async(syncQ, ^{
                
                NSLog(@"异步串行队列  线程------>%@  数字------>%d", [NSThread currentThread], i);
            });
            
        }else{//偶数
            
            dispatch_sync(syncQ, ^{
                
                NSLog(@"同步串行队列  线程------>%@  数字------>%d", [NSThread currentThread], i);
            });
        }
    }
}


/**
 异步派发test
 */
-(void)asyncAndSyncTest{
    
    NSLog(@"startstartstartstartstartstartstart");
    
    char *async = "asycnQ";
    dispatch_queue_t asyncQ = dispatch_queue_create(async, DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(asyncQ, ^{
        
        NSLog(@"异步并行队列  当前线程------>%@", [NSThread currentThread]);
    });
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
       
        NSLog(@"异步主队列  当前线程------>%@", [NSThread currentThread]);
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSLog(@"异步全局队列  当前线程------>%@", [NSThread currentThread]);
    });
    
    
    char *sync = "sycnQ";
    dispatch_queue_t syncQ = dispatch_queue_create(sync, DISPATCH_QUEUE_SERIAL);
    dispatch_async(syncQ, ^{
        
        NSLog(@"异步串行队列  当前线程------>%@", [NSThread currentThread]);
    });
    
    NSLog(@"endendendendendendendendend");
}


/**
 同步派发test
 */
-(void)syncAndSyncTest{
    
    char *sync = "sycnQ";
    dispatch_queue_t syncQ = dispatch_queue_create(sync, DISPATCH_QUEUE_SERIAL);
    dispatch_sync(syncQ, ^{
        
        NSLog(@"同步串行队列  当前线程------>%@", [NSThread currentThread]);
    });
    
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        
        NSLog(@"同步并行队列  当前线程------>%@", [NSThread currentThread]);
    });
    
    
    //这个会造成线程阻塞，因为dispatch_sync要走完block的代码  而主线程要等待block走完 才会走  所以同步主队列会造成阻塞crash
    //    dispatch_sync(dispatch_get_main_queue(), ^{
    //
    //
    //    });
    
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSLog(@"aaa当前线程------>%@", [NSThread currentThread]);
        char *sync1 = "sycnQ1";
        dispatch_queue_t syncQ1 = dispatch_queue_create(sync1, DISPATCH_QUEUE_CONCURRENT);
        dispatch_sync(syncQ1, ^{
            
            NSLog(@"bbb当前线程------>%@", [NSThread currentThread]);
        });
    });
}


@end
