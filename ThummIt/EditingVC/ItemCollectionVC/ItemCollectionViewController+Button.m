//
//  ItemCollectionViewController+Button.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/10.
//

#import "ItemCollectionViewController+Button.h"
#import "EditingViewController.h"
#import "EditingViewController+Buttons.h"
#import "UIImage+Additions.h"

@implementation ItemCollectionViewController (Button)


- (IBAction)cancelButtonTapped:(UIButton *)sender{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (editingVC.modeController.editingMode == AddingItemMode) { // 새로운 아이템 추가중
        
        if ([editingVC.currentItem isKindOfClass:Text.class]) {
            [self cancelAddingText];
            [self typoButtonTapped:self.photoFrameStyleButton];
        } else if ([editingVC.currentItem isKindOfClass:PhotoFrame.class]){
            [self cancelAddingPhotoFrame];
            [self photoFrameStyleTapped:self.photoFrameStyleButton];
        } else if ([editingVC.currentItem isKindOfClass:Sticker.class]){
            [self cancelAddingSticker];
        }
        
    } else { // 기존 아이템 편집중
        
        if ([editingVC.currentItem isKindOfClass:Text.class]) {
            [self cancelEditingText];
            [self typoButtonTapped:self.photoFrameStyleButton];
        } else if ([editingVC.currentItem isKindOfClass:PhotoFrame.class]){
            [self cancelEditingPhotoFrame];
            [self photoFrameStyleTapped:self.photoFrameStyleButton];
        } else if ([editingVC.currentItem isKindOfClass:Sticker.class]){
            [self cancelEditingSticker];
        }
    }
    
    editingVC.modeController.editingMode = NormalMode;
    [editingVC hideAndInitSlider];
    [editingVC showNavigationItems];
    
}

- (IBAction)checkButtonTapped:(UIButton *)sender{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (editingVC.modeController.editingMode == AddingItemMode) { // 새로운 아이템 추가중
        
        if ([editingVC.currentItem isKindOfClass:Text.class]) {
            [self doneAddingText];
            [self typoButtonTapped:self.photoFrameStyleButton];
        } else if ([editingVC.currentItem isKindOfClass:PhotoFrame.class]){
            [self doneAddingPhotoFrame];
            [self photoFrameStyleTapped:self.photoFrameStyleButton];
        } else if ([editingVC.currentItem isKindOfClass:Sticker.class]){
            [self doneAddingSticker];
        }
        
    } else { // 기존 아이템 편집중
        
        if ([editingVC.currentItem isKindOfClass:Text.class]) {
            [self doneEditingText];
            [self typoButtonTapped:self.photoFrameStyleButton];
        } else if ([editingVC.currentItem isKindOfClass:PhotoFrame.class]){
            [self doneEditingPhotoFrame];
            [self photoFrameStyleTapped:self.photoFrameStyleButton];
        } else if ([editingVC.currentItem isKindOfClass:Sticker.class]){
            [self doneEditingSticker];
        }
    }
    editingVC.modeController.editingMode = NormalMode;
    [editingVC hideAndInitSlider];
    [editingVC showNavigationItems];

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
    }

}


#pragma mark - 취소 버튼

-(void)cancelAddingPhotoFrame{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showNavigationItems];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.albumVC dismissSelf];
    [editingVC.currentItem.baseView removeFromSuperview];
    editingVC.currentItem = nil;
    editingVC.currentPhotoFrame = nil;

}

-(void)cancelEditingPhotoFrame{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    [editingVC.currentItem.baseView removeFromSuperview];
    
    for (PhotoFrame *photoFrame in SaveManager.sharedInstance.currentProject.photoFrames) {
        if (photoFrame == editingVC.originalPhotoFrame) {
            [editingVC.view insertSubview:photoFrame.baseView atIndex:editingVC.originalIndexInLayer];
            break;
        }
    }
    [editingVC showNavigationItems];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];

    editingVC.currentItem = nil;
    editingVC.currentText = nil;
}

-(void)cancelAddingText{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showNavigationItems];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.currentItem.baseView removeFromSuperview];
    [editingVC.currentText.textView resignFirstResponder];
    editingVC.currentItem = nil;
    editingVC.currentText = nil;

}

-(void)cancelEditingText{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    Text *text = (Text *)editingVC.currentItem;
    text.baseView.center = editingVC.originalCenter;
    text.baseView.transform = editingVC.originalTransform;
    text.textView.text = editingVC.originalText;
    text.text = editingVC.originalText;
    text.textView.backgroundAttributedTexts = [NSMutableArray array];
    
    [text applyTypo:editingVC.originalTypo];
    
    [editingVC showNavigationItems];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.currentText.textView resignFirstResponder];
    
    editingVC.currentItem = nil;
    editingVC.currentText = nil;
    
}

-(void)cancelAddingSticker{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showNavigationItems];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.currentItem.baseView removeFromSuperview];
    editingVC.currentItem = nil;
    editingVC.currentText = nil;

}

-(void)cancelEditingSticker{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    Sticker *sticker = (Sticker *)editingVC.currentItem;
    [sticker.baseView removeFromSuperview];
    for (Sticker *sticker in SaveManager.sharedInstance.currentProject.stickers) {
        if (sticker == editingVC.originalSticker) {
            [editingVC.view insertSubview:sticker.baseView atIndex:editingVC.originalIndexInLayer];
            break;
        }
    }
    [editingVC showNavigationItems];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];

    editingVC.currentItem = nil;
    editingVC.currentText = nil;

}


#pragma mark - 체크 버튼


-(void)doneAddingPhotoFrame{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showNavigationItems];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.albumVC dismissSelf];
    [SaveManager.sharedInstance addItem:editingVC.currentItem];
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        item.indexInLayer = [NSString stringWithFormat:@"%ld",[editingVC.view.subviews indexOfObject:item.baseView]];
    }
    UIImage *viewImage = [editingVC.view toImage];
    SaveManager.sharedInstance.currentProject.previewImage = [viewImage crop:editingVC.bgView.frame];
    [SaveManager.sharedInstance save];
    
    editingVC.currentItem = nil;
    editingVC.currentPhotoFrame = nil;
}

-(void)doneEditingPhotoFrame{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    
    // 레이어 되돌려 놓기
    [editingVC.layerController recoverOriginalLayer];
    [editingVC showNavigationItems];
    PhotoFrame *photoFrame = (PhotoFrame *)editingVC.currentItem;
    photoFrame.phAsset = PhotoManager.sharedInstance.phassets[editingVC.albumVC.selectedIndexPath.item];
    photoFrame.indexInLayer = [NSString stringWithFormat:@"%ld",editingVC.originalIndexInLayer];
    [editingVC.view insertSubview:photoFrame.baseView atIndex:editingVC.originalIndexInLayer];
    
    [SaveManager.sharedInstance deleteItem:editingVC.originalPhotoFrame];
    [SaveManager.sharedInstance addItem:photoFrame];

    // albumVC 없애주기
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.albumVC dismissSelf];
    
    editingVC.originalPhotoFrameImage = nil;
    editingVC.currentItem = nil;
    UIImage *viewImage = [editingVC.view toImage];
    SaveManager.sharedInstance.currentProject.previewImage = [viewImage crop:editingVC.bgView.frame];
    [SaveManager.sharedInstance save];
}

-(void)doneAddingText{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showNavigationItems];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    
    if (editingVC.currentText.isTypedByUser) {
        [editingVC.currentText.textView resignFirstResponder];
        [SaveManager.sharedInstance addItem:editingVC.currentItem];
        for (Item *item in SaveManager.sharedInstance.currentProject.items) {
            item.indexInLayer = [NSString stringWithFormat:@"%ld",[editingVC.view.subviews indexOfObject:item.baseView]];
        }
        UIImage *viewImage = [editingVC.view toImage];
        SaveManager.sharedInstance.currentProject.previewImage = [viewImage crop:editingVC.bgView.frame];
        [SaveManager.sharedInstance save];

        [editingVC.currentText.textView resignFirstResponder];
        editingVC.currentItem = nil;
        editingVC.currentText = nil;
    }
    
}

-(void)doneEditingText{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showNavigationItems];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];

    [SaveManager.sharedInstance addItem:editingVC.currentItem];
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
    item.indexInLayer = [NSString stringWithFormat:@"%ld",[editingVC.view.subviews indexOfObject:item.baseView]];
    }


    [editingVC.currentText.textView resignFirstResponder];
    UIImage *viewImage = [editingVC.view toImage];
    SaveManager.sharedInstance.currentProject.previewImage = [viewImage crop:editingVC.bgView.frame];
    [SaveManager.sharedInstance save];

    editingVC.currentItem = nil;
    editingVC.currentText = nil;
    

}

-(void)doneAddingSticker{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showNavigationItems];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [SaveManager.sharedInstance addItem:editingVC.currentItem];
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        item.indexInLayer = [NSString stringWithFormat:@"%ld",[editingVC.view.subviews indexOfObject:item.baseView]];
    }
    UIImage *viewImage = [editingVC.view toImage];
    SaveManager.sharedInstance.currentProject.previewImage = [viewImage crop:editingVC.bgView.frame];
    [SaveManager.sharedInstance save];

    editingVC.currentItem = nil;
    editingVC.currentSticker = nil;//일단해둠
   
}

-(void)doneEditingSticker{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showNavigationItems];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [SaveManager.sharedInstance addItem:editingVC.currentItem];
    [SaveManager.sharedInstance deleteItem:editingVC.originalSticker];
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        item.indexInLayer = [NSString stringWithFormat:@"%ld",[editingVC.view.subviews indexOfObject:item.baseView]];
    }
    UIImage *viewImage = [editingVC.view toImage];
    SaveManager.sharedInstance.currentProject.previewImage = [viewImage crop:editingVC.bgView.frame];
    [SaveManager.sharedInstance save];


    editingVC.currentItem = nil;
    editingVC.currentSticker = nil;//일단해둠
}

@end
