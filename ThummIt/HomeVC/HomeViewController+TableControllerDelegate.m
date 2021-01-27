//
//  HomeViewController+TableControllerDelegate.m
//  Thummit
//
//  Created by 이성준 on 2020/12/17.
//

#import "HomeViewController+TableControllerDelegate.h"
#import "ProjectManager.h"
#import "SaveManager.h"
@implementation HomeViewController (TableControllerDelegate)

// 홈 테이블 뷰 컨틀롤러 델리게이트를 받아 editingVC를 푸시하는 함수.
-(void)didSelectItemAtTableIndex:(NSUInteger)tableIndex withCollectionIndex:(NSUInteger)collectionIndex{
        
    NSArray *templates = TemplateManager.sharedInstance.templateDatas[tableIndex];
    Template *selectedTemplate = templates[collectionIndex];
    Project *project =  [ProjectManager.sharedInstance generateNewProjectWithTemplate:selectedTemplate];
    
    project.backgroundImageName = selectedTemplate.backgroundImageName;
    [SaveManager.sharedInstance applyCurrentProject:project];    
    
    UIStoryboard *editing = [UIStoryboard storyboardWithName:@"Editing" bundle:NSBundle.mainBundle];
    EditingViewController *editingVC = (EditingViewController *)[editing instantiateViewControllerWithIdentifier:@"EditingViewController"];
    editingVC.selectedTemplate = selectedTemplate;
    [self.navigationController pushViewController:editingVC animated:true];
    [SaveManager.sharedInstance save];
    
}

@end
