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
#import "UndoManager.h"
#import "UIImage+Additions.h"

@implementation EditingViewController (Buttons)

- (IBAction)rightItemTapped:(id)sender {
    
    [self exportThumbnail];
}

-(void)exportThumbnail{
    UIImage *viewImage = [self.view toImage];
    UIImage *finalImage = [viewImage crop:self.bgView.frame];
    NSString *title = @"ThummIt";

    [self isAlbumAlreadyExist:^(BOOL exist) {
        if (exist) {
            [self getThummItAlbum:^(PHAssetCollection *collection) {
                PHFetchResult *fetchResult = [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[collection.localIdentifier] options:nil];
                PHAssetCollection *assetCollection = fetchResult.firstObject;
                [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
                    PHAssetChangeRequest *assetChangeRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:finalImage];

                    // add asset
                    PHAssetCollectionChangeRequest *assetCollectionChangeRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:assetCollection];
                    [assetCollectionChangeRequest addAssets:@[[assetChangeRequest placeholderForCreatedAsset]]];
                } completionHandler:^(BOOL success, NSError *error) {
                    if (!success) {
                        NSLog(@"Error: %@", error);
                    }
                }];
            }];
        } else {
            __block PHObjectPlaceholder *myAlbum;
            [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
                PHAssetCollectionChangeRequest *changeRequest = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:title];
                NSLog(@"changeRequest %@",changeRequest);
                
                myAlbum = changeRequest.placeholderForCreatedAssetCollection;
            } completionHandler:^(BOOL success, NSError *error) {
                
                if (success) {
                    PHFetchResult *fetchResult = [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[myAlbum.localIdentifier] options:nil];
                    PHAssetCollection *assetCollection = fetchResult.firstObject;
                    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
                        PHAssetChangeRequest *assetChangeRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:finalImage];

                        // add asset
                        PHAssetCollectionChangeRequest *assetCollectionChangeRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:assetCollection];
                        [assetCollectionChangeRequest addAssets:@[[assetChangeRequest placeholderForCreatedAsset]]];
                    } completionHandler:^(BOOL success, NSError *error) {
                        if (!success) {
                            NSLog(@"Error: %@", error);
                        }
                    }];
                } else {
                    NSLog(@"Error: %@", error);
                }
                
            }];
        }
    }];
//
}

-(void)isAlbumAlreadyExist:(void(^) (BOOL exist))block{
    
    PHFetchOptions *userAlbumsOptions = [PHFetchOptions new];
    NSString *title = @"ThummIt";
    
    PHFetchResult *userAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAny options:userAlbumsOptions];
    [userAlbums enumerateObjectsUsingBlock:^(PHAssetCollection *collection, NSUInteger idx, BOOL *stop) {
        
        if ([collection.localizedTitle isEqualToString:title]) {
            block(true);
            *stop = true;
        } else if (idx +1 == userAlbums.count){
            block(false);
            *stop = true;
        }
        
    }];

}

-(void)getThummItAlbum:(void(^) (PHAssetCollection *collection))block{
    
    PHFetchOptions *userAlbumsOptions = [PHFetchOptions new];
    NSString *title = @"ThummIt";
    
    PHFetchResult *userAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAny options:userAlbumsOptions];
    [userAlbums enumerateObjectsUsingBlock:^(PHAssetCollection *collection, NSUInteger idx, BOOL *stop) {
        
        if ([collection.localizedTitle isEqualToString:title]) {
            block(collection);
            *stop = true;
        } else if (idx +1 == userAlbums.count){
            block(nil);
            *stop = true;
        }
        
    }];

}


- (IBAction)leftItemTapped:(id)sender {
    
    [self closeEditingVC];
}

-(void)closeEditingVC{
    
    [self.navigationController popViewControllerAnimated:true];

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
    [self hideNavigationItems];
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
        self.itemCollectionVC.containerView.frameY = 0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.itemCollectionVC.checkButton.alpha = 1.0;
            self.itemCollectionVC.cancelButton.alpha = 1.0;
            self.itemCollectionVC.scrollView.alpha = 1.0;
        }];
    }];
    
}

-(void)addAlbumVC{
    
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
    [self hideNavigationItems];
    self.itemCollectionVC.itemType = TextType;
    [self addItemCollectionVC];
    if (self.recentTypo == nil) {
        self.recentTypo = [NormalTypo normalTypo];
    }
    self.itemCollectionVC.typoButton.selected = true;
    self.itemCollectionVC.typoButton.alpha = 1.0;
    self.itemCollectionVC.textButton.selected = false;
    self.itemCollectionVC.textButton.alpha = 0.4;
    [self.itemCollectionVC.textCollectionController didSelectTypo:self.recentTypo];
    
}

#pragma mark - 스티커 버튼

- (IBAction)stickerButtonTapped:(UIButton *)sender {
    
    self.modeController.editingMode = AddingItemMode;
    [self.layerController showTransparentView];
    [self hideNavigationItems];
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
    
    [self.itemCollectionVC.stickerCollectionController didSelectSticker:recentSticker];
   
}

#pragma mark - 보더칼라 버튼

- (IBAction)bgColorButtonTapped:(id)sender {
    
    [self hideNavigationItems];
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
