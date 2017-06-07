//
//  ViewController.m
//  Copy与MutableCopy
//
//  Created by cgs on 2017/6/5.
//  Copyright © 2017年 cgs. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+OtherMethod.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //实现copy功能
    Person *p = [[Person alloc] initWithName:@"cgs" withAge:24];
    Person *p1 = [p copy];
    p1.name = @"dawdaw";
    NSLog(@"\np==%@\np1==%@",[p description], [p1 description]);
    
    
    //copy返回的都是不可变的：[mutableArray copy]  mutableCopy返回的是可变的：[array mutableCopy]
    
    //浅拷贝：只是拷贝指针，不拷贝内容（一般都是浅拷贝）
    NSArray *array = [NSArray arrayWithObjects:p, nil];
    NSArray *array1 = [array copy];
    NSLog(@"array==%@\n array1==%@",array, array1);
    
    //深拷贝：拷贝内容，相当于重新创建对象，只是值一样，但内存地址不一样(一般都要重写深拷贝的方法)
    NSArray *array2 = [array deepCopy];
    NSLog(@"array2==%@",array2);
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
