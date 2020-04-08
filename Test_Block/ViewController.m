//
//  ViewController.m
//  Test_Block
//
//  Created by 张影 on 2020/4/8.
//  Copyright © 2020 张影. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//全局变量
int global_var = 6;

//静态全局变量
static int static_global_var = 6;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#pragma mark - Block截获变量
    
    //默认局部变量（默认为auto类型）
    //[self blockLocalVariablesMethod];
    
    //局部变量对象类型
    //[self blockLocalVariablesObjcMethod];

    //静态局部变量（static类型）
    //[self blockStaticLocalVariablesMethod];
    
    //全局变量
    //[self blockVariablesMethod];
    
    //全局静态变量
    //[self blockStaticVariablesMethod];
    
#pragma mark - __block修饰符
    
    //局部变量__block修饰符
    [self blockLocalMethod];
    
    
}

#pragma mark - 局部变量__block修饰符
- (void)blockLocalMethod {
    __block int multplier = 6;
    int(^Block)(int) = ^int(int num) {
        return num * multplier;
    };
    
    multplier = 4;
    NSLog(@"result is %d", Block(2));
}











#pragma mark - 默认局部变量（默认为auto类型）
- (void)blockLocalVariablesMethod {
    int multplier = 6;
    int(^Block)(int) = ^int(int num) {
        return num * multplier;
    };
    
    multplier = 4;
    NSLog(@"result is %d", Block(2));
}
#pragma mark - 局部变量对象类型
- (void)blockLocalVariablesObjcMethod {
    
    //对象类型的局部变量
    NSMutableArray *muArr = [NSMutableArray new];
    
    NSMutableArray *(^Block)(NSString* str) = ^NSMutableArray *(NSString* str) {
        [muArr addObject:str];
        return muArr;
    };
    
    [muArr addObject:@"2"];
    NSLog(@"result is %@", Block(@"1"));
}
#pragma mark - 静态局部变量（static类型）
- (void)blockStaticLocalVariablesMethod {
    
    //静态局部基本类型数据
    static int multplier = 6;
    int(^Block)(int) = ^int(int num) {
        return num * multplier;
    };
    
    multplier = 4;
    NSLog(@"result is %d", Block(2));
    
    //静态局部对象类型
    static NSMutableArray *muArr;
    muArr = [NSMutableArray new];
    
    NSMutableArray *(^ObjcBlock)(NSString* str) = ^NSMutableArray *(NSString* str) {
        [muArr addObject:str];
        return muArr;
    };
    
    [muArr addObject:@"5"];
    NSLog(@"muArr is %@", ObjcBlock(@"6"));
}
#pragma mark - 全局变量
- (void)blockVariablesMethod {

    int(^Block)(int) = ^int(int num) {
        return num * global_var;
    };
    
    global_var = 4;
    NSLog(@"result is %d", Block(2));
    
}
#pragma mark - 全局静态变量
- (void)blockStaticVariablesMethod {

    int(^Block)(int) = ^int(int num) {
        return num * static_global_var;
    };
    
    static_global_var = 4;
    NSLog(@"result is %d", Block(2));
    
}
@end
