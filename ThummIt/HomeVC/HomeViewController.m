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
#import "GuideLine.h"
#import "DashedGuideLine.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:NSBundle.mainBundle] forCellReuseIdentifier:@"HomeTableViewCell"];
    [self connectHomeTableController];
    GuideLine *guideLine = [[GuideLine alloc] init];
    guideLine.frameWidth = self.view.frameWidth;
    guideLine.center = self.view.center;
    guideLine.frameY = 100;
    [self.view addSubview:guideLine];
    NSLog(@"guideLine frame %@",NSStringFromCGRect(guideLine.frame));
    
    DashedGuideLine *dashed = [[DashedGuideLine alloc] initWithFrame:CGRectMake(0, 250, self.view.frameWidth, 2)];
    dashed.frameWidth = self.view.frameWidth;
    dashed.center = CGPointMake(self.view.center.x, self.view.centerY - 10);
    dashed.frameY = 150;
    [dashed makeViewDashed];
    [self.view addSubview:dashed];


    NSLog(@"dashed frame %@",NSStringFromCGRect(dashed.frame));

}

-(void)connectHomeTableController{
    
    self.homeTableController = [[HomeTableController alloc] initWithTableView:self.tableView];
    self.homeTableController.delegate = self;

}

@end
