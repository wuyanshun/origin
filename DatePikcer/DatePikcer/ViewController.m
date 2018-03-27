//
//  ViewController.m
//  DatePikcer
//
//  Created by 吴延顺 on 15/10/18.
//  Copyright (c) 2015年 吴延顺. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIDatePicker        * datePicker;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"这是一个小问题");
    
    NSLog(@"1");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"4");
    });
    NSLog(@"3");
    
    // 直接创建线程，需要手动释放
    dispatch_queue_t queue = dispatch_queue_create("com.GCD.testExample", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{NSLog(@"com.GCD.testExample");});

    void (^testBlock)(int) = ^(int number){
        NSLog(@"我只是想试一下而已%d",number);
    };
    
    testBlock(2);
    // Do any additional setup after loading the view, typically from a nib.MJPhotoBrowser
    NSDate *currentTime  = [NSDate date];
    NSDateFormatter * dateFormatter =[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yy-MM-dd"];
    datePicker = [[UIDatePicker alloc] init];
    datePicker.frame    = CGRectMake(0, 100, 250, 150);

    [datePicker   setTimeZone:[NSTimeZone defaultTimeZone]];
     [datePicker setTimeZone:[NSTimeZone timeZoneWithName:@"GMT+8"]];
    // 设置当前显示
    [datePicker setDate:currentTime animated:YES];
    // 设置显示最大时间（
//    [datePicker setMaximumDate:currentTime];
    //  设置显示最小的时间
    [datePicker setMinimumDate:currentTime];
    // 显示模式
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    // 回调的方法由于UIDatePicker 是UIControl的子类 ,可以在UIControl类的通知结构中挂接一个委托
    [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
   // [self.view addSubview:datePicker];
    
    
    
   
}


-(void)datePickerValueChanged:(id)sender
{
//    　　NSDate *selected = [datePicker date]; NSLog(@"date: %@", selected);
    NSDate *select  = [datePicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateAndTime = [dateFormatter stringFromDate:select];
    NSLog(@"%@",dateAndTime) ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
