//
//  ItemCollectionViewController+Button.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/10.
//

#import "ItemCollectionViewController+Button.h"
#import "EditingViewController.h"
@implementation ItemCollectionViewController (Button)

- (IBAction)itemButtonTapped:(UIButton *)sender {
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    
    if (!sender.selected) {
        sender.selected = true;
        self.contentButton.selected = false;
        sender.alpha = 0.8;
        if (self.itemType == PhotoFrameType) {
            self.contentButton.alpha = 0.4;
            editingVC.albumVC.view.hidden = true;
            editingVC.editingModeController.editingMode = AddingPhotoFrameMode;
        } else if (self.itemType == TextType){
            
            [editingVC.currentText.textView resignFirstResponder];
            
        }
    }

    
}

- (IBAction)contentButtonTapped:(UIButton *)sender {
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (!sender.selected) {
        sender.selected = true;
        self.itemButton.selected = false;
        sender.alpha = 0.8;
        self.itemButton.alpha = 0.4;
        if (self.itemType == PhotoFrameType) {
            editingVC.albumVC.view.frameHeight = self.view.frameHeight - (self.itemButton.frameY + self.itemButton.frameHeight + 10);
            editingVC.albumVC.view.frameY = editingVC.view.frameHeight - editingVC.albumVC.view.frameHeight;
            editingVC.albumVC.view.hidden = false;
            editingVC.editingModeController.editingMode = EditingPhotoFrameModeWhileAddingPhotoFrameMode;
        } else if (self.itemType == TextType){
            
            [editingVC.currentText.textView becomeFirstResponder];
            
        }
    }
    
}

@end
