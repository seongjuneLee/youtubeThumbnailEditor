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
#import "ExportManager.h"
#import "ProjectManager.h"
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
    
    return self.projects.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ProjectTableViewCell *cell = (ProjectTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ProjectTableViewCell" forIndexPath:indexPath];
    Project *project = self.projects[indexPath.row];
    cell.backgroundImageView.image = project.previewImage;
    cell.moreButton.tag = indexPath.row;
    BOOL lastItemReached = [project isEqual:self.projects.lastObject];
    if (lastItemReached && indexPath.row == [self.projects count] - 1 && self.offset != 0)
    {
        if (self.offset < 10) {
            self.offset = 0;
        } else {
            self.offset -= 10;
        }
        [self loadMoreWithOffset:self.offset];
    }

    cell.delegate = self;
    return cell;
}

-(void)loadMoreWithOffset:(NSUInteger)offset{
//    [self.projectVC.view makeToastActivity:CSToastPositionCenter];
//    NSUInteger beforeDataCounts = self.projects.count;
//    NSMutableArray *indexPathsToReload = [NSMutableArray new];
//    [self.projects addObjectsFromArray:[ProjectManager.sharedInstance getRecentProjectsFromCoreDataWithOffset:self.offset]];
//    for (NSUInteger i = beforeDataCounts; i < self.projects.count - beforeDataCounts; i++) {
//        [indexPathsToReload addObject:[NSIndexPath indexPathForRow:i inSection:0]];
//    }
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [UIView transitionWithView: self.tableView
//                          duration: 0.35f
//                           options: UIViewAnimationOptionCurveEaseIn
//                        animations: ^(void){
//              [self.tableView reloadData];
//         }completion:^(BOOL finished) {
//            [self.projectVC.view hideToastActivity];
//        }];
//    });
}

#pragma mark - 테이블 뷰 델리게이트

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Project *project = self.projects[indexPath.row];
    Project *selectProject = [ProjectManager.sharedInstance projectFromProjectID:project.projectID];
    [SaveManager.sharedInstance applyCurrentProject:selectProject];
    UIStoryboard *editing = [UIStoryboard storyboardWithName:@"Editing" bundle:NSBundle.mainBundle];
    EditingViewController *editingVC = (EditingViewController *)[editing instantiateViewControllerWithIdentifier:@"EditingViewController"];
    [self.projectVC.navigationController pushViewController:editingVC animated:true];
    [SaveManager.sharedInstance saveAndAddToStack];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
    
    return window.frameWidth * 0.59;
}

-(void)moreButtonTappedWithIndex:(NSUInteger)index{
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Action Sheet" message:@"alert controller" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel",nil) style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        // Cancel button tappped.
        [actionSheet dismissViewControllerAnimated:true completion:nil];
    }]];
    
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Download", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        Project *project = self.projects[index];
        
        [self downloadButtonTappedWithProject:project];

        [actionSheet dismissViewControllerAnimated:true completion:nil];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Delete",nil) style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        Project *project = self.projects[index];
        [ProjectManager.sharedInstance deleteProjectOfID:project.projectID];
        [self.projects removeObjectAtIndex:index];
        [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
        // Distructive button tapped.
        [actionSheet dismissViewControllerAnimated:true completion:nil];
    }]];
    [actionSheet setModalPresentationStyle:UIModalPresentationPopover];

    
    ProjectTableViewCell *cell = (ProjectTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
    
    UIPopoverPresentationController *popPresenter = [actionSheet
                                                  popoverPresentationController];
    popPresenter.sourceView = cell.moreButton;

    // Present action sheet.
    [self.projectVC presentViewController:actionSheet animated:true completion:nil];
    
    
}

-(void)downloadButtonTappedWithProject:(Project *)project{
    
//    if (PHPhotoLibrary.authorizationStatus == PHAuthorizationStatusAuthorized){
//        dispatch_async(dispatch_get_main_queue(), ^{
//
//            [ExportManager.sharedInstance savePreviewImageWithResolution:CGSizeMake(2048.f, 1152.f) withProject:project];
            
//            [ExportManager.sharedInstance exportImageWithBlock:^(BOOL success) {
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    if (success) {
//                        if (PFUser.currentUser) {
//                            NSMutableArray *exportedImages = [NSMutableArray array];
//                            [exportedImages addObjectsFromArray:PFUser.currentUser[@"exportedThumbnails"]];
//                            NSData* thumbnailBigData = UIImagePNGRepresentation(ExportManager.sharedInstance.exportingImage);
//                            PFFileObject *thumbnailBigFile = [PFFileObject fileObjectWithData:thumbnailBigData];
//                            [exportedImages addObject:thumbnailBigFile];
//                            [PFUser.currentUser setObject:exportedImages forKey:@"exportedThumbnails"];
//
//                            [PFUser.currentUser saveInBackground];
//                        }
//
//                        [self.projectVC.view makeToast:NSLocalizedString(@"Download success", nil) duration:4.0 position:CSToastPositionCenter];
//                    } else {
//                        [self.projectVC.view makeToast:NSLocalizedString(@"Download failed. Contact us in account view", nil) duration:4.0 position:CSToastPositionCenter];
//                    }
//                });
//            }];

//        });
//    } else {
//        [PhotoManager.sharedInstance requstGoingToSettingWithVC:self.projectVC];
//    }
//    
}



@end
