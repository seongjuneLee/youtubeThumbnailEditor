//
//  EditingViewController+Buttons.m
//  Thummit
//
//  Created by 이성준 on 2020/12/16.
//

#import "EditingViewController+Buttons.h"

@implementation EditingViewController (Buttons)


- (IBAction)leftItemTapped:(id)sender {
    
    if (self.editingModeController.editingMode == NormalMode) {
        [self closeEditingVC];
    } else if (self.editingModeController.editingMode == EditingPhotoFrameMode){
        [self.editingModeController setUpEditingMode:NormalMode];
        [self dismissAlbumVC];
    }

}


- (IBAction)rightItemTapped:(id)sender {
    
    if (self.editingModeController.editingMode == NormalMode) {
        [self exportThumbnail];
    } else if (self.editingModeController.editingMode == EditingPhotoFrameMode){
        [self.editingModeController setUpEditingMode:NormalMode];
        [self doneSelectingPhoto];
    }

}

#pragma mark - left item 탭

-(void)closeEditingVC{
    
    [self.navigationController popViewControllerAnimated:true];

}

-(void)dismissAlbumVC{
    
    // 변경 취소하고, 원래 이미지 다시 넣어주기.
    self.selectedItem.imageView.image = self.originalPhotoFrameImage;
    // 취소시 이미지 뷰 센터 다시 돌려놓기.
    self.selectedItem.imageView.center = self.originalImageViewCenter;
    self.selectedItem.imageView.transform = self.originalTransform;
    
    // 레이어 되돌려 놓기
    [self.editingLayerController recoverOriginalLayer];
    
    // albumVC 없애주기
    [self.albumVC dismissSelf];
    self.albumVC = nil;
    self.selectedItem = nil;

}

#pragma mark - right item 탭

-(void)exportThumbnail{
    
    
    
}

-(void)doneSelectingPhoto{
    
    // 레이어 되돌려 놓기
    [self.editingLayerController recoverOriginalLayer];
    
    self.selectedItem.phAsset = PhotoManager.sharedInstance.phassets[self.albumVC.selectedIndexPath.item];
    
    // albumVC 없애주기
    [self.albumVC dismissSelf];
    self.albumVC = nil;

    self.originalPhotoFrameImage = nil;
    self.selectedItem = nil;
    dispatch_async(dispatch_get_main_queue(), ^{
        [SaveManager.sharedInstance save];
    });
    
}

@end
