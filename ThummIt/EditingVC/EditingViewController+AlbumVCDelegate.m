//
//  EditingViewController+AlbumVCDelegate.m
//  Thummit
//
//  Created by 이성준 on 2020/12/16.
//

#import "EditingViewController+AlbumVCDelegate.h"

@implementation EditingViewController (AlbumVCDelegate)

-(void)didSelectPhotoWithPHAsset:(PHAsset*)phAsset{
    
    if (self.itemCollectionVC.itemType == PhotoFrameType) {
        PhotoFrame *photoFrame = self.currentPhotoFrame;
        photoFrame.phAsset = phAsset;
        
        [PhotoManager.sharedInstance getImageFromPHAsset:phAsset withPHImageContentMode:PHImageContentModeAspectFill withSize:CGSizeMake(1920,1080) WithCompletionBlock:^(UIImage * _Nonnull image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                float ratio = image.size.height/image.size.width;
                float width = photoFrame.baseView.bounds.size.width;
                float height = photoFrame.baseView.bounds.size.height;
                if (ratio > 1) {
                    photoFrame.photoImageView.frameSize = CGSizeMake(width, width * ratio);
                } else {
                    photoFrame.photoImageView.frameSize = CGSizeMake(height * 1/ratio, height);
                }
                photoFrame.photoImageView.center = CGPointMake(photoFrame.baseView.bounds.size.width/2,photoFrame.baseView.bounds.size.height/2);
                photoFrame.photoImageView.image = image;
                photoFrame.photoCenter = photoFrame.photoImageView.center;
            });
        }];
    } else {
        Photo *photo = self.currentPhoto;
        photo.phAsset = phAsset;
        CGPoint originalCenter = photo.baseView.center;
        [PhotoManager.sharedInstance getImageFromPHAsset:phAsset withPHImageContentMode:PHImageContentModeAspectFill withSize:CGSizeMake(1920,1080) WithCompletionBlock:^(UIImage * _Nonnull image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                float ratio = image.size.height/image.size.width;
                float width = self.bgView.frameWidth * 0.8;
                float height = self.bgView.frameHeight * 0.8;
                if (ratio < 1) {
                    photo.photoImageView.frameSize = CGSizeMake(width, width * ratio);
                } else {
                    photo.photoImageView.frameSize = CGSizeMake(height * 1/ratio, height);
                }
                NSData *imageData = UIImagePNGRepresentation(image);
                photo.imageData = imageData;
                photo.photoImageView.image = image;
                photo.baseView.bounds = photo.photoImageView.bounds;
                photo.baseView.center = originalCenter;
            });
        }];

    }
    
}

@end
