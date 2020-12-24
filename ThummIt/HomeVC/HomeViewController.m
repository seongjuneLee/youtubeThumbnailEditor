//
//  ViewController.m
//  Thummit
//
//  Created by 이성준 on 2020/12/12.
//

#import "HomeViewController.h"
#import "HomeViewController+TableControllerDelegate.h"
#import "Project.h"
#import "ProjectManager.h"
#import "SaveManager.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:NSBundle.mainBundle] forCellReuseIdentifier:@"HomeTableViewCell"];
    
    [self connectHomeTableController];

}

-(void)connectHomeTableController{
    
    self.homeTableController = [[HomeTableController alloc] initWithTableView:self.tableView];
    self.homeTableController.delegate = self;

}


- (IBAction)testContinue:(id)sender {
    
    Project *project = [ProjectManager.sharedInstance getAllProjectsFromCoreData].firstObject;
    NSLog(@"project projectID %@",project.projectID);
    Template *selectedTemplate;
    
    for (Template *template in TemplateManager.sharedInstance.templates) {
        if ([project.selectedTemplateName isEqualToString:template.templateName]) {
            selectedTemplate = template;
        }
    }
    SaveManager.sharedInstance.currentProject = project;
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        NSLog(@"itemitemitem baseView %@",NSStringFromCGRect(item.baseView.frame));
        NSLog(@"item %@",item);
    }
    
    UIStoryboard *editing = [UIStoryboard storyboardWithName:@"Editing" bundle:NSBundle.mainBundle];
    EditingViewController *editingVC = (EditingViewController *)[editing instantiateViewControllerWithIdentifier:@"EditingViewController"];
    //        editingVC.selectedTemplate = selectedTemplate;
    [self.navigationController pushViewController:editingVC animated:true];
//    [SaveManager.sharedInstance save];
    
}
@end
