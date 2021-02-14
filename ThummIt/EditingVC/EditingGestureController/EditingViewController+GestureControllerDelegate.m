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
        [self hideNavigationItems];

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
        [self hideNavigationItems];

        Sticker *sticker = (Sticker *)item;
        self.currentItem = sticker; // currentsicker가 null이라 Currentitem으로 받음일단
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

    }
    
}

-(void)photoFrameTappedTaskWhenAuthorizedWithItem:(Item *)item{
    
    PhotoFrame *photoFrame = (PhotoFrame *)item;
    self.currentItem = [photoFrame copy];
    self.currentPhotoFrame = (PhotoFrame *)self.currentItem;
    self.originalPhotoFrame = photoFrame;
    self.originalPhotoFrame.baseView.hidden = true;
    self.originalIndexInLayer = photoFrame.indexInLayer.integerValue;

    [self.layerController showTransparentView];
    [self hideNavigationItems];
    
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
    [self addChildViewController:self.itemCollectionVC];
    [self.view addSubview:self.itemCollectionVC.view];
    self.itemCollectionVC.cancelButton.alpha = 1.0;
    self.itemCollectionVC.checkButton.alpha = 1.0;
    [self addAlbumVC];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.albumVC showWithAnimation];
    });
    self.itemCollectionVC.photoButton.selected = true;
    
}

-(void)setCurrentPhotoSelectedOnAlbumVC{
    PhotoFrame *photoFrame = (PhotoFrame *)self.currentItem;

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

        [PhotoManager.sharedInstance getImageFromPHAsset:selectedPHAsset withPHImageContentMode:PHImageContentModeAspectFill withSize:CGSizeMake(1920, 1080) WithCompletionBlock:^(UIImage * _Nonnull image) {
            photoFrame.photoImageView.frameSize = photoFrame.baseView.frameSize;
            photoFrame.photoImageView.transform = CGAffineTransformMakeRotation(degreesToRadians(0));
            photoFrame.photoImageView.center = CGPointMake(photoFrame.baseView.frameWidth/2,photoFrame.baseView.frameHeight/2);

            photoFrame.photoImageView.image = image;
        }];
    }
    
}



#pragma mark - 팬

// 팬 제스쳐 노멀 모드
-(void)readyUIForPanning{
    
    self.underAreaView.hidden = true;
    [UIView animateWithDuration:0.2 animations:^{
        self.buttonScrollView.alpha = 0.0;
        self.deleteButtonContainerView.alpha = 1.0;
        self.albumVC.view.alpha = self.itemCollectionVC.view.alpha = 0;
    }];

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
        [self showNavigationItems];
        [self.layerController hideTransparentView];
        [self.itemCollectionVC dismissSelf];
    }
    
    [UIView animateWithDuration:0.2 animations:^{
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
