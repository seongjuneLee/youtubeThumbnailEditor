//
//  ItemCollectionViewController+PhotoFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/09.
//

#import "ItemCollectionViewController+PhotoFrame.h"
#import "EditingViewController.h"

@implementation ItemCollectionViewController (PhotoFrame)


#pragma mark - 포토프레임 컨트롤러 델리게이트

-(void)didSelectPhotoFrame:(PhotoFrame *)photoFrame{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    photoFrame.baseView.center = editingVC.bgView.center;
    
    PhotoFrame *currentPhotoFrame = (PhotoFrame *)editingVC.currentItem;
    if (editingVC.currentItem) {
        // 위치, 크기,사진 유지
        photoFrame.baseView.frame = editingVC.currentItem.baseView.frame;
        photoFrame.photoImageView.frame = currentPhotoFrame.photoImageView.frame;
        photoFrame.photoImageView.image = currentPhotoFrame.photoImageView.image;
        [editingVC.currentItem.baseView removeFromSuperview];// 기존 것 떼어주고
    }
    
    [editingVC.layerController bringCurrentItemToFront:photoFrame];
    
    editingVC.currentItem = photoFrame;
    editingVC.currentPhotoFrame = photoFrame;
    editingVC.gestureController.currentItem = photoFrame;
    
}
@end
