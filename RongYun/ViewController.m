//
//  ViewController.m
//  RongYun
//
//  Created by tlm on 15/12/24.
//  Copyright © 2015年 Genus. All rights reserved.
//
#define kAppKey @"0vnjpoadn2moz"
#define kToken @"2oY//VA5sQVxTVQXj93NSeiIaX0W8kNc218wroJUfcrl2TzXv/SAM2Dy1RudyX1ybAN0QXABcxoXxEES74OFRw=="
#import "ViewController.h"
#import <RongIMKit/RongIMKit.h>
#import "ChatViewController.h"
#import "ChatListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[RCIM sharedRCIM]initWithAppKey:kAppKey];
    
    [[RCIM sharedRCIM]connectWithToken:kToken success:^(NSString *userId) {
        NSLog(@"userId = %@",userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"status = %ld",status);
    } tokenIncorrect:^{
        NSLog(@"tokenIncorrect");
    }];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"tap" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(20, 50, 40, 50);
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"tap" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(tap2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    btn2.frame = CGRectMake(20, 100, 40, 50);
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}


- (void)tap2{
    ChatListViewController * chatList = [[ChatListViewController alloc]init];
    [self.navigationController pushViewController:chatList animated:YES];
}

- (void)tap:(id)sender {
    RCConversationViewController * chat = [[RCConversationViewController alloc]init] ;
    chat.conversationType = ConversationType_GROUP;
    chat.targetId = @"";
    chat.title = @"new";
    [self.navigationController pushViewController:chat animated:YES];
}


@end
