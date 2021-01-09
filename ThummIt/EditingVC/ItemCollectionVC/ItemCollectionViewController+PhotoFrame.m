//
//  ItemCollectionViewController+PhotoFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/09.
//

#import "ItemCollectionViewController+PhotoFrame.h"
#import "EditingViewController.h"

@implementation ItemCollectionViewController (PhotoFrame)


#pragma mark - 포토프레임 컨트롤러 델리게이트

-(void)didSelectPhotoFrame:(PhotoFrame *)photoFrame{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    photoFrame.baseView.center = editingVC.imageView.center;
    
    if (editingVC.currentItem) {
        // 위치, 크기,사진 유지
        photoFrame.baseView.frame = editingVC.currentItem.baseView.frame;
        photoFrame.photoImageView.frame = editingVC.currentItem.photoImageView.frame;
        photoFrame.photoImageView.image = editingVC.currentItem.photoImageView.image;
        [editingVC.currentItem.baseView removeFromSuperview];// 기존 것 떼어주고
    }
    
    [editingVC.editingLayerController bringCurrentItemToFront:photoFrame];
    
    editingVC.currentItem = photoFrame;
    editingVC.editingGestureController.currentItem = photoFrame;

}


// 버튼

- (IBAction)itemButtonTapped:(UIButton *)sender {
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (!sender.selected) {
        sender.selected = true;
        self.albumButton.selected = false;
        sender.alpha = 0.8;
        self.albumButton.alpha = 0.4;
        editingVC.albumVC.view.hidden = true;
        editingVC.editingModeController.editingMode = AddingPhotoFrameMode;
    }

}

- (IBAction)albumButtonTapped:(UIButton *)sender {
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (!sender.selected) {
        sender.selected = true;
        self.itemButton.selected = false;
        sender.alpha = 0.8;
        self.itemButton.alpha = 0.4;
        editingVC.albumVC.view.frameHeight = self.view.frameHeight - (self.itemButton.frameY + self.itemButton.frameHeight + 10);
        editingVC.albumVC.view.frameY = editingVC.view.frameHeight - editingVC.albumVC.view.frameHeight;
        editingVC.albumVC.view.hidden = false;
        editingVC.editingModeController.editingMode = EditingPhotoFrameModeWhileAddingPhotoFrameMode;

    }
    
}
@end
