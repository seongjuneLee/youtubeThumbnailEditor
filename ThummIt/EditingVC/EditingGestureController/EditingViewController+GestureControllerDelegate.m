//
//  EditingViewController+GestureControllerDelegate.m
//  Thummit
//
//  Created by 이성준 on 2020/12/17.
//

#import "EditingViewController+GestureControllerDelegate.h"
#import "EditingViewController+AlbumVCDelegate.h"
#import "ItemCollectionViewController+Button.h"
#import "EditingViewController+Buttons.h"


@implementation EditingViewController (GestureControllerDelegate)

#pragma mark - 탭
-(void)didSelectItem:(Item *)item{
    
    self.modeController.editingMode = EditingItemMode;
    
    if ([item isKindOfClass:PhotoFrame.class]) {
        
        if (PHPhotoLibrary.authorizationStatus == PHAuthorizationStatusAuthorized){
            if (PhotoManager.sharedInstance.phassets.count == 0) {
                PhotoManager.sharedInstance.phassets = [PhotoManager.sharedInstance fetchPhassets];
            }
            [self photoFrameTappedTaskWhenAuthorizedWithItem:item];
        } else {
            [self taskWhenDenied];
        }
        
    } else if([item isKindOfClass:Text.class]){
        [self hideItemsForItemMode];
        
        Text *text = (Text *)item;
        self.currentItem = text;
        self.currentText = text;
        
        self.originalCenter = text.baseView.center;
        self.originalTransform = text.baseView.transform;
        self.originalTypo = text.typo;
        self.originalText = text.text;
        
        self.itemCollectionVC.typoButton.selected = false;
        self.itemCollectionVC.typoButton.alpha = 0.4;
        self.itemCollectionVC.textButton.selected = true;
        self.itemCollectionVC.textButton.alpha = 1.0;
        
        [text.textView becomeFirstResponder];
        [self.layerController showTransparentView];
        [self.layerController bringCurrentItemToFront:self.currentItem];
        self.itemCollectionVC.itemType = TextType;
        
        if(!text.typo.cannotChangeColor){
            [UIView animateWithDuration:0.2 animations:^{
                self.hueSlider.alpha = 1.0;
            }];
        }
        
        [self addItemCollectionVC];
        
    } else if([item isKindOfClass:Sticker.class]){
        [self hideItemsForItemMode];
        
        Sticker *sticker = (Sticker *)item;
        self.currentItem = sticker;
        self.currentSticker = sticker;
        self.originalCenter = sticker.baseView.center;
        self.originalTransform = sticker.baseView.transform;
        self.originalStickerBGImageName = sticker.backgroundImageName;
        self.originalTintColor = sticker.tintColor;
        self.originalColorChangable = sticker.cannotChangeColor;
        self.originalSticker = sticker;
        self.originalIndexInLayer = sticker.indexInLayer.integerValue;
        
        [self.layerController showTransparentView];
        [self.layerController bringCurrentItemToFront:self.currentItem];
        self.itemCollectionVC.itemType = StickerType;
        
        if(!sticker.cannotChangeColor){
            [UIView animateWithDuration:0.2 animations:^{
                self.hueSlider.alpha = 1.0;
            }];
        }
        
        [self addItemCollectionVC];

    } else if([item isKindOfClass:MainFrame.class]){
        
    }
    
}

-(void)photoFrameTappedTaskWhenAuthorizedWithItem:(Item *)item{
    
    PhotoFrame *photoFrame = (PhotoFrame *)item;
    
    PhotoFrame *copied = [photoFrame copy];
    self.currentItem = copied;
    self.currentPhotoFrame = copied;
    self.originalPhotoFrame = photoFrame;
    self.originalPhotoFrame.baseView.hidden = true;
    self.originalIndexInLayer = photoFrame.indexInLayer.integerValue;

    [self.layerController showTransparentView];
    [self hideItemsForItemMode];
    
    [self.layerController bringCurrentItemToFront:self.currentItem];
    self.itemCollectionVC.itemType = PhotoFrameType;
    
    if (photoFrame.isFixedPhotoFrame) {
        [self fixedPhotoFrameTapped];
    } else {
        [self addItemCollectionVC];
        [self addAlbumVC];
    }
    [self setCurrentPhotoSelectedOnAlbumVC];
}

-(void)fixedPhotoFrameTapped{
    
    [self addItemCollectionVC];
    [self addAlbumVC];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.albumVC showWithAnimation];
    });
    self.itemCollectionVC.photoFramePhotoButton.selected = true;
    
}

-(void)setCurrentPhotoSelectedOnAlbumVC{
    PhotoFrame *photoFrame = self.currentPhotoFrame;

    NSUInteger index = 0;
    NSArray *phassets = PhotoManager.sharedInstance.phassets;
    for (int i = 0; i < phassets.count; i++) {
        PHAsset *phAsset = phassets[i];
        if ([photoFrame.phAsset.localIdentifier isEqualToString:phAsset.localIdentifier]) {
            index = i;
        }
    }
    
    self.albumVC.selectedIndexPath = [NSIndexPath indexPathForItem:index inSection:0];
    [self.albumVC.collectionView reloadData];
    PHAsset *selectedPHAsset = phassets[index];
    if (!photoFrame.photoImageView.image) {
        [self didSelectPhotoWithPHAsset:selectedPHAsset];
    }
    
}



#pragma mark - 팬

// 팬 제스쳐 노멀 모드
-(void)readyUIForPanning{
    
    self.underAreaView.hidden = true;
    [UIView animateWithDuration:0.2 animations:^{
        self.undoButton.alpha = 0.0;
        self.redoButton.alpha = 0.0;
        self.buttonScrollView.alpha = 0.0;
        self.deleteButtonContainerView.alpha = 1.0;
        self.albumVC.view.alpha = self.itemCollectionVC.view.alpha = 0;
    }];
    
    if([self.currentItem isKindOfClass:Text.class]){
        [self.currentText.textView resignFirstResponder];
    }

}

-(void)deleteImageRespondToCurrentPointY:(float)currentPointY{
    float imageViewBottomY = self.bgView.frameY + self.bgView.frameHeight;
    if (currentPointY >= imageViewBottomY) {
        [UIView animateWithDuration:0.2 animations:^{
            self.deleteButtonContainerView.alpha = 0.4;
            self.currentItem.baseView.alpha = 0.4;
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            self.deleteButtonContainerView.alpha = 1.0;
            self.currentItem.baseView.alpha = 1.0;
        }];
    }
}
-(void)panGestureEndedForItem:(Item *)item withFingerPoint:(CGPoint)fingerPoint{
    
    self.underAreaView.hidden = false;
    float imageViewBottomY = self.bgView.frameY + self.bgView.frameHeight;
    if (fingerPoint.y >= imageViewBottomY) {
        [item.baseView removeFromSuperview];
        [self.currentText.textView resignFirstResponder];
        self.itemCollectionVC.checkButton.enabled = true;
        self.itemCollectionVC.checkButton.alpha = 1.0;
        self.currentItem = nil;
        self.currentText = nil;
        self.currentSticker = nil;
        self.currentPhotoFrame = nil;
        [SaveManager.sharedInstance deleteItem:item];
        for (Item *item in SaveManager.sharedInstance.currentProject.items) {
            if (!item.isFixedPhotoFrame) {
                item.indexInLayer = [NSString stringWithFormat:@"%ld",[self.view.subviews indexOfObject:item.baseView]];
            }
        }
        item.baseView.center = CGPointMake(self.bgView.frameWidth/2, self.bgView.frameY + self.bgView.frameHeight/2);
        [self showItemsForNormalMode];
        [self.layerController hideTransparentView];
        
        [self.itemCollectionVC dismissSelf];
        self.buttonScrollView.hidden = false;
    } else{
        if(self.modeController.editingMode == NormalMode){
            self.buttonScrollView.hidden = false;
        }else{
            self.buttonScrollView.hidden = true;
        }
    }
    
    [UIView animateWithDuration:0.2 animations:^{
        self.undoButton.alpha = 1.0;
        self.redoButton.alpha = 1.0;
        self.buttonScrollView.alpha = 1.0;
        self.deleteButtonContainerView.alpha = 0.0;
        self.albumVC.view.alpha = self.itemCollectionVC.view.alpha = 1.0;
    }];

}


#pragma mark - 핀치제스쳐

-(void)pinchGestureInNormalModeBeganWithItem:(Item *)item withSender:(UIGestureRecognizer *)sender{
    self.underAreaView.hidden = true;
    [UIView animateWithDuration:0.2 animations:^{
        self.photoFrameButtonContainerView.alpha = 0.0;
        self.deleteButtonContainerView.alpha = 1.0;
    }];
}



@end
