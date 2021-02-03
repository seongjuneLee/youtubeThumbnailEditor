//
//  AccountViewController.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/06.
//

#import "AccountViewController.h"
@import Parse;
@interface AccountViewController ()

@end

@implementation AccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self connectAccountTableController];
    
}

-(void)viewWillAppear:(BOOL)animated{
    self.accountNameLabel.text = PFUser.currentUser.username;
}

-(void)viewDidLayoutSubviews{
    
    
}

-(void)connectAccountTableController{
    self.accountTableController = [[AccountTableController alloc] initWithTableView:self.tableView];
    
    self.accountTableController.accountVC = self;
    [self.accountTableController setAccountVCHeader];
}


@end
