//
//  EditingViewController+AlbumVCDelegate.m
//  Thummit
//
//  Created by 이성준 on 2020/12/16.
//

#import "EditingViewController+AlbumVCDelegate.h"

@implementation EditingViewController (AlbumVCDelegate)

-(void)didSelectPhoto{
    
    PHAsset *selectedPHAsset = self.albumVC.phAssets[self.albumVC.selectedIndexPath.item];
    if (!self.originalPhotoFrameImage) {
        self.currentItem.phAsset = selectedPHAsset;
    }
    self.currentItem.photoImageView.frameOrigin = CGPointMake(0,0);

    [PhotoManager.sharedInstance getImageFromPHAsset:selectedPHAsset withPHImageContentMode:PHImageContentModeAspectFill withSize:CGSizeMake(1920, 1080) WithCompletionBlock:^(UIImage * _Nonnull image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.currentItem.photoImageView.image = image;
        });
    }];
    
}

@end
