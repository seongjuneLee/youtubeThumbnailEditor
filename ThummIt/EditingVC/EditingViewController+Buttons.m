//
//  EditingViewController+Buttons.m
//  Thummit
//
//  Created by 이성준 on 2020/12/16.
//

#import "EditingViewController+Buttons.h"
#import "EditingViewController+GestureControllerDelegate.h"
#import "ItemCollectionViewController+Text.h"
#import "TypoHeader.h"
#import "UndoManager.h"

@implementation EditingViewController (Buttons)

#pragma mark - left item 탭

- (IBAction)leftItemTapped:(id)sender {
    
    if (self.modeController.editingMode == NormalMode) {
        
        [self closeEditingVC];
        
    } else if (self.modeController.editingMode == AddingPhotoFrameMode || self.modeController.editingMode == EditingPhotoFrameModeWhileAddingPhotoFrameMode){
        
        [self cancelAddingPhotoFrame];
        
    } else if (self.modeController.editingMode == EditingPhotoFrameMode){
        
        [self cancelEditingPhotoFrame];
        
    } else if (self.modeController.editingMode == AddingTextMode){
        
        [self cancelAddingText];

    } else if (self.modeController.editingMode == EditingBGColorMode){
        
        [self cancelEditingBGColor];
        
    }

}

-(void)closeEditingVC{
    
    [self.navigationController popViewControllerAnimated:true];

}

-(void)cancelAddingPhotoFrame{
    
    [self.modeController setNavigationItemRespondToEditingMode:NormalMode];
    [self dismissItemCollectionVC];
    [self.albumVC dismissSelf];
    [self.currentItem.baseView removeFromSuperview];
    self.currentItem = nil;
    self.currentPhotoFrame = nil;
    self.albumVC = nil;

}

-(void)cancelEditingPhotoFrame{
    [self.modeController setNavigationItemRespondToEditingMode:NormalMode];
    [self dismissAlbumVC];

}

-(void)cancelAddingText{
    
    [self.modeController setNavigationItemRespondToEditingMode:NormalMode];
    [self dismissItemCollectionVC];
    [self.currentItem.baseView removeFromSuperview];
    [self.currentText.textView resignFirstResponder];
    self.currentItem = nil;
    self.currentText = nil;

}

-(void)cancelEditingBGColor{
    
    [self.modeController setNavigationItemRespondToEditingMode:NormalMode];
    [self dismissItemCollectionVC];
    self.bgView.backgroundColor = self.originalColor;
    
}

-(void)dismissAlbumVC{
    
    // 변경 취소하고, 원래 이미지 다시 넣어주기.
    self.currentItem.photoImageView.image = self.originalPhotoFrameImage;
    // 취소시 이미지 뷰 센터 다시 돌려놓기.
    self.currentItem.photoImageView.center = self.originalImageViewCenter;
    self.currentItem.photoImageView.transform = self.originalTransform;
    
    // 레이어 되돌려 놓기
    [self.layerController recoverOriginalLayer];
    
    // albumVC 없애주기
    [self.albumVC dismissSelf];
    self.currentItem = nil;
    self.albumVC = nil;

}

-(void)dismissItemCollectionVC{
    
    [self.layerController hideTransparentView];
    [self.itemCollectionVC dismissSelf];

    
}

#pragma mark - right item 탭

- (IBAction)rightItemTapped:(id)sender {
    
    if (self.modeController.editingMode == NormalMode) {
        [self exportThumbnail];
    } else if (self.modeController.editingMode == AddingPhotoFrameMode || self.modeController.editingMode == EditingPhotoFrameModeWhileAddingPhotoFrameMode){
        [self doneAddingPhotoFrame];
    } else if (self.modeController.editingMode == EditingPhotoFrameMode){
        [self doneEditingPhotoFrame];
    } else if (self.modeController.editingMode == AddingTextMode){
        [self doneAddingText];
    } else if (self.modeController.editingMode == EditingBGColorMode){
        [self doneEditingBGColor];
    }

}

-(void)exportThumbnail{
    
    
    
}

-(void)doneEditingPhotoFrame{
    
    // 레이어 되돌려 놓기
    
    [self.layerController recoverOriginalLayer];
    [self.modeController setNavigationItemRespondToEditingMode:NormalMode];

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

-(void)doneAddingPhotoFrame{
    
    [self.modeController setNavigationItemRespondToEditingMode:NormalMode];
    [self.layerController hideTransparentView];
    [self.itemCollectionVC dismissSelf];
    [self.albumVC dismissSelf];
    [SaveManager.sharedInstance addItem:self.currentItem];
    [SaveManager.sharedInstance save];
    self.albumVC = nil;
    self.currentItem = nil;
    self.currentPhotoFrame = nil;
}

-(void)doneAddingText{
    
    [self.modeController setNavigationItemRespondToEditingMode:NormalMode];
    [self.layerController hideTransparentView];
    [self.itemCollectionVC dismissSelf];
    [SaveManager.sharedInstance addItem:self.currentItem];
    [SaveManager.sharedInstance save];
    [self.currentText.textView resignFirstResponder];
    self.currentItem = nil;
    self.currentText = nil;
}

-(void)doneEditingBGColor{
    
    [self.modeController setNavigationItemRespondToEditingMode:NormalMode];
    [self.layerController hideTransparentView];
    [UIView animateWithDuration:0.2 animations:^{
        self.buttonScrollView.alpha = 1.0;
    }];
    [self.bgColorVC dismissSelf];
    SaveManager.sharedInstance.currentProject.backgroundColor = self.bgView.backgroundColor;
    [SaveManager.sharedInstance save];

}

#pragma mark - 아이템 버튼

#pragma mark - 포토 프레임 버튼

- (IBAction)photoFrameButtonTapped:(UIButton *)sender {
    
    
    [self.layerController showTransparentView];
    [self.modeController setNavigationItemRespondToEditingMode:AddingPhotoFrameMode];
    self.itemCollectionVC.itemType = PhotoFrameType;
    [self addItemCollectionVC];
    [self showAlbumVC];
    self.albumVC.view.hidden = true;

}

-(void)addItemCollectionVC{
    
    [self addChildViewController:self.itemCollectionVC];
    [self.view addSubview:self.itemCollectionVC.view];
    
    self.itemCollectionVC.collectionView.frameY = self.view.frameHeight;
    self.itemCollectionVC.blurView.frameY = self.view.frameHeight;
    
    self.itemCollectionVC.itemButton.alpha = 0;
    self.itemCollectionVC.contentButton.alpha = 0;
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.itemCollectionVC.collectionView.frameY = 0;
        self.itemCollectionVC.blurView.frameY = 0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.itemCollectionVC.itemButton.alpha = 0.8;
            self.itemCollectionVC.contentButton.alpha = 0.4;
        }];
    }];
    
    
}

#pragma mark - 텍스트 버튼

- (IBAction)textButtonTapped:(UIButton *)sender {
    
    [self.layerController showTransparentView];
    [self.modeController setNavigationItemRespondToEditingMode:AddingTextMode];
    self.itemCollectionVC.itemType = TextType;
    [self addItemCollectionVC];
    if (self.recentTypo == nil) {
        self.recentTypo = [NormalTypo normalTypo];
    }
    [self.itemCollectionVC didSelectTypo:self.recentTypo];
    
}

#pragma mark - 스티커 버튼

- (IBAction)stickerButtonTapped:(id)sender {
    
    
    
}

#pragma mark - 보더칼라 버튼

- (IBAction)bgColorButtonTapped:(id)sender {
    
    [self.modeController setNavigationItemRespondToEditingMode:EditingBGColorMode];
    
    self.originalColor = self.bgView.backgroundColor;
    
    // scrollView 가려주기
    [UIView animateWithDuration:0.2 animations:^{
        self.buttonScrollView.alpha = 0.0;
    }];
    
    [self addChildViewController:self.bgColorVC];
    [self.view addSubview:self.bgColorVC.view];
    
    self.bgColorVC.contentView.frameY = self.view.frameHeight;
    [UIView animateWithDuration:0.4 animations:^{
        self.bgColorVC.contentView.frameY = self.bgColorVC.view.frameY;
    }];
    
}



#pragma mark - 버튼 컨테이너 알파 애니메이션

-(void)photoFrameButtonHoldDown{
    
    self.photoFrameButtonContainerView.alpha = 0.6;
    
}

-(void)photoFrameButtonHoldRelease{
    [UIView animateWithDuration:0.2 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.photoFrameButtonContainerView.alpha = 1.0;
        
    } completion:nil];
    
    
}

-(void)textButtonHoldDown{
    
    self.textButtonContainerView.alpha = 0.6;
    
}

-(void)textButtonHoldRelease{
    [UIView animateWithDuration:0.2 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.textButtonContainerView.alpha = 1.0;
        
    } completion:nil];
    
    
}

-(void)stickerButtonHoldDown{
    
    self.stickerButtonContainerView.alpha = 0.6;
    
}

-(void)stickerButtonHoldRelease{
    [UIView animateWithDuration:0.2 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.stickerButtonContainerView.alpha = 1.0;
        
    } completion:nil];
    
    
}

-(void)bgColorButtonHoldDown{
    [UIView animateWithDuration:0.2 animations:^{
        self.bgColorButtonContainerView.alpha = 0.6;
    }];

}

-(void)bgColorButtonHoldRelease{
    
    [UIView animateWithDuration:0.2 delay:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.bgColorButtonContainerView.alpha = 1.0;
        
    } completion:nil];
    
    
}

#pragma mark - undo redo


- (IBAction)undoButtonTapped:(UIButton *)sender {
    
    [self clearProjectContents];
    [UndoManager.sharedInstance undo];
    [self loadItems];
    self.bgView.backgroundColor = SaveManager.sharedInstance.currentProject.backgroundColor;
        
}

- (IBAction)redoButtonTapped:(UIButton *)sender {
    
    [self clearProjectContents];
    [UndoManager.sharedInstance redo];
    [self loadItems];
    self.bgView.backgroundColor = SaveManager.sharedInstance.currentProject.backgroundColor;

}

-(void)clearProjectContents{
    
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        [item.baseView removeFromSuperview];
    }
    
}


@end
