//
//  ProjectTableController.m
//  ThummIt
//
//  Created by 이성준 on 2020/12/22.
//

#import "ProjectTableController.h"
#import "EditingViewController.h"
#import "ProjectManager.h"
#import "SaveManager.h"
#import "ProjectTableViewCell.h"
#import <Toast/Toast.h>
@implementation ProjectTableController

-(instancetype)init{ 
    
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(id)initWithTableView:(UITableView *)tableView{
    
    self = [super init]; 
    if (self) {
        self.tableView = tableView;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView registerNib:[UINib nibWithNibName:@"ProjectTableViewCell" bundle:NSBundle.mainBundle] forCellReuseIdentifier:@"ProjectTableViewCell"];
    }
    return self;
    
}

#pragma mark - 테이블 뷰 데이터 소스

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.snapShots.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ProjectTableViewCell *cell = (ProjectTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ProjectTableViewCell" forIndexPath:indexPath];
    UIImage *snapShot = self.snapShots[indexPath.row];
    cell.backgroundImageView.image = snapShot;
    BOOL lastItemReached = [snapShot isEqual:self.snapShots.lastObject];
    if (lastItemReached && indexPath.row == [self.snapShots count] - 1 && self.offset != 0)
    {
        if (self.offset < 10) {
            self.offset = 0;
        } else {
            self.offset -= 10;
        }
        [self loadMoreWithOffset:self.offset];
    }

    return cell;
}

-(void)loadMoreWithOffset:(NSUInteger)offset{
    
    [self.projectVC.view makeToastActivity:CSToastPositionCenter];
    NSUInteger beforeDataCounts = self.snapShots.count;
    NSMutableArray *indexPathsToReload = [NSMutableArray new];
    [self.snapShots addObjectsFromArray:[ProjectManager.sharedInstance loadProjectSnapshots:offset]];
    for (NSUInteger i = beforeDataCounts; i < self.snapShots.count - beforeDataCounts; i++) {
        [indexPathsToReload addObject:[NSIndexPath indexPathForRow:i inSection:0]];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView transitionWithView: self.tableView
                          duration: 0.35f
                           options: UIViewAnimationOptionTransitionCrossDissolve
                        animations: ^(void){
              [self.tableView reloadData];
         }completion:^(BOOL finished) {
            [self.projectVC.view hideToastActivity];
        }];
    });
}

#pragma mark - 테이블 뷰 델리게이트

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Project *project = [ProjectManager.sharedInstance getAllProjectsFromCoreData][indexPath.row];
    Project *selectProject = [ProjectManager.sharedInstance projectFromProjectID:project.projectID];
    [SaveManager.sharedInstance applyCurrentProject:selectProject];
    UIStoryboard *editing = [UIStoryboard storyboardWithName:@"Editing" bundle:NSBundle.mainBundle];
    EditingViewController *editingVC = (EditingViewController *)[editing instantiateViewControllerWithIdentifier:@"EditingViewController"];
    [self.projectVC.navigationController pushViewController:editingVC animated:true];
    [SaveManager.sharedInstance save];
    
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 350;
}


@end
