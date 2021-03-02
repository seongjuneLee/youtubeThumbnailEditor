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
        } else {
            [self cancelEditingMainFrame];
            // undo redo, donebutton눌렸을시 세이브매니저에도 업데이트해야되고, colorchange없앨거고
        }
    }
    
    editingVC.modeController.editingMode = NormalMode;
    [editingVC hideAndInitSlider];
    [editingVC showItemsForNormalMode];
    
    editingVC.currentItem = nil;
    editingVC.currentText = nil;
    editingVC.currentPhotoFrame = nil;
    editingVC.currentSticker = nil;
    editingVC.layerController.currentItemLayer = nil;
    
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
        
        [self doneAddingItemLayer];
        
    } else{ // 기존 아이템 편집중
        
        if ([editingVC.currentItem isKindOfClass:Text.class]) {
            [self doneEditingText];
            [self typoButtonTapped:self.textButton];
        } else if ([editingVC.currentItem isKindOfClass:PhotoFrame.class]){
            [self doneEditingPhotoFrame];
            [self photoFrameStyleTapped:self.photoFrameStyleButton];
        } else if ([editingVC.currentItem isKindOfClass:Sticker.class]){
            [self doneEditingSticker];
        } else {
            [self doneEditingMainFrame];
        }
        
        [self doneEditingItemLayer];
    }
    editingVC.modeController.editingMode = NormalMode;
    [editingVC hideAndInitSlider];
    [editingVC showItemsForNormalMode];

    editingVC.currentItem = nil;
    editingVC.currentSticker = nil;
    editingVC.currentText = nil;
    editingVC.currentPhotoFrame = nil;
    editingVC.layerController.currentItemLayer = nil;

    [UIView animateWithDuration:0.4 animations:^{
        editingVC.buttonScrollView.alpha = 1.0;
    }];
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
    editingVC.buttonScrollView.hidden = false;
    editingVC.modeController.editingMode = NormalMode;

}

-(void)cancelEditingPhotoFrame{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    
    [editingVC.currentPhotoFrame.baseView removeFromSuperview];
    editingVC.originalPhotoFrame.baseView.hidden = false;
    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.layerController recoverOriginalLayer];//
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.albumVC dismissSelf];
    editingVC.buttonScrollView.hidden = false;
    editingVC.modeController.editingMode = NormalMode;

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
    
    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.currentText.textView resignFirstResponder];
    
    if(editingVC.justTyped.length == 0){
    self.checkButton.enabled = true;
    self.checkButton.alpha = 1.0;
    }
    editingVC.buttonScrollView.hidden = false;
    editingVC.modeController.editingMode = NormalMode;
    [editingVC.layerController recoverOriginalLayer];//
    
}

-(void)cancelAddingSticker{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.currentSticker.baseView removeFromSuperview];
    editingVC.buttonScrollView.hidden = false;
    editingVC.modeController.editingMode = NormalMode;

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
    [editingVC.layerController recoverOriginalLayer];//
    [editingVC.itemCollectionVC dismissSelf];
    editingVC.buttonScrollView.hidden = false;
    editingVC.modeController.editingMode = NormalMode;

}

-(void)cancelEditingMainFrame{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    
    editingVC.mainFrameImageView.image = [UIImage imageNamed:editingVC.originalMainFrameImageName];
    [editingVC.itemCollectionVC dismissSelf];
    editingVC.buttonScrollView.hidden = false;
    editingVC.modeController.editingMode = NormalMode;
    
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
    editingVC.currentPhotoFrame.plusPhotoImageView.hidden = true;
    [SaveManager.sharedInstance saveAndAddToStack];
    editingVC.buttonScrollView.hidden = false;
    editingVC.modeController.editingMode = NormalMode;
    
}

-(void)doneEditingPhotoFrame{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    PhotoFrame *photoFrame = (PhotoFrame *)editingVC.currentPhotoFrame;

    // 원래거 삭제하고 지금 편집하던거 넣기
    [SaveManager.sharedInstance deleteItem:editingVC.originalPhotoFrame];
    [editingVC.originalPhotoFrame.baseView removeFromSuperview];
    [SaveManager.sharedInstance addItem:photoFrame];
    
//    // 레이어 되돌려 놓기
//    [editingVC.layerController recoverOriginalLayer];
//    [editingVC showItemsForNormalMode];원래있었음
    if (photoFrame.isFixedPhotoFrame) {
        [editingVC.view insertSubview:photoFrame.baseView belowSubview:editingVC.mainFrameImageView];
    } else {
        photoFrame.indexInLayer = [NSString stringWithFormat:@"%ld",editingVC.originalIndexInLayer];
        [editingVC.view insertSubview:photoFrame.baseView atIndex:editingVC.originalIndexInLayer];
    }
    editingVC.currentPhotoFrame.plusPhotoImageView.hidden = true;
    // albumVC 없애주기
    [editingVC.itemCollectionVC dismissSelf];
    [editingVC.albumVC dismissSelf];
    [SaveManager.sharedInstance saveAndAddToStack];
    editingVC.buttonScrollView.hidden = false;

    editingVC.modeController.editingMode = NormalMode;
    [editingVC.layerController recoverOriginalLayer];//

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
    
    editingVC.modeController.editingMode = NormalMode;
}

-(void)doneEditingText{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.layerController recoverOriginalLayer];//
    [editingVC.itemCollectionVC dismissSelf];

    [SaveManager.sharedInstance addItem:editingVC.currentText];
    for (Item *item in SaveManager.sharedInstance.currentProject.items) {
    item.indexInLayer = [NSString stringWithFormat:@"%ld",[editingVC.view.subviews indexOfObject:item.baseView]];
    }


    [editingVC.currentText.textView resignFirstResponder];
    [SaveManager.sharedInstance saveAndAddToStack];

    editingVC.buttonScrollView.hidden = false;
    editingVC.modeController.editingMode = NormalMode;
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
    editingVC.modeController.editingMode = NormalMode;
   
}

-(void)doneEditingSticker{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showItemsForNormalMode];
    [editingVC.layerController hideTransparentView];
    [editingVC.itemCollectionVC dismissSelf];
    [SaveManager.sharedInstance saveAndAddToStack];
    editingVC.buttonScrollView.hidden = false;
    editingVC.modeController.editingMode = NormalMode;
    [editingVC.layerController recoverOriginalLayer];//

}

-(void)doneEditingMainFrame{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [editingVC showItemsForNormalMode];
    [editingVC.itemCollectionVC dismissSelf];

    [SaveManager.sharedInstance saveAndAddToStack];
    editingVC.buttonScrollView.hidden = false;
    editingVC.modeController.editingMode = NormalMode;
    
}

-(void)doneAddingItemLayer{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
   
    //itemlayers에 추가되기 전이므로 +1
    NSInteger numberOfItemLayersAfterAdding = [SaveManager.sharedInstance.currentProject.itemLayers count] + 1;
    ItemLayer *itemLayer = [ItemLayer new];

    itemLayer.item = editingVC.currentItem;
    [itemLayer makeView];
    
    float itemLayerX = (editingVC.itemLayerContentView.frameWidth)/2;
    float itemLayerY = (editingVC.itemLayerContentView.frameHeight)-(itemLayer.barBaseView.frameHeight/2)*(3*numberOfItemLayersAfterAdding-1);
    
    itemLayer.barBaseView.center = CGPointMake(itemLayerX, itemLayerY);
    itemLayer.originalCenterY = itemLayerY;

    [editingVC.itemLayerContentView addSubview:itemLayer.barBaseView];
    
    [editingVC.layerController addItemLayerGestureRecognizers:itemLayer];
    
    [SaveManager.sharedInstance.currentProject.itemLayers addObject:itemLayer];
    itemLayer.itemLayerIndex =[SaveManager.sharedInstance.currentProject.itemLayers indexOfObject:itemLayer];
    
    //추가되는 아이템에 맞추어 itemlayercontentview크기 늘려줌
    editingVC.itemLayerContentViewHeightConstraint.constant = -editingVC.itemLayerScrollView.frameHeight + (itemLayer.barBaseViewHeight/2)*(3*numberOfItemLayersAfterAdding + 1);
    [editingVC.itemLayerScrollView setContentSize:CGSizeMake(editingVC.itemLayerContentView.frameWidth, editingVC.itemLayerContentView.frameHeight)];
   
    
    //contentview는 아래로 넓어지므로 그에 맞추어 객체들의 실제 위치 & 위치값 모두 커진 만큼 내려줌
    for(ItemLayer *itemlayer in SaveManager.sharedInstance.currentProject.itemLayers){
        
        itemlayer.barBaseView.centerY += itemlayer.barBaseView.frameHeight/2*3;
        
        itemlayer.originalCenterY += itemlayer.barBaseView.frameHeight/2*3;
    }
    
    //adding - donebutton 눌렀을때 실제 item도 위로 올라오도록
    //새로추가된 itemlayer.item의 indexinlayer값 바꾸기 & 그에 맞게 다시 bgview에 띄우기
    NSInteger mainFrameImageViewIndex = [editingVC.view.subviews indexOfObject:editingVC.mainFrameImageView];
    
    itemLayer.item.indexInLayer =  [NSString stringWithFormat:@"%ld", mainFrameImageViewIndex + itemLayer.itemLayerIndex + 1];
    [editingVC.view insertSubview:itemLayer.item.baseView atIndex:itemLayer.item.indexInLayer.integerValue];
    
}

-(void)doneEditingItemLayer{
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    
    if ([editingVC.currentItem isKindOfClass:Text.class]) {
        editingVC.layerController.currentItemLayer.backgroundImageView.image = [UIImage imageWithView:editingVC.currentText.baseView];
    } else if ([editingVC.currentItem isKindOfClass:PhotoFrame.class]){
        editingVC.layerController.currentItemLayer.backgroundImageView.image = [UIImage imageWithView:editingVC.currentPhotoFrame.baseView];
    } else if ([editingVC.currentItem isKindOfClass:Sticker.class]){
        editingVC.layerController.currentItemLayer.backgroundImageView.image = [UIImage imageWithView:editingVC.currentSticker.baseView];
    }
    
    editingVC.layerController.currentItemLayer.item = editingVC.currentItem;
    
 
}

@end
