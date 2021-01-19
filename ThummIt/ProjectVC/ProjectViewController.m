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
    
    NSUInteger projectsCount = ProjectManager.sharedInstance.fetchProjectsCount;
    
    if (self.originalCount != projectsCount) {
        self.projectTableController.offset = 0;
        if (projectsCount >= 10) {
            self.projectTableController.offset = projectsCount - 10;
        }
        [ProjectManager.sharedInstance loadProjectSnapshots:self.projectTableController.offset];
        self.projectTableController.snapShots = ProjectManager.sharedInstance.projectSnapShots;
        [self.tableView reloadData];
    }
    
    self.originalCount = projectsCount;
    
}

-(void)connectProjectTableController{
    
    self.projectTableController = [[ProjectTableController alloc] initWithTableView:self.tableView];
    self.projectTableController.navigationController = self.navigationController;
    self.projectTableController.offset = self.offset;

}

@end
