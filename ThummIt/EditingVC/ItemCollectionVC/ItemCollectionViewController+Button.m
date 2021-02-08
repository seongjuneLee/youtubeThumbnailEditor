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
        [self photoFrameStyleTapped:self.photoFrameStyleButton];

    } else if (editingVC.modeController.editingMode == AddingTextMode){ //TEXT
        [editingVC cancelAddingText];
    } else if (editingVC.modeController.editingMode == EditingTextMode){
        [editingVC cancelEditingText];

    } else if (editingVC.modeController.editingMode == AddingStickerMode){ //STICKER
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
    } else if (editingVC.modeController.editingMode == EditingPhotoInsidePhotoFrameMode){
        [editingVC doneEditingPhotoFrame];

    } else if (editingVC.modeController.editingMode == AddingTextMode){ //TEXT
        [editingVC doneAddingText];
    } else if (editingVC.modeController.editingMode == EditingTextMode){
        [editingVC doneEditingText];

    }else if (editingVC.modeController.editingMode == AddingStickerMode){ //STICKER
        [editingVC doneAddingSticker];
    }else if (editingVC.modeController.editingMode == EditingStickerMode){
        [editingVC doneEditingSticker];

    }else if (editingVC.modeController.editingMode == EditingBGColorMode){ //BGCOLOR
        [editingVC doneEditingBGColor];
    }
    
    [editingVC hideAndInitSlider];
    [editingVC.modeController setNavigationItemRespondToEditingMode:NormalMode];

}

#pragma mark - 아이템 버튼

- (IBAction)typoButtonTapped:(UIButton *)sender {
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (!sender.selected) {
        sender.selected = true;
        self.textButton.selected = false;
        [UIView animateWithDuration:0.2 animations:^{
            self.typoButton.alpha = 1.0;
            self.textButton.alpha = 0.4;
        }];
        [editingVC.currentText.textView resignFirstResponder];
    }
    
}

- (IBAction)textButtonTapped:(UIButton *)sender {
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (!sender.selected) {
        sender.selected = true;
        self.typoButton.selected = false;
        [UIView animateWithDuration:0.2 animations:^{
            self.typoButton.alpha = 0.4;
            self.textButton.alpha = 1.0;
        }];
        [editingVC.currentText.textView becomeFirstResponder];
    }

}

- (IBAction)photoButtonTapped:(UIButton *)sender {
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (!sender.selected) {
        sender.selected = true;
        self.photoFrameStyleButton.selected = false;
        [UIView animateWithDuration:0.2 animations:^{
            self.photoButton.alpha = 1.0;
            self.photoFrameStyleButton.alpha = 0.4;
        }];
        [editingVC.albumVC showWithAnimation];
        editingVC.modeController.editingMode = EditingPhotoInsidePhotoFrameMode;
    }


}

- (IBAction)photoFrameStyleTapped:(UIButton *)sender {
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (!sender.selected) {
        sender.selected = true;
        self.photoButton.selected = false;
        [UIView animateWithDuration:0.2 animations:^{
            self.photoButton.alpha = 0.4;
            self.photoFrameStyleButton.alpha = 1.0;
        }];
        [editingVC.albumVC hideWithAnimation];
        editingVC.modeController.editingMode = AddingPhotoFrameMode;
    }

}


@end
