//
//  ChatListViewController.m
//  RongYun
//
//  Created by tlm on 15/12/24.
//  Copyright © 2015年 Genus. All rights reserved.
//

#import "ChatListViewController.h"

@interface ChatListViewController ()

@end

@implementation ChatListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                        @(ConversationType_GROUP)]];
}

-(void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath{
    RCConversationViewController * conversation = [[RCConversationViewController alloc]init];
    conversation.conversationType = model.conversationType;
    conversation.targetId = model.targetId;
    conversation.title = @"不知道";
    [self.navigationController pushViewController:conversation animated:YES];
}

@end
