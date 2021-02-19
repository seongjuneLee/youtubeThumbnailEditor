//
//  EditingViewController+Buttons.m
//  Thummit
//
//  Created by 이성준 on 2020/12/16.
//

#import "EditingViewController+Buttons.h"
#import "EditingViewController+AlbumVCDelegate.h"
#import "EditingViewController+GestureControllerDelegate.h"
#import "TextCollectionController.h"
#import "PhotoFrameCollectionController.h"
#import "StickerCollectionController.h"
#import "UIColor+Additions.h"
#import "UIImage+Additions.h"
#import "ExportManager.h"

@implementation EditingViewController (Buttons)

- (IBAction)rightItemTapped:(id)sender {
    [self exportThumbnail];
}

-(void)exportThumbnail{
    
    [self setResolution:CGSizeMake(1920, 1080)];
    
    [ExportManager.sharedInstance exportImageWithBlock:^(BOOL success) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (success) {
                [self.view makeToast:NSLocalizedString(@"Download success", nil) duration:4.0 position:CSToastPositionCenter];
            } else {
                [self.view makeToast:NSLocalizedString(@"Download failed. Contact us in account view", nil) duration:4.0 position:CSToastPositionCenter];
            }
        });
    }];

}
-(void)setResolution:(CGSize)resolution{
    UIImage *viewImage = [self.view toImage];
    UIImage *croppedImage = [viewImage crop:self.bgView.frame];
    [ExportManager.sharedInstance setResolutionToExportingImage:croppedImage withResolution:resolution];
}



- (IBAction)leftItemTapped:(id)sender {
    [SaveManager.sharedInstance save];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self closeEditingVC];
    });
}

-(void)closeEditingVC{
    
    [self.navigationController popViewControllerAnimated:true];
    [UndoManager.sharedInstance initUndoRedo];

}

#pragma mark - 포토 프레임 버튼

- (IBAction)photoFrameButtonTapped:(UIButton *)sender {
    
    if (PHPhotoLibrary.authorizationStatus == PHAuthorizationStatusAuthorized){
        dispatch_async(dispatch_get_main_queue(), ^{
            if (PhotoManager.sharedInstance.phassets.count == 0) {
                PhotoManager.sharedInstance.phassets = [PhotoManager.sharedInstance fetchPhassets];
            }
            [self photoFrameButtonTappedTaskWhenAuthorized];
            self.modeController.editingMode = AddingItemMode;
        });
    } else {
        [self taskWhenDenied];
    }
    
}

-(void)photoFrameButtonTappedTaskWhenAuthorized{
    [self.layerController showTransparentView];
    [self hideItemsForItemMode];
    self.itemCollectionVC.itemType = PhotoFrameType;
    [self addItemCollectionVC];
    [self addAlbumVC];

    PhotoFrame *recentPhotoFrame = [BasicCirclePhotoFrame basicCirclePhotoFrame];
    for (NSArray *photoFrames in ItemManager.sharedInstance.photoFrameDatas) {
        for (PhotoFrame *photoFrame in photoFrames) {
            if ([photoFrame isKindOfClass:self.recentPhotoFrame.class]) {
                recentPhotoFrame = photoFrame;
                break;
            }
        }
    }
    [self.itemCollectionVC.photoFrameCollectionController didSelectPhotoFrame:recentPhotoFrame];
    
    if (!self.recentPHAsset) {
        self.recentPHAsset = PhotoManager.sharedInstance.phassets[0];
    }
    [self didSelectPhotoWithPHAsset:self.recentPHAsset];
    
}

-(void)taskWhenDenied{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *settingAlertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Go to setting", @"#-세팅으로 가기 - #") message:NSLocalizedString(@"You should agree photo access request for this function.", nil) preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }];
        UIAlertAction *goToSetting = [UIAlertAction actionWithTitle:NSLocalizedString(@"Setting", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
        }];
        
        [settingAlertController addAction:cancel];
        [settingAlertController addAction:goToSetting];
        [self presentViewController:settingAlertController animated:true completion:nil];
    });
    
}

-(void)addItemCollectionVC{
    
    [self addChildViewController:self.itemCollectionVC];
    [self.view addSubview:self.itemCollectionVC.view];
    
    self.itemCollectionVC.containerView.frameY = self.view.frameHeight;
    
    self.itemCollectionVC.checkButton.alpha = 0;
    self.itemCollectionVC.cancelButton.alpha = 0;
    self.itemCollectionVC.scrollView.alpha = 0;
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.itemCollectionVC.containerTopConstraint.constant = 0;
        [self.itemCollectionVC.view layoutIfNeeded];
        [self.itemCollectionVC.collectionView reloadData];

    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            if(self.textButtonInScrollView.selected){
                self.itemCollectionVC.checkButton.enabled = false;
                self.itemCollectionVC.checkButton.alpha = 0.4;
                self.textButtonInScrollView.selected = false;
            }else{
                self.itemCollectionVC.checkButton.alpha = 1.0;
            }
            self.itemCollectionVC.cancelButton.alpha = 1.0;
            self.itemCollectionVC.scrollView.alpha = 1.0;
        }];
    }];

    
}

-(void)addAlbumVC{
    
    self.albumVC.view.hidden = true;
    [self addChildViewController:self.albumVC];
    [self.view addSubview:self.albumVC.view];
    
    float imageViewBottomY = self.bgView.frameY + self.bgView.frameHeight;
    self.albumVC.view.frameSize = CGSizeMake(self.view.frameWidth, self.view.frameHeight - imageViewBottomY - self.itemCollectionVC.collectionView.frameY);
    self.albumVC.view.frameOrigin = CGPointMake(0, imageViewBottomY + self.itemCollectionVC.collectionView.frameY);
    
    self.albumVC.delegate = self;
    self.albumVC.collectionViewTopConstraint.constant = self.albumVC.view.frameHeight;
    
}



#pragma mark - 텍스트 버튼

- (IBAction)textButtonTapped:(UIButton *)sender {
    
    self.modeController.editingMode = AddingItemMode;
    [self.layerController showTransparentView];
    [self hideItemsForItemMode];
    self.itemCollectionVC.itemType = TextType;
    [self addItemCollectionVC];
    if (self.recentTypo == nil) {
        self.recentTypo = [NormalTypo normalTypo];
    }
    self.textButtonInScrollView.selected = true;
    self.itemCollectionVC.typoButton.selected = true;
    self.itemCollectionVC.typoButton.alpha = 1.0;
    self.itemCollectionVC.textButton.selected = false;
    self.itemCollectionVC.textButton.alpha = 0.4;
    [self.itemCollectionVC.textCollectionController didSelectTypo:self.recentTypo];
    [UIView animateWithDuration:0.2 animations:^{
        self.buttonScrollView.alpha = 0.0;
    }];
    
}

#pragma mark - 스티커 버튼

- (IBAction)stickerButtonTapped:(UIButton *)sender {
    
    self.modeController.editingMode = AddingItemMode;
    [self.layerController showTransparentView];
    [self hideItemsForItemMode];
    self.itemCollectionVC.itemType = StickerType;
    [self addItemCollectionVC];
    // 추가 필요
    Sticker *recentSticker = [CircleSticker1 circleSticker1];
    for (NSArray *stickers in ItemManager.sharedInstance.stickerDatas) {
        for (Sticker *sticker in stickers) {
            if ([sticker isKindOfClass:self.recentSticker.class]) {
                recentSticker = sticker;
            }
        }
    }

    [self.itemCollectionVC.stickerCollectionController didSelectSticker:[CircleSticker1 circleSticker1]];
   
}

#pragma mark - 보더칼라 버튼

- (IBAction)bgColorButtonTapped:(id)sender {
    
    self.modeController.editingMode = BGColorMode;
    [self hideItemsForItemMode];
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

#pragma mark - slider

- (IBAction)sliderValueChanged:(UISlider *)sender{
    
    //thumbPoint 정의
    CGRect trackRect = [self.hueSlider trackRectForBounds:self.hueSlider.bounds];
    CGRect thumbRect = [self.hueSlider thumbRectForBounds:self.hueSlider.bounds trackRect:trackRect value:self.hueSlider.value];
    CGPoint thumbCenter = CGPointMake(thumbRect.origin.x + 15.5, 15);
    
    self.thumbCircleView.center = [self.view convertPoint:thumbCenter fromView:self.hueSlider];
    UIImage *image = [UIImage imageNamed:@"hueSlider"];
    float scale = image.size.width*image.scale/(self.hueSlider.bounds.size.width - thumbRect.size.width);

    CGPoint thumbPoint =  CGPointMake(thumbRect.origin.x * scale, thumbRect.origin.y+self.hueSlider.frameHeight/2);

    UIColor *currentPointColor = [UIColor pixelColorInImage:[UIImage imageNamed:@"hueSlider"] atPoint:thumbPoint];
    
    if ([self.currentItem isKindOfClass:Text.class]){
        self.currentText.textView.textColor = currentPointColor;
        self.currentText.typo.textColor = currentPointColor;
        if(self.currentText.typo.backgroundColorAlsoChange){
            UIImage *image = [UIImage imageNamed:self.currentText.typo.bgImageName];
            self.currentText.backgroundImageView.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            [self.currentText.backgroundImageView setTintColor:currentPointColor];
        }
    } else if ([self.currentItem isKindOfClass:Sticker.class]){
        Sticker *sticker = (Sticker *)self.currentItem;
        sticker.tintColor = currentPointColor;
        [self.currentItem.backgroundImageView setTintColor:currentPointColor];
    };
    self.thumbCircleView.backgroundColor = currentPointColor;
    
};
    
-(void)hideAndInitSlider{
    
    [self.hueSlider setValue:0];

    CGRect trackRect = [self.hueSlider trackRectForBounds:self.hueSlider.bounds];
    CGRect thumbRect = [self.hueSlider thumbRectForBounds:self.hueSlider.bounds trackRect:trackRect value:self.hueSlider.value];
    CGPoint thumbCenter = CGPointMake(thumbRect.origin.x + 15.5, 15);
    self.thumbCircleView.alpha = 0.0;

    self.thumbCircleView.center = [self.view convertPoint:thumbCenter fromView:self.hueSlider];
    [UIView animateWithDuration:0.2 animations:^{
        self.hueSlider.alpha = 0.0;
    }];
}


@end
