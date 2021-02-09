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
    self.projectTableController.snapShots = [NSMutableArray array];

}

-(void)viewWillAppear:(BOOL)animated{
    
    NSUInteger projectsCount = ProjectManager.sharedInstance.fetchProjectsCount;
    
    if (self.originalCount != projectsCount) {
        self.projectTableController.offset = 0;
        if (projectsCount >= 10) {
            self.projectTableController.offset = projectsCount - 10;
        }
        NSArray *projects = [ProjectManager.sharedInstance getRecentTenProjectsFromCoreDataWithOffset:self.projectTableController.offset];
        for (Project *project in projects) {
            NSLog(@"project.previewImage %@",project.previewImage);
            NSLog(@"project item count %ld",project.items.count);
            [self.projectTableController.snapShots addObject:project.previewImage];
        }
        [self.tableView reloadData];
    }
    
    self.originalCount = projectsCount;
    
}

-(void)connectProjectTableController{
    
    self.projectTableController = [[ProjectTableController alloc] initWithTableView:self.tableView];
    self.projectTableController.projectVC = self;

}

@end
