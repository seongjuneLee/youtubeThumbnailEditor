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
        self.selectedItem.phAsset = selectedPHAsset;
    }
    self.selectedItem.imageView.center = CGPointMake(self.selectedItem.baseView.frameWidth/2, self.selectedItem.baseView.frameHeight/2);

    [PhotoManager.sharedInstance getImageFromPHAsset:selectedPHAsset withPHImageContentMode:PHImageContentModeAspectFill withSize:CGSizeMake(1920, 1080) WithCompletionBlock:^(UIImage * _Nonnull image) {
        self.selectedItem.imageView.image = image;
    }];
    NSLog(@"savemanager.sharedinstance.currentproject items %@",SaveManager.sharedInstance.currentProject.items);
    NSLog(@"coredataproejct %@",SaveManager.sharedInstance.currentProject.coreDataStorage);
}

@end
