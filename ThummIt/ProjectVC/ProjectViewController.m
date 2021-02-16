//
//  ProjectViewController.m
//  ThummIt
//
//  Created by 이성준 on 2020/12/22.
//

#import "ProjectViewController.h"
#import "UIImage+Additions.h"
@import Parse;
@interface ProjectViewController ()

@end

@implementation ProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self connectProjectTableController];
}

-(void)viewWillAppear:(BOOL)animated{
    NSUInteger projectsCount = ProjectManager.sharedInstance.fetchProjectsCount;
    
    self.projectTableController.offset = 0;
    if (projectsCount >= 10) {
        self.projectTableController.offset = projectsCount - 10;
    }
    
    self.projectTableController.projects = (NSMutableArray *)[ProjectManager.sharedInstance getRecentProjectsFromCoreDataWithOffset:self.projectTableController.offset];
    [self.tableView reloadData];
}

-(void)connectProjectTableController{
    
    self.projectTableController = [[ProjectTableController alloc] initWithTableView:self.tableView];
    self.projectTableController.projectVC = self;
    
}

@end
