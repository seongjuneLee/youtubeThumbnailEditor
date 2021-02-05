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
#import "ItemCollectionViewController+Text.h"


@implementation EditingViewController (GestureControllerDelegate)

#pragma mark - 탭
-(void)didSelectItem:(Item *)item{
    
    if ([item isKindOfClass:PhotoFrame.class]) {
        
        PhotoFrame *photoFrame = (PhotoFrame *)item;
        self.currentItem = photoFrame;
        [self.modeController setNavigationItemRespondToEditingMode:EditingPhotoFrameMode];
        self.originalPhotoFrameImage = photoFrame.photoImageView.image;
        self.originalImageViewCenter = photoFrame.photoImageView.center;
        self.originalTransform = photoFrame.photoImageView.transform;
        
        if (PHPhotoLibrary.authorizationStatus == PHAuthorizationStatusAuthorized){
                if (PhotoManager.sharedInstance.phassets.count == 0) {
                    PhotoManager.sharedInstance.phassets = [PhotoManager.sharedInstance fetchPhassets];
                }
                [self photoFrameTappedTaskWhenAuthorized];
        } else {
            [self taskWhenDenied];
        }
        [self.layerController showTransparentView];
        
    } else if([item isKindOfClass:Text.class]){
        
        Text *text = (Text *)item;
        self.currentItem = text;
        self.currentText = text;
        [self.modeController setNavigationItemRespondToEditingMode:EditingTextMode];
        
        self.originalImageViewCenter = text.baseView.center;
        self.originalTransform = text.baseView.transform;
        
        
        [text.textView becomeFirstResponder];
        [self.layerController showTransparentView];
        [self.layerController bringCurrentItemToFront:self.currentItem];
        self.itemCollectionVC.itemType = TextType;
        
        [self addItemCollectionVC];

    } else if([item isKindOfClass:Sticker.class]){
        
        Sticker *sticker = (Sticker *)item;
        self.currentItem = sticker; // currentsicker가 null이라 Currentitem으로 받음일단
        [self.modeController setNavigationItemRespondToEditingMode:EditingStickerMode];
        
        self.originalImageViewCenter = sticker.baseView.center;
        self.originalTransform = sticker.baseView.transform;
        
        [self.layerController showTransparentView];
        [self.layerController bringCurrentItemToFront:self.currentItem];
        self.itemCollectionVC.itemType = StickerType;
        
        [self addItemCollectionVC];

    }
    
}

-(void)photoFrameTappedTaskWhenAuthorized{
    [self.layerController showTransparentView];
    [self.modeController setNavigationItemRespondToEditingMode:EditingPhotoFrameMode];
    [self.layerController bringCurrentItemToFront:self.currentItem];
    [self showAlbumVC];
    [self setCurrentPhotoSelectedOnAlbumVC];
}

-(void)changeCurrentItem:(Item *)item{
    
    if (self.currentItem != item) {
        if ([item isKindOfClass:PhotoFrame.class]) {
            PhotoFrame *photoFrame = (PhotoFrame *)self.currentItem;
            photoFrame.photoImageView.image = self.originalPhotoFrameImage;
            photoFrame.photoImageView.center = self.originalImageViewCenter;
            [self.layerController recoverOriginalLayer];
            [self.layerController bringCurrentItemToFront:item];
            
            self.currentItem = item;
            self.originalPhotoFrameImage = photoFrame.photoImageView.image;
            [self setCurrentPhotoSelectedOnAlbumVC];
            photoFrame.photoImageView.center = CGPointMake(photoFrame.baseView.frameWidth/2, photoFrame.baseView.frameHeight/2);
            photoFrame.photoCenter = photoFrame.photoImageView.center;
        } else if ([item isKindOfClass:Text.class]){
            
        }
    }
    
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
            photoFrame.photoCenter = photoFrame.photoImageView.center;

            photoFrame.photoImageView.image = image;
        }];
    }
    
}

-(void)showAlbumVC{
    
    if (!self.albumVC) {

        UIStoryboard *editing = [UIStoryboard storyboardWithName:@"Editing" bundle:NSBundle.mainBundle];
        self.albumVC = (AlbumViewController *)[editing instantiateViewControllerWithIdentifier:@"AlbumViewController"];

        [self addChildViewController:self.albumVC];
        [self.view addSubview:self.albumVC.view];
        
        float imageViewBottomY = self.bgView.frameY + self.bgView.frameHeight;
        self.albumVC.view.frameSize = CGSizeMake(self.view.frameWidth, self.view.frameHeight - imageViewBottomY);
        self.albumVC.view.frameOrigin = CGPointMake(0, imageViewBottomY);

        self.albumVC.delegate = self;
        self.albumVC.collectionView.frameY = self.view.frameHeight;
        
        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.albumVC.collectionView.frameY = self.albumVC.view.frameY;
            
        } completion:nil];
    }
    
}

-(void)didTapTextWhileAdding{
    
    [self.itemCollectionVC contentButtonTapped:self.itemCollectionVC.contentButton];

}

-(void)didTapPhotoFrameWhileAdding{
    
    [self.modeController setNavigationItemRespondToEditingMode:EditingTextMode];
    [self.itemCollectionVC contentButtonTapped:self.itemCollectionVC.contentButton];
    
}

#pragma mark - 팬

// 팬 제스쳐 노멀 모드
-(void)readyUIForPanning{
    
    if (self.modeController.editingMode == NormalMode) {
        self.underAreaView.hidden = true;
        [UIView animateWithDuration:0.2 animations:^{
            self.buttonScrollView.alpha = 0.0;
            self.deleteButtonContainerView.alpha = 1.0;
        }];
    } else if (self.modeController.editingMode == AddingPhotoFrameMode || self.modeController.editingMode == AddingTextMode || self.modeController.editingMode == EditingTextMode || self.modeController.editingMode == AddingStickerMode|| self.modeController.editingMode == EditingStickerMode){
        self.underAreaView.hidden = true;
        [UIView animateWithDuration:0.2 animations:^{
            self.buttonScrollView.alpha = 0.0;
            self.deleteButtonContainerView.alpha = 1.0;
            self.albumVC.view.alpha = self.itemCollectionVC.view.alpha = 0;
        }];
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
        [ItemManager.sharedInstance deleteItem:item];
        for (Item *item in SaveManager.sharedInstance.currentProject.items) {
            if (!item.isFixedPhotoFrame) {
                item.indexInLayer = [NSString stringWithFormat:@"%ld",[self.view.subviews indexOfObject:item.baseView]];
            }
        }
        item.baseView.center = CGPointMake(self.bgView.frameWidth/2, self.bgView.frameY + self.bgView.frameHeight/2);
        [self.modeController setNavigationItemRespondToEditingMode:NormalMode];
        [self dismissItemCollectionVC];
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
