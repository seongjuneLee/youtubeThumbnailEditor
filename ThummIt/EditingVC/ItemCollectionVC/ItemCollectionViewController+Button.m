//
//  ItemCollectionViewController+Button.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/10.
//

#import "ItemCollectionViewController+Button.h"
#import "EditingViewController.h"
#import "EditingViewController+Buttons.h"

@implementation ItemCollectionViewController (Button)


- (IBAction)cancelButtonTapped:(UIButton *)sender{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    
    if (editingVC.modeController.editingMode == AddingPhotoFrameMode || editingVC.modeController.editingMode == EditingPhotoFrameModeWhileAddingPhotoFrameMode){
        [editingVC cancelAddingPhotoFrame];
        
    } else if (editingVC.modeController.editingMode == EditingPhotoFrameMode){
        [editingVC cancelEditingPhotoFrame];
        
//TEXT
    } else if (editingVC.modeController.editingMode == AddingTextMode){
        [editingVC cancelAddingText];
    } else if (editingVC.modeController.editingMode == EditingTextMode){
        [editingVC cancelEditingText];
//STICKER
    } else if (editingVC.modeController.editingMode == AddingStickerMode){
        [editingVC cancelAddingSticker];
    } else if (editingVC.modeController.editingMode == EditingStickerMode){
        [editingVC cancelEditingSticker];
    }
    [editingVC hideAndInitSlider];
    [editingVC.modeController setNavigationItemRespondToEditingMode:NormalMode];
}

- (IBAction)checkButtonTapped:(UIButton *)sender{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (editingVC.modeController.editingMode == AddingPhotoFrameMode || editingVC.modeController.editingMode == EditingPhotoFrameModeWhileAddingPhotoFrameMode){
        [editingVC doneAddingPhotoFrame];
    } else if (editingVC.modeController.editingMode == EditingPhotoFrameMode){
        [editingVC doneEditingPhotoFrame];
//TEXT
    } else if (editingVC.modeController.editingMode == AddingTextMode){
        [editingVC doneAddingText];
    } else if (editingVC.modeController.editingMode == EditingTextMode){
        [editingVC doneEditingText];
//STICKER
    }else if (editingVC.modeController.editingMode == AddingStickerMode){
        [editingVC doneAddingSticker];
    }else if (editingVC.modeController.editingMode == EditingStickerMode){
        [editingVC doneEditingSticker];
//BGCOLOR
    }else if (editingVC.modeController.editingMode == EditingBGColorMode){
        [editingVC doneEditingBGColor];
    }
    
    [editingVC hideAndInitSlider];
    [editingVC.modeController setNavigationItemRespondToEditingMode:NormalMode];

}

@end
