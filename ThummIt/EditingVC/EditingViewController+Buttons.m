//
//  EditingViewController+Buttons.m
//  Thummit
//
//  Created by 이성준 on 2020/12/16.
//

#import "EditingViewController+Buttons.h"
#import "EditingViewController+GestureControllerDelegate.h"

@implementation EditingViewController (Buttons)

#pragma mark - 네비게이션 버튼


#pragma mark - left item 탭

- (IBAction)leftItemTapped:(id)sender {
    
    if (self.editingModeController.editingMode == NormalMode) {
        [self closeEditingVC];
    } else if (self.editingModeController.editingMode == AddingPhotoFrameMode || self.editingModeController.editingMode == EditingPhotoFrameModeWhileAddingPhotoFrameMode){
        [self.editingModeController setUpEditingMode:NormalMode];
        [self dismissItemCollectionVC];
    } else if (self.editingModeController.editingMode == EditingPhotoFrameMode){
        [self.editingModeController setUpEditingMode:NormalMode];
        [self dismissAlbumVC];
    }

}

-(void)closeEditingVC{
    
    [self.navigationController popViewControllerAnimated:true];

}

-(void)dismissAlbumVC{
    
    // 변경 취소하고, 원래 이미지 다시 넣어주기.
    self.currentItem.photoImageView.image = self.originalPhotoFrameImage;
    // 취소시 이미지 뷰 센터 다시 돌려놓기.
    self.currentItem.photoImageView.center = self.originalImageViewCenter;
    self.currentItem.photoImageView.transform = self.originalTransform;
    
    // 레이어 되돌려 놓기
    [self.editingLayerController recoverOriginalLayer];
    
    // albumVC 없애주기
    [self.albumVC dismissSelf];
    self.currentItem = nil;
    self.albumVC = nil;

}

-(void)dismissItemCollectionVC{
    
    [self.editingLayerController hideTransparentView];
    [self.itemCollectionVC dismissSelf];
    [self.albumVC dismissSelf];
    [ItemManager.sharedInstance deleteItem:self.currentItem];
    self.currentItem = nil;
    self.albumVC = nil;

    
}

#pragma mark - right item 탭

- (IBAction)rightItemTapped:(id)sender {
    
    if (self.editingModeController.editingMode == NormalMode) {
        [self exportThumbnail];
    } else if (self.editingModeController.editingMode == AddingPhotoFrameMode || self.editingModeController.editingMode == EditingPhotoFrameModeWhileAddingPhotoFrameMode){
        [self.editingModeController setUpEditingMode:NormalMode];
        [self doneAddingPhoto];
    } else if (self.editingModeController.editingMode == EditingPhotoFrameMode){
        [self.editingModeController setUpEditingMode:NormalMode];
        [self doneEditingPhoto];
    }

}

-(void)exportThumbnail{
    
    
    
}

-(void)doneEditingPhoto{
    
    // 레이어 되돌려 놓기
    
    [self.editingLayerController recoverOriginalLayer];
    
    self.currentItem.phAsset = PhotoManager.sharedInstance.phassets[self.albumVC.selectedIndexPath.item];
    
    // albumVC 없애주기
    [self.albumVC dismissSelf];
    self.albumVC = nil;

    self.originalPhotoFrameImage = nil;
    self.currentItem = nil;
    dispatch_async(dispatch_get_main_queue(), ^{
        [SaveManager.sharedInstance save];
    });
    
}

-(void)doneAddingPhoto{
    
    [self.editingLayerController hideTransparentView];
    [self.itemCollectionVC dismissSelf];
    [self.albumVC dismissSelf];
    [SaveManager.sharedInstance.currentProject.photoFrames addObject:self.currentItem];
    dispatch_async(dispatch_get_main_queue(), ^{
        [SaveManager.sharedInstance save];
    });
    self.albumVC = nil;
    self.currentItem = nil;
}

#pragma mark - 아이템 버튼

- (IBAction)photoFrameButtonTapped:(id)sender {
    
    [self.editingLayerController showTransparentView];
    [self.editingModeController setUpEditingMode:AddingPhotoFrameMode];
    [self addItemCollectionVC];
    
}

-(void)addItemCollectionVC{
    
    [self addChildViewController:self.itemCollectionVC];
    [self.view addSubview:self.itemCollectionVC.view];
    
    self.itemCollectionVC.collectionView.frameY = self.view.frameHeight;
    self.itemCollectionVC.blurView.frameY = self.view.frameHeight;
    
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.itemCollectionVC.collectionView.frameY = 0;
        self.itemCollectionVC.blurView.frameY = 0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.itemCollectionVC.itemButton.alpha = 0.8;
            self.itemCollectionVC.albumButton.alpha = 0.4;
        }];
    }];
    
    [self showAlbumVC];
    self.albumVC.view.hidden = true;
    
}
@end
