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
        
        if ([editingVC.currentItem isKindOfClass:Photo.class]) {
            self.photoButton.selected= true;
            self.photoButton.alpha = 1.0;
            self.editPhotoButton.selected= false;
            self.editPhotoButton.alpha = 0.4;
            [self cancelAddingPhoto];
        }  else if ([editingVC.currentItem isKindOfClass:PhotoFrame.class]){
            [self cancelAddingPhotoFrame];
            [self photoFramePhotoButtonTapped:self.photoFramePhotoButton];
        } else if ([editingVC.currentItem isKindOfClass:Text.class]) {
            [self cancelAddingText];
            [self typoButtonTapped:self.textButton];
        }else if ([editingVC.currentItem isKindOfClass:Sticker.class]){
            [self cancelAddingSticker];
        }
        
    } else { // 기존 아이템 편집중
        
        if ([editingVC.currentItem isKindOfClass:Photo.class]) {
            self.photoButton.selected= true;
            self.photoButton.alpha = 1.0;
            self.editPhotoButton.selected= false;
            self.editPhotoButton.alpha = 0.4;

            [self cancelEditingPhoto];
        }  else if ([editingVC.currentItem isKindOfClass:PhotoFrame.class]){
            [self cancelEditingPhotoFrame];
            [self photoFramePhotoButtonTapped:self.photoFramePhotoButton];
        }else if ([editingVC.currentItem isKindOfClass:Text.class]) {
            [self cancelEditingText];
            [self typoButtonTapped:self.textButton];
        } else if ([editingVC.currentItem isKindOfClass:Sticker.class]){
            [self cancelEditingSticker];
        } else {
            [self cancelEditingMainFrame];
        }
    }
    
    editingVC.modeController.editingMode = NormalMode;
    [editingVC hideAndInitSlider];
    [editingVC showItemsForNormalMode];
    
    editingVC.currentItem = nil;
    editingVC.currentText = nil;
    editingVC.currentPhotoFrame = nil;
    editingVC.currentSticker = nil;
    editingVC.currentPhoto = nil;
    [UIView animateWithDuration:0.4 animations:^{
        editingVC.buttonScrollView.alpha = 1.0;
    }];
    
}

- (IBAction)doneButtonTapped:(UIButton *)sender{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (editingVC.modeController.editingMode == AddingItemMode) { // 새로운 아이템 추가중
        if ([editingVC.currentItem isKindOfClass:Photo.class]) {
            [self doneAddingPhoto];
            self.photoButton.selected= true;
            self.photoButton.alpha = 1.0;
            self.editPhotoButton.selected= false;
            self.editPhotoButton.alpha = 0.4;
        } else if ([editingVC.currentItem isKindOfClass:PhotoFrame.class]){
            [self doneAddingPhotoFrame];
            [self photoFramePhotoButtonTapped:self.photoFramePhotoButton];
        } else if ([editingVC.currentItem isKindOfClass:Text.class]) {
            [self doneAddingText];
            [self typoButtonTapped:self.textButton];
        } else if ([editingVC.currentItem isKindOfClass:Sticker.class]){
            [self doneAddingSticker];
        }
        
    } else { // 기존 아이템 편집중
        
        if ([editingVC.currentItem isKindOfClass:Photo.class]) {
            [self doneEditingPhoto];
            self.photoButton.selected= true;
            self.photoButton.alpha = 1.0;
            self.editPhotoButton.selected= false;
            self.editPhotoButton.alpha = 0.4;
        }else if ([editingVC.currentItem isKindOfClass:PhotoFrame.class]){
            [self doneEditingPhotoFrame];
            [self photoFramePhotoButtonTapped:self.photoFramePhotoButton];
        } else if ([editingVC.currentItem isKindOfClass:Text.class]) {
            [self doneEditingText];
            [self typoButtonTapped:self.textButton];
        }  else if ([editingVC.currentItem isKindOfClass:Sticker.class]){
            [self doneEditingSticker];
        } else {
            [self doneEditingMainFrame];
        }
    }
    editingVC.modeController.editingMode = NormalMode;
    [editingVC hideAndInitSlider];
    [editingVC showItemsForNormalMode];
    
    editingVC.currentItem = nil;
    editingVC.currentSticker = nil;
    editingVC.currentText = nil;
    editingVC.currentPhotoFrame = nil;
    editingVC.currentPhoto = nil;
    [UIView animateWithDuration:0.4 animations:^{
        editingVC.buttonScrollView.alpha = 1.0;
    }];
}

#pragma mark - 포토 버튼

- (IBAction)photoButtonTapped:(UIButton *)sender {
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (!sender.selected) {
        sender.selected = true;
        [editingVC.editingPhotoVC dismissSelf];
        [editingVC.editingPhotoButtonVC dismissSelf];

        self.editPhotoButton.selected = false;
        [editingVC.albumVC showWithAnimation];
        [UIView animateWithDuration:0.2 animations:^{
            editingVC.itemCollectionTopConstraint.constant = 0;
            [editingVC.view layoutIfNeeded];
            self.photoButton.alpha = 1.0;
            self.editPhotoButton.alpha = 0.4;
        }];
    }

}


- (IBAction)editPhotoButtonTapped:(UIButton *)sender {
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (!sender.selected) {
        [editingVC.albumVC hideWithAnimation];
        [self addEditingPhotoVC];
        sender.selected = true;
        self.photoButton.selected = false;
        [UIView animateWithDuration:0.2 animations:^{
            self.photoButton.alpha = 0.4;
            self.editPhotoButton.alpha = 1.0;
        }];
    }
    
}

-(void)addEditingPhotoVC{

    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    
    float screenHeight = UIScreen.mainScreen.bounds.size.height;
    float buttonViewHeight = screenHeight*0.2;
    float editingPhotoVCHeight = screenHeight*0.8;
    editingVC.editingPhotoVC.view.frame = CGRectMake(0, 0, editingVC.view.frameWidth, editingPhotoVCHeight);
    editingVC.editingPhotoButtonVC.view.frame = CGRectMake(0, editingPhotoVCHeight, editingVC.view.frameWidth, buttonViewHeight);

    editingVC.editingPhotoVC.view.alpha = 0;
    editingVC.editingPhotoButtonVC.view.alpha = 0;
    [UIView animateWithDuration:0.4 animations:^{
        editingVC.editingPhotoVC.view.alpha = 1.0;
        editingVC.editingPhotoButtonVC.view.alpha = 1.0;
        editingVC.itemCollectionTopConstraint.constant = self.view.frameHeight - buttonViewHeight - self.cancelButton.frameHeight;
        [editingVC.view layoutIfNeeded];
    }];

    UIImage *photoImage = editingVC.currentPhoto.photoImageView.image;

    editingVC.editingPhotoVC.photoImageView = [[UIImageView alloc] init];
    editingVC.editingPhotoVC.photoImageView.contentMode = UIViewContentModeScaleAspectFit;
    editingVC.editingPhotoVC.photoImageView.image = photoImage;
    editingVC.editingPhotoVC.photoImageView.center = editingVC.editingPhotoVC.view.center;

    [editingVC.editingPhotoVC.contentView addSubview:editingVC.editingPhotoVC.photoImageView];

    editingVC.editingPhotoButtonVC.delegate = editingVC.editingPhotoVC;
    editingVC.editingPhotoVC.includeButton = editingVC.editingPhotoButtonVC.includeButton;
    editingVC.editingPhotoVC.eraseButton = editingVC.editingPhotoButtonVC.eraseButton;
    [editingVC addChildViewController:editingVC.editingPhotoVC];
    [editingVC.view insertSubview:editingVC.editingPhotoVC.view belowSubview:editingVC.itemCollectionContainerView];
    
    [editingVC addChildViewController:editingVC.editingPhotoButtonVC];
    [editingVC.view insertSubview:editingVC.editingPhotoButtonVC.view aboveSubview:editingVC.itemCollectionContainerView];

}



#pragma mark - 포토프레임 모드 버튼

- (IBAction)photoFramePhotoButtonTapped:(UIButton *)sender {
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (!sender.selected) {
        sender.selected = true;

        self.photoFrameStyleButton.selected = false;
        [UIView animateWithDuration:0.2 animations:^{
            [self.view layoutIfNeeded];
            self.photoFramePhotoButton.alpha = 1.0;
            self.photoFrameStyleButton.alpha = 0.4;
        }];
        [editingVC.albumVC showWithAnimation];
    }


}

- (IBAction)photoFrameStyleTapped:(UIButton *)sender {
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (!sender.selected) {
        sender.selected = true;
        
        self.photoFramePhotoButton.selected = false;
        [UIView animateWithDuration:0.2 animations:^{
            [self.view layoutIfNeeded];

            self.photoFramePhotoButton.alpha = 0.4;
            self.photoFrameStyleButton.alpha = 1.0;
        }];
        [editingVC.albumVC hideWithAnimation];
    }

}


#pragma mark - 타이포 모드 버튼

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

#pragma mark - 취소 버튼

#pragma mark - 포토
-(void)cancelAddingPhoto{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    [editingVC.editingPhotoVC dismissSelf];
    [editingVC.editingPhotoButtonVC dismissSelf];
    [self dismissSelf];
    [editingVC.layerController hideTransparentView];
    [editingVC.albumVC dismissSelf];
    
    [editingVC.currentItem.baseView removeFromSuperview];
    editingVC.modeController.editingMode = NormalMode;
    
}

-(void)cancelEditingPhoto{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    
    [editingVC.currentPhoto.baseView removeFromSuperview];
    editingVC.originalPhoto.baseView.hidden = false;
    [editingVC.layerController hideTransparentView];
    [self dismissSelf];
    [editingVC.albumVC dismissSelf];
    editingVC.modeController.editingMode = NormalMode;

}

#pragma mark - 포토프레임
-(void)cancelAddingPhotoFrame{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC.layerController hideTransparentView];
    [self dismissSelf];
    [editingVC.albumVC dismissSelf];
    [editingVC.currentPhotoFrame.baseView removeFromSuperview];
    editingVC.modeController.editingMode = NormalMode;

}

-(void)cancelEditingPhotoFrame{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC.currentPhotoFrame.baseView removeFromSuperview];
    editingVC.originalPhotoFrame.baseView.hidden = false;
    [editingVC.layerController hideTransparentView];
    [self dismissSelf];
    [editingVC.albumVC dismissSelf];
    editingVC.modeController.editingMode = NormalMode;

}

#pragma mark - 텍스트
-(void)cancelAddingText{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC.layerController hideTransparentView];
    [self dismissSelf];
    [editingVC.currentText.baseView removeFromSuperview];
    [editingVC.currentText.textView resignFirstResponder];
    self.doneButton.enabled = true;
    self.doneButton.alpha = 1.0;
    editingVC.modeController.editingMode = NormalMode;

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
    
    [editingVC.layerController hideTransparentView];
    [self dismissSelf];
    [editingVC.currentText.textView resignFirstResponder];
    
    if(editingVC.justTyped.length == 0){
    self.doneButton.enabled = true;
    self.doneButton.alpha = 1.0;
    }
    editingVC.modeController.editingMode = NormalMode;
    
}

#pragma mark - 스티커
-(void)cancelAddingSticker{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC.layerController hideTransparentView];
    [self dismissSelf];
    [editingVC.currentSticker.baseView removeFromSuperview];
    editingVC.modeController.editingMode = NormalMode;

}

-(void)cancelEditingSticker{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    Sticker *sticker = (Sticker *)editingVC.currentSticker;
    sticker.baseView.center = editingVC.originalCenter;
    sticker.baseView.transform = editingVC.originalTransform;
    sticker.canChangeColor = editingVC.originalColorChangable;
    if (sticker.canChangeColor) {
        sticker.backgroundImageView.image = [[UIImage imageNamed:editingVC.originalStickerBGImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [sticker.backgroundImageView setTintColor:editingVC.originalTintColor];
    } else {
        sticker.backgroundImageView.image = [UIImage imageNamed:editingVC.originalStickerBGImageName];
    }
    [editingVC.layerController hideTransparentView];
    [self dismissSelf];
    editingVC.modeController.editingMode = NormalMode;

}


#pragma mark - 메인프레임
-(void)cancelEditingMainFrame{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    
    editingVC.mainFrameImageView.image = [UIImage imageNamed:editingVC.originalMainFrameImageName];
    [self dismissSelf];
    editingVC.modeController.editingMode = NormalMode;
    
}


#pragma mark - Done 버튼

#pragma mark - 포토

-(void)doneAddingPhoto{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    [editingVC.editingPhotoVC dismissSelf];
    [editingVC.editingPhotoButtonVC dismissSelf];
    [editingVC.layerController hideTransparentView];
    [self dismissSelf];
    [editingVC.albumVC dismissSelf];
    [SaveManager.sharedInstance addItem:editingVC.currentPhoto];
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        item.indexInLayer = [NSString stringWithFormat:@"%ld",[editingVC.view.subviews indexOfObject:item.baseView]];
    }
    [SaveManager.sharedInstance saveAndAddToStack];
    editingVC.modeController.editingMode = NormalMode;
    
}

-(void)doneEditingPhoto{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    Photo *photo = (Photo *)editingVC.currentPhoto;

    // 원래거 삭제하고 지금 편집하던거 넣기
    [SaveManager.sharedInstance deleteItem:editingVC.originalPhoto];
    [editingVC.originalPhoto.baseView removeFromSuperview];
    [SaveManager.sharedInstance addItem:photo];
    
    // 레이어 되돌려 놓기
    [editingVC.layerController recoverOriginalLayer];
    photo.indexInLayer = [NSString stringWithFormat:@"%ld",editingVC.originalIndexInLayer];
    [editingVC.view insertSubview:photo.baseView atIndex:editingVC.originalIndexInLayer];

    // VC들 없애주기
    [self dismissSelf];
    [editingVC.albumVC dismissSelf];
    [SaveManager.sharedInstance saveAndAddToStack];
    
    editingVC.modeController.editingMode = NormalMode;
    
}

#pragma mark - 포토프레임
-(void)doneAddingPhotoFrame{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    [editingVC.layerController hideTransparentView];
    [self dismissSelf];
    [editingVC.albumVC dismissSelf];
    [SaveManager.sharedInstance addItem:editingVC.currentPhotoFrame];
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        item.indexInLayer = [NSString stringWithFormat:@"%ld",[editingVC.view.subviews indexOfObject:item.baseView]];
    }
    editingVC.currentPhotoFrame.plusPhotoImageView.hidden = true;
    [SaveManager.sharedInstance saveAndAddToStack];
    editingVC.modeController.editingMode = NormalMode;

}

-(void)doneEditingPhotoFrame{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    PhotoFrame *photoFrame = (PhotoFrame *)editingVC.currentPhotoFrame;

    // 원래거 삭제하고 지금 편집하던거 넣기
    [SaveManager.sharedInstance deleteItem:editingVC.originalPhotoFrame];
    [editingVC.originalPhotoFrame.baseView removeFromSuperview];
    [SaveManager.sharedInstance addItem:photoFrame];

    // 레이어 되돌려 놓기
    [editingVC.layerController recoverOriginalLayer];
    if (photoFrame.isFixedPhotoFrame) {
        [editingVC.view insertSubview:photoFrame.baseView belowSubview:editingVC.mainFrameImageView];
    } else {
        photoFrame.indexInLayer = [NSString stringWithFormat:@"%ld",editingVC.originalIndexInLayer];
        [editingVC.view insertSubview:photoFrame.baseView atIndex:editingVC.originalIndexInLayer];
    }
    editingVC.currentPhotoFrame.plusPhotoImageView.hidden = true;
    // VC들 없애주기
    [self dismissSelf];
    [editingVC.albumVC dismissSelf];
    [SaveManager.sharedInstance saveAndAddToStack];

    editingVC.modeController.editingMode = NormalMode;
}

#pragma mark - 텍스트
-(void)doneAddingText{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC.layerController hideTransparentView];
    [self dismissSelf];
    
    if (editingVC.currentText.isTypedByUser) {
        [editingVC.currentText.textView resignFirstResponder];
        [SaveManager.sharedInstance addItem:editingVC.currentText];
        for (Item *item in SaveManager.sharedInstance.currentProject.items) {
            item.indexInLayer = [NSString stringWithFormat:@"%ld",[editingVC.view.subviews indexOfObject:item.baseView]];
        }
        [SaveManager.sharedInstance saveAndAddToStack];

        [editingVC.currentText.textView resignFirstResponder];
    }
    
    editingVC.modeController.editingMode = NormalMode;
}

-(void)doneEditingText{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC.layerController hideTransparentView];
    [self dismissSelf];

    [SaveManager.sharedInstance addItem:editingVC.currentText];
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
    item.indexInLayer = [NSString stringWithFormat:@"%ld",[editingVC.view.subviews indexOfObject:item.baseView]];
    }


    [editingVC.currentText.textView resignFirstResponder];
    [SaveManager.sharedInstance saveAndAddToStack];

    editingVC.modeController.editingMode = NormalMode;
}

#pragma mark - 스티커
-(void)doneAddingSticker{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC.layerController hideTransparentView];
    [self dismissSelf];
    [SaveManager.sharedInstance addItem:editingVC.currentSticker];
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        item.indexInLayer = [NSString stringWithFormat:@"%ld",[editingVC.view.subviews indexOfObject:item.baseView]];
    }
    [SaveManager.sharedInstance saveAndAddToStack];
    editingVC.modeController.editingMode = NormalMode;
   
}

-(void)doneEditingSticker{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC.layerController hideTransparentView];
    [editingVC.layerController recoverOriginalLayer];
    [self dismissSelf];
    [SaveManager.sharedInstance saveAndAddToStack];
    editingVC.modeController.editingMode = NormalMode;

}

#pragma mark - 메인프레임
-(void)doneEditingMainFrame{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [self dismissSelf];

    [SaveManager.sharedInstance saveAndAddToStack];
    editingVC.modeController.editingMode = NormalMode;
    
}

@end
