//
//  EditingContentModeController.m
//  Thummit
//
//  Created by 이성준 on 2020/12/19.
//

#import "EditingModeController.h"
#import "EditingViewController.h"

@implementation EditingModeController // 네비게이션 바 아이템들에 대한 컨트롤만.

-(id)init{
    
    self = [super init];
    if(self){
        
    }
    return self;
    
}

-(void)setNavigationItemRespondToEditingMode:(EditingMode)editingMode{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    self.editingMode = editingMode;
    
    if (self.editingMode == NormalMode) { // 노멀
        
        [UIView animateWithDuration:0.2 animations:^{
            editingVC.leftItem.alpha
            = editingVC.rightItem.alpha = 1.0;
        }];

        [editingVC.leftItem setImage:[UIImage imageNamed:@"closeButton"] forState:UIControlStateNormal];
        
        [UIView transitionWithView:editingVC.leftItem duration:0.3 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        [editingVC.leftItem setTitle:NSLocalizedString(@"Cancel", nil) forState:UIControlStateNormal];
        } completion:nil];
        
        [UIView transitionWithView:editingVC.rightItem duration:0.3 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        [editingVC.rightItem setTitle:NSLocalizedString(@"Export", nil) forState:UIControlStateNormal];
        } completion:nil];
        
    } else {
        
        editingVC.leftItem.alpha = 0;
        editingVC.rightItem.alpha = 0;
        
    }
}


@end
