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
            
            float ratio = image.size.height/image.size.width;
            float width = photoFrame.baseView.bounds.size.width * 1.2;
            photoFrame.photoImageView.frameSize = CGSizeMake(width, width * ratio);
            photoFrame.photoImageView.center = CGPointMake(photoFrame.baseView.bounds.size.width/2,photoFrame.baseView.bounds.size.height/2);
            photoFrame.photoImageView.image = image;
        });
    }];
    
}

@end
