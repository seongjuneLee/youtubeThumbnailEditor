//
//  ViewController+Buttons.m
//  Thummit
//
//  Created by 이성준 on 2020/12/12.
//

#import "HomeViewController+Buttons.h"
#import "AlbumViewController.h"
#import "EditingViewController.h"
#import "TemplateHeader.h"
#import <Photos/Photos.h>

@implementation HomeViewController (Buttons)

- (IBAction)templateButtonTapped:(UIButton *)sender {
    
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Editing" bundle:[NSBundle mainBundle]];
    EditingViewController *editingVC = (EditingViewController *)[main instantiateViewControllerWithIdentifier:@"EditingViewController"];
    
    editingVC.selectedTemplate = [CircleTemplate circleTemplate];
    
    [self.navigationController pushViewController:editingVC animated:true];
    
}


@end
