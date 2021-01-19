//
//  ProjectViewController.m
//  ThummIt
//
//  Created by 이성준 on 2020/12/22.
//

#import "ProjectViewController.h"
#import "UIImage+Additions.h"
@interface ProjectViewController ()

@end

@implementation ProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self connectProjectTableController];

}

-(void)viewWillAppear:(BOOL)animated{
    [ProjectManager.sharedInstance setUpSnapShotFromProject];
    self.projectTableController.snapShots = ProjectManager.sharedInstance.projectSnapShots;
    [self.tableView reloadData];
    
}

-(void)connectProjectTableController{
    
    self.projectTableController = [[ProjectTableController alloc] initWithTableView:self.tableView];
    self.projectTableController.navigationController = self.navigationController;
    
}

@end
