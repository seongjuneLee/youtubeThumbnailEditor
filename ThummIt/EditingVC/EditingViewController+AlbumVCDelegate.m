//
//  EditingViewController+AlbumVCDelegate.m
//  Thummit
//
//  Created by 이성준 on 2020/12/16.
//

#import "EditingViewController+AlbumVCDelegate.h"

@implementation EditingViewController (AlbumVCDelegate)

-(void)didSelectPhotoWithPHAsset:(PHAsset*)phAsset{
    
    PhotoFrame *photoFrame = self.currentPhotoFrame;
    if (!self.originalPhotoFrameImage) {
        photoFrame.phAsset = phAsset;
    }
        

    [PhotoManager.sharedInstance getImageFromPHAsset:phAsset withPHImageContentMode:PHImageContentModeAspectFill withSize:CGSizeMake(1920,1080) WithCompletionBlock:^(UIImage * _Nonnull image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.recentPHAsset = phAsset;
            photoFrame.photoImageView.frameSize = photoFrame.baseView.frameSize;
            photoFrame.photoImageView.center = CGPointMake(photoFrame.baseView.frameWidth/2,photoFrame.baseView.frameHeight/2);
            photoFrame.photoImageView.image = image;
        });
    }];
    
}

@end
