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
    
    [UIView animateWithDuration:0.4 animations:^{
        editingVC.buttonScrollView.alpha = 1.0;
    }];
    
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

    [UIView animateWithDuration:0.4 animations:^{
        editingVC.buttonScrollView.alpha = 1.0;
    }];
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

#pragma mark - 포토프레임 모드 버튼

- (IBAction)photoButtonTapped:(UIButton *)sender {
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (!sender.selected) {
        sender.selected = true;
        self.photoFrameStyleButton.selected = false;
        self.editPhotoButton.selected = false;
        [UIView animateWithDuration:0.2 animations:^{
            self.photoButton.alpha = 1.0;
            self.photoFrameStyleButton.alpha = self.editPhotoButton.alpha = 0.4;
        }];
        [editingVC.albumVC showWithAnimation];
        [self.editingPhotoVC dismissSelf];
    }


}

- (IBAction)photoFrameStyleTapped:(UIButton *)sender {
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (!sender.selected) {
        sender.selected = true;
        self.photoButton.selected = false;
        self.editPhotoButton.selected = false;
        [UIView animateWithDuration:0.2 animations:^{
            self.photoButton.alpha = self.editPhotoButton.alpha = 0.4;
            self.photoFrameStyleButton.alpha = 1.0;
        }];
        [editingVC.albumVC hideWithAnimation];
        [self.editingPhotoVC dismissSelf];
    }

}

- (IBAction)editPhotoButtonTapped:(UIButton *)sender {
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    if (!sender.selected) {
        sender.selected = true;
        self.photoButton.selected = self.photoFrameStyleButton.selected = false;
        [UIView animateWithDuration:0.2 animations:^{
            self.photoButton.alpha = self.photoFrameStyleButton.alpha = 0.4;
            sender.alpha = 1.0;
        }];
        editingVC.currentPhotoFrame.baseView.clipsToBounds = false;
        [editingVC.albumVC hideWithAnimation];
        [self addEditingPhotoVC];
    }

}

-(void)addEditingPhotoVC{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    UIStoryboard *editing = [UIStoryboard storyboardWithName:@"Editing" bundle:NSBundle.mainBundle];
    self.editingPhotoVC = (EditingPhotoButtonViewController *)[editing instantiateViewControllerWithIdentifier:@"EditingPhotoViewController"];
    float height = 150;
    self.editingPhotoVC.view.frame = CGRectMake(0, self.view.frameHeight - height, self.view.frameWidth, height);
    self.editingPhotoVC.view.alpha = 0.0;
    [UIView animateWithDuration:0.2 animations:^{
        self.editingPhotoVC.view.alpha = 1.0;
        self.containerTopConstraint.constant = height + self.collectionView.frameY - self.view.frameHeight;
        [self.view layoutIfNeeded];
    }];
    [self addChildViewController:self.editingPhotoVC];
    [self.view addSubview:self.editingPhotoVC.view];

}

#pragma mark - 취소 버튼

-(void)cancelAddingPhotoFrame{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [self.editingPhotoVC dismissSelf];
    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.albumVC dismissSelf];
    [editingVC.currentPhotoFrame.baseView removeFromSuperview];
    editingVC.buttonScrollView.hidden = false;

}

-(void)cancelEditingPhotoFrame{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    [self.editingPhotoVC dismissSelf];
    [editingVC.currentPhotoFrame.baseView removeFromSuperview];
    editingVC.originalPhotoFrame.baseView.hidden = false;
    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.albumVC dismissSelf];
    editingVC.buttonScrollView.hidden = false;

}

-(void)cancelAddingText{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.currentText.baseView removeFromSuperview];
    [editingVC.currentText.textView resignFirstResponder];
    self.checkButton.enabled = true;
    self.checkButton.alpha = 1.0;
    editingVC.buttonScrollView.hidden = false;


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
    
    if(editingVC.justTyped.length == 0){
    self.checkButton.enabled = true;
    self.checkButton.alpha = 1.0;
    }
    editingVC.buttonScrollView.hidden = false;

    
}

-(void)cancelAddingSticker{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.currentSticker.baseView removeFromSuperview];
    editingVC.buttonScrollView.hidden = false;

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
    editingVC.buttonScrollView.hidden = false;

}


#pragma mark - 체크 버튼


-(void)doneAddingPhotoFrame{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [self.editingPhotoVC dismissSelf];
    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.albumVC dismissSelf];
    [SaveManager.sharedInstance addItem:editingVC.currentPhotoFrame];
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
        item.indexInLayer = [NSString stringWithFormat:@"%ld",[editingVC.view.subviews indexOfObject:item.baseView]];
    }
    editingVC.currentPhotoFrame.plusPhotoImageView.hidden = true;
    [SaveManager.sharedInstance saveAndAddToStack];
    editingVC.buttonScrollView.hidden = false;
    
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
    [editingVC showItemsForNormalMode];
    if (photoFrame.isFixedPhotoFrame) {
        [editingVC.view insertSubview:photoFrame.baseView belowSubview:editingVC.mainFrameImageView];
    } else {
        photoFrame.indexInLayer = [NSString stringWithFormat:@"%ld",editingVC.originalIndexInLayer];
        [editingVC.view insertSubview:photoFrame.baseView atIndex:editingVC.originalIndexInLayer];
    }
    editingVC.currentPhotoFrame.plusPhotoImageView.hidden = true;
    // VC들 없애주기
    [self.editingPhotoVC dismissSelf];
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.albumVC dismissSelf];
    [SaveManager.sharedInstance saveAndAddToStack];
    editingVC.buttonScrollView.hidden = false;

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
        [SaveManager.sharedInstance saveAndAddToStack];

        [editingVC.currentText.textView resignFirstResponder];
    }
    editingVC.buttonScrollView.hidden = false;
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
    [SaveManager.sharedInstance saveAndAddToStack];

    editingVC.buttonScrollView.hidden = false;

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
    [SaveManager.sharedInstance saveAndAddToStack];
    editingVC.buttonScrollView.hidden = false;
   
}

-(void)doneEditingSticker{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.layerController recoverOriginalLayer];
    [editingVC.itemCollectionVC dismissSelf];
    [SaveManager.sharedInstance saveAndAddToStack];
    editingVC.buttonScrollView.hidden = false;

}

@end
