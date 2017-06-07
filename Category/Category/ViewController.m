//
//  ViewController.m
//  Category
//
//  Created by cgs on 2017/6/6.
//  Copyright © 2017年 cgs. All rights reserved.
//

#import "ViewController.h"
#import "NSString+BigString.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //调用分类添加的方法
    NSString *str = [NSString getBigString];
    NSLog(@"%@",str);
    
    //分类添加属性 使用关联实现
    str.isRight = @"对的";
    NSLog(@"%@", str.isRight);
    

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
