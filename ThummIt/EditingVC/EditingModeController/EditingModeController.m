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
    
    [UIView animateWithDuration:0.2 animations:^{
        editingVC.leftItem.alpha = editingVC.rightItem.alpha = 1.0;
    }];

    if (self.editingMode == NormalMode) { // 노멀
        [editingVC.leftItem setImage:[UIImage imageNamed:@"closeButton"] forState:UIControlStateNormal];
        [UIView transitionWithView:editingVC.leftItem duration:0.3 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            
            [editingVC.leftItem setTitle:NSLocalizedString(@"Cancel", nil) forState:UIControlStateNormal];
        } completion:nil];
        editingVC.leftItemWidthConstraint.constant = 25;
        [editingVC.rightItem setTitle:NSLocalizedString(@"Export", nil) forState:UIControlStateNormal];
    } else if (self.editingMode == AddingPhotoFrameMode){ // 포토프레임 추가
        
        [editingVC.leftItem setImage:nil forState:UIControlStateNormal];
        [UIView transitionWithView:editingVC.leftItem duration:0.3 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            
            [editingVC.leftItem setTitle:NSLocalizedString(@"Cancel", nil) forState:UIControlStateNormal];
        } completion:nil];
        editingVC.leftItemWidthConstraint.constant = 60;
        [editingVC.rightItem setTitle:NSLocalizedString(@"Done", nil) forState:UIControlStateNormal];

    }else if (self.editingMode == EditingPhotoFrameMode){ // 포토프레임 편집
        [editingVC.leftItem setImage:nil forState:UIControlStateNormal];
        [UIView transitionWithView:editingVC.leftItem duration:0.3 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [editingVC.leftItem setTitle:NSLocalizedString(@"Cancel", nil) forState:UIControlStateNormal];
        } completion:nil];
        editingVC.leftItemWidthConstraint.constant = 120;
        [editingVC.rightItem setTitle:NSLocalizedString(@"Done", nil) forState:UIControlStateNormal];
        
    }else if (self.editingMode == AddingTextMode){
        
        [editingVC.leftItem setImage:nil forState:UIControlStateNormal];
        [UIView transitionWithView:editingVC.leftItem duration:0.3 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            
            [editingVC.leftItem setTitle:NSLocalizedString(@"Cancel", nil) forState:UIControlStateNormal];
        } completion:nil];
        editingVC.leftItemWidthConstraint.constant = 300;
        [editingVC.rightItem setTitle:NSLocalizedString(@"Done", nil) forState:UIControlStateNormal];
        
    }else if (self.editingMode == EditingTextMode){
        
        [editingVC.leftItem setImage:nil forState:UIControlStateNormal];
        [UIView transitionWithView:editingVC.leftItem duration:0.3 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            
            [editingVC.leftItem setTitle:NSLocalizedString(@"Cancel", nil) forState:UIControlStateNormal];
        } completion:nil];
        editingVC.leftItemWidthConstraint.constant = 120;
        [editingVC.rightItem setTitle:NSLocalizedString(@"Done", nil) forState:UIControlStateNormal];
        
    }else if (self.editingMode == AddingStickerMode){
        
        [editingVC.leftItem setImage:nil forState:UIControlStateNormal];
        [UIView transitionWithView:editingVC.leftItem duration:0.3 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            
            [editingVC.leftItem setTitle:NSLocalizedString(@"Cancel", nil) forState:UIControlStateNormal];
        } completion:nil];
        editingVC.leftItemWidthConstraint.constant = 300;
        [editingVC.rightItem setTitle:NSLocalizedString(@"Done", nil) forState:UIControlStateNormal];
    }else if (self.editingMode == EditingStickerMode){
        
        [editingVC.leftItem setImage:nil forState:UIControlStateNormal];
        [UIView transitionWithView:editingVC.leftItem duration:0.3 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            
            [editingVC.leftItem setTitle:NSLocalizedString(@"Cancel", nil) forState:UIControlStateNormal];
        } completion:nil];
        editingVC.leftItemWidthConstraint.constant = 120;
        [editingVC.rightItem setTitle:NSLocalizedString(@"Done", nil) forState:UIControlStateNormal];
    }else if (self.editingMode == EditingBGColorMode){
        
        [UIView animateWithDuration:0.2 animations:^{
            editingVC.leftItem.alpha = editingVC.rightItem.alpha = 0;
        }];
        
    }
    
}


@end
