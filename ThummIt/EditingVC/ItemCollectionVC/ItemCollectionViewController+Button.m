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
            [self typoButtonTapped:self.textButton];
        } else if ([editingVC.currentItem isKindOfClass:PhotoFrame.class]){
            [self cancelAddingPhotoFrame];
            [self photoFrameStyleTapped:self.photoFrameStyleButton];
        } else if ([editingVC.currentItem isKindOfClass:Sticker.class]){
            [self cancelAddingSticker];
        }
        
    } else { // 기존 아이템 편집중
        
        if ([editingVC.currentItem isKindOfClass:Text.class]) {
            [self cancelEditingText];
            [self typoButtonTapped:self.textButton];
        } else if ([editingVC.currentItem isKindOfClass:PhotoFrame.class]){
            [self cancelEditingPhotoFrame];
            [self photoFrameStyleTapped:self.photoFrameStyleButton];
        } else if ([editingVC.currentItem isKindOfClass:Sticker.class]){
            [self cancelEditingSticker];
        }
    }
    
    editingVC.modeController.editingMode = NormalMode;
    [editingVC hideAndInitSlider];
    [editingVC showItemsForNormalMode];
    
    editingVC.currentItem = nil;
    editingVC.currentText = nil;
    editingVC.currentPhotoFrame = nil;
    editingVC.currentSticker = nil;

}

- (IBAction)checkButtonTapped:(UIButton *)sender{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (editingVC.modeController.editingMode == AddingItemMode) { // 새로운 아이템 추가중
        
        if ([editingVC.currentItem isKindOfClass:Text.class]) {
            [self doneAddingText];
            [self typoButtonTapped:self.textButton];
        } else if ([editingVC.currentItem isKindOfClass:PhotoFrame.class]){
            [self doneAddingPhotoFrame];
            [self photoFrameStyleTapped:self.photoFrameStyleButton];
        } else if ([editingVC.currentItem isKindOfClass:Sticker.class]){
            [self doneAddingSticker];
        }
        
    } else { // 기존 아이템 편집중
        
        if ([editingVC.currentItem isKindOfClass:Text.class]) {
            [self doneEditingText];
            [self typoButtonTapped:self.textButton];
        } else if ([editingVC.currentItem isKindOfClass:PhotoFrame.class]){
            [self doneEditingPhotoFrame];
            [self photoFrameStyleTapped:self.photoFrameStyleButton];
        } else if ([editingVC.currentItem isKindOfClass:Sticker.class]){
            [self doneEditingSticker];
        }
    }
    editingVC.modeController.editingMode = NormalMode;
    [editingVC hideAndInitSlider];
    [editingVC showItemsForNormalMode];
    
    editingVC.currentItem = nil;
    editingVC.currentSticker = nil;
    editingVC.currentText = nil;
    editingVC.currentPhotoFrame = nil;

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

    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.albumVC dismissSelf];
    [editingVC.currentPhotoFrame.baseView removeFromSuperview];

}

-(void)cancelEditingPhotoFrame{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    [editingVC.currentPhotoFrame.baseView removeFromSuperview];
    editingVC.originalPhotoFrame.baseView.hidden = false;
    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.albumVC dismissSelf];

}

-(void)cancelAddingText{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.currentText.baseView removeFromSuperview];
    [editingVC.currentText.textView resignFirstResponder];

}

-(void)cancelEditingText{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    Text *text = (Text *)editingVC.currentText;
    text.baseView.center = editingVC.originalCenter;
    text.baseView.transform = editingVC.originalTransform;
    text.textView.text = editingVC.originalText;
    text.text = editingVC.originalText;
    text.textView.backgroundAttributedTexts = [NSMutableArray array];
    
    [text applyTypo:editingVC.originalTypo];
    
    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.currentText.textView resignFirstResponder];
    
    
}

-(void)cancelAddingSticker{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.currentSticker.baseView removeFromSuperview];

}

-(void)cancelEditingSticker{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    Sticker *sticker = (Sticker *)editingVC.currentSticker;
    sticker.baseView.center = editingVC.originalCenter;
    sticker.baseView.transform = editingVC.originalTransform;
    sticker.cannotChangeColor = editingVC.originalColorChangable;
    if (!sticker.cannotChangeColor) {
        sticker.backgroundImageView.image = [[UIImage imageNamed:editingVC.originalStickerBGImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [sticker.backgroundImageView setTintColor:editingVC.originalTintColor];
    } else {
        sticker.backgroundImageView.image = [UIImage imageNamed:editingVC.originalStickerBGImageName];
    }
    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];

}


#pragma mark - 체크 버튼


-(void)doneAddingPhotoFrame{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.albumVC dismissSelf];
    [SaveManager.sharedInstance addItem:editingVC.currentPhotoFrame];
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        item.indexInLayer = [NSString stringWithFormat:@"%ld",[editingVC.view.subviews indexOfObject:item.baseView]];
    }
    UIImage *viewImage = [editingVC.view toImage];
    SaveManager.sharedInstance.currentProject.previewImage = [viewImage crop:editingVC.bgView.frame];
    [SaveManager.sharedInstance save];
    
}

-(void)doneEditingPhotoFrame{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    
    // 레이어 되돌려 놓기
    [editingVC.layerController recoverOriginalLayer];
    [editingVC showItemsForNormalMode];
    PhotoFrame *photoFrame = (PhotoFrame *)editingVC.currentPhotoFrame;
    if (photoFrame.isFixedPhotoFrame) {
        [editingVC.view insertSubview:photoFrame.baseView belowSubview:editingVC.backgroundImageView];
    } else {
        photoFrame.indexInLayer = [NSString stringWithFormat:@"%ld",editingVC.originalIndexInLayer];
        [editingVC.view insertSubview:photoFrame.baseView atIndex:editingVC.originalIndexInLayer];
    }

    [SaveManager.sharedInstance deleteItem:editingVC.originalPhotoFrame];
    [SaveManager.sharedInstance addItem:photoFrame];
    // albumVC 없애주기
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.albumVC dismissSelf];
    editingVC.originalPhotoFrameImage = nil;
    UIImage *viewImage = [editingVC.view toImage];
    SaveManager.sharedInstance.currentProject.previewImage = [viewImage crop:editingVC.bgView.frame];
    [SaveManager.sharedInstance save];
}

-(void)doneAddingText{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    
    if (editingVC.currentText.isTypedByUser) {
        [editingVC.currentText.textView resignFirstResponder];
        [SaveManager.sharedInstance addItem:editingVC.currentText];
        for (Item *item in SaveManager.sharedInstance.currentProject.items) {
            item.indexInLayer = [NSString stringWithFormat:@"%ld",[editingVC.view.subviews indexOfObject:item.baseView]];
        }
        UIImage *viewImage = [editingVC.view toImage];
        SaveManager.sharedInstance.currentProject.previewImage = [viewImage crop:editingVC.bgView.frame];
        [SaveManager.sharedInstance save];

        [editingVC.currentText.textView resignFirstResponder];
    }
    
}

-(void)doneEditingText{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];

    [SaveManager.sharedInstance addItem:editingVC.currentText];
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
    item.indexInLayer = [NSString stringWithFormat:@"%ld",[editingVC.view.subviews indexOfObject:item.baseView]];
    }


    [editingVC.currentText.textView resignFirstResponder];
    UIImage *viewImage = [editingVC.view toImage];
    SaveManager.sharedInstance.currentProject.previewImage = [viewImage crop:editingVC.bgView.frame];
    [SaveManager.sharedInstance save];

    

}

-(void)doneAddingSticker{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [SaveManager.sharedInstance addItem:editingVC.currentSticker];
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        item.indexInLayer = [NSString stringWithFormat:@"%ld",[editingVC.view.subviews indexOfObject:item.baseView]];
    }
    UIImage *viewImage = [editingVC.view toImage];
    SaveManager.sharedInstance.currentProject.previewImage = [viewImage crop:editingVC.bgView.frame];
    [SaveManager.sharedInstance save];

   
}

-(void)doneEditingSticker{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.layerController recoverOriginalLayer];
    [editingVC.itemCollectionVC dismissSelf];
    UIImage *viewImage = [editingVC.view toImage];
    SaveManager.sharedInstance.currentProject.previewImage = [viewImage crop:editingVC.bgView.frame];
    [SaveManager.sharedInstance save];


}

@end
