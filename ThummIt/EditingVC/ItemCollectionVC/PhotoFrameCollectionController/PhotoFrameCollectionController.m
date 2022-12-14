//
//  PhotoFrameCollectionController.m
//  ThummIt
//
//  Created by 이성준 on 2020/12/29.
//

#import "PhotoFrameCollectionController.h"
#import "PhotoFrameCollectionViewCell.h"
#import "PhotoFrameCollectionReusableView.h"
#import "EditingPhotoViewController.h"
#import "ItemManager.h"
#import "PhotoManager.h"
#import "UIView+Additions.h"
#import "EditingViewController.h"

@implementation PhotoFrameCollectionController

-(id)init{
    
    self = [super init];
    if (self) {
    }
    return self;
}

-(id)initWithCollectionView:(UICollectionView *)collectionView{
    
    self = [self init];
    if (self) {
        self.collectionView = collectionView;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self.collectionView registerNib:[UINib nibWithNibName:@"PhotoFrameCollectionViewCell" bundle:NSBundle.mainBundle] forCellWithReuseIdentifier:@"PhotoFrameCollectionViewCell"];
        [self.collectionView registerNib:[UINib nibWithNibName:@"PhotoFrameCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"PhotoFrameCollectionReusableView"];
        [self.collectionView registerNib:[UINib nibWithNibName:@"FreeFormCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"FreeFormCollectionReusableView"];

    }
    
    return self;
    
}

#pragma mark - 데이타 소스

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    NSArray *photoFrameCategories;
    if (SaveManager.sharedInstance.currentProject.selectedTemplateName.length > 0) {
        photoFrameCategories =ItemManager.sharedInstance.photoFrameCategories;
    } else {
        photoFrameCategories =ItemManager.sharedInstance.photoFrameCategoriesForFreeFormProject;
    }

    return photoFrameCategories.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    NSArray *photoFrames;
    if (SaveManager.sharedInstance.currentProject.selectedTemplateName.length > 0) {
        photoFrames = ItemManager.sharedInstance.photoFrameDatas[section];
    } else {
        photoFrames = ItemManager.sharedInstance.photoFrameDatasForFreeFormProject[section];
    }
    
    return photoFrames.count;
    
}

-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PhotoFrameCollectionViewCell *cell = (PhotoFrameCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoFrameCollectionViewCell" forIndexPath:indexPath];
    NSArray *photoFrames;
    if (SaveManager.sharedInstance.currentProject.selectedTemplateName.length > 0) {
        photoFrames = ItemManager.sharedInstance.photoFrameDatas[indexPath.section];
    } else {
        photoFrames = ItemManager.sharedInstance.photoFrameDatasForFreeFormProject[indexPath.section];
    }
    
    PhotoFrame *photoFrame = photoFrames[indexPath.item];
    [photoFrame loadView];
    
    [PhotoManager.sharedInstance getFirstPhotoFromAlbumWithContentMode:PHImageContentModeAspectFill withSize:CGSizeMake(500, 500) WithCompletionBlock:^(UIImage * _Nonnull image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            float ratio = image.size.height/image.size.width;
            float width = photoFrame.baseView.bounds.size.width;
            float height = photoFrame.baseView.bounds.size.height;
            if (ratio > 1) {
                photoFrame.photoImageView.frameSize = CGSizeMake(width, width * ratio);
            } else {
                photoFrame.photoImageView.frameSize = CGSizeMake(height * 1/ratio, height);
            }
            photoFrame.photoImageView.center = CGPointMake(photoFrame.baseView.frameWidth/2, photoFrame.baseView.frameHeight/2);
            photoFrame.photoImageView.image = image;
            cell.previewImageView.image = [photoFrame.baseView toImage];
        });
    }];
    

    
    return cell;
}

#pragma mark - 델리게이트

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *photoFrames;
    if (SaveManager.sharedInstance.currentProject.selectedTemplateName.length > 0) {
        photoFrames = ItemManager.sharedInstance.photoFrameDatas[indexPath.section];
    } else {
        photoFrames = ItemManager.sharedInstance.photoFrameDatasForFreeFormProject[indexPath.section];
    }

    PhotoFrame *photoFrame = photoFrames[indexPath.item];
    [self didSelectPhotoFrame:photoFrame];
    
}

-(void)didSelectPhotoFrame:(PhotoFrame *)photoFrame{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [photoFrame loadView];
    if (editingVC.currentPhotoFrame) {
        PhotoFrame *currentPhotoFrame = (PhotoFrame *)editingVC.currentPhotoFrame;
        // 위치, 크기,사진 유지
        photoFrame.phAsset = currentPhotoFrame.phAsset;
        photoFrame.baseView.center = currentPhotoFrame.baseView.center;
        photoFrame.baseView.transform = currentPhotoFrame.baseView.transform;
        photoFrame.photoImageView.frameSize = photoFrame.baseView.bounds.size;
        photoFrame.photoImageView.center = CGPointMake(photoFrame.baseView.bounds.size.width/2, photoFrame.baseView.bounds.size.height/2);
        photoFrame.photoImageView.image = currentPhotoFrame.photoImageView.image;
        photoFrame.indexInLayer = [NSString stringWithFormat:@"%ld",editingVC.originalIndexInLayer];
        [currentPhotoFrame.baseView removeFromSuperview];// 기존 것 떼어주고
    } else {
        [photoFrame setItemCenterAndScale];
        photoFrame.baseView.center = editingVC.bgView.center;
    }

    editingVC.recentPhotoFrame = photoFrame;
    editingVC.currentItem = photoFrame;
    editingVC.currentPhotoFrame = photoFrame;
    [editingVC.layerController bringCurrentItemToFront];

}


#pragma mark - 레이아웃 델리게이트

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
        PhotoFrameCollectionReusableView *reusableView = (PhotoFrameCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"PhotoFrameCollectionReusableView" forIndexPath:indexPath];
        NSArray *photoFrameCategories;
        if (SaveManager.sharedInstance.currentProject.selectedTemplateName.length > 0) {
            photoFrameCategories =ItemManager.sharedInstance.photoFrameCategories;
        } else {
            photoFrameCategories =ItemManager.sharedInstance.photoFrameCategoriesForFreeFormProject;
        }

        NSString *category = photoFrameCategories[indexPath.section];
        reusableView.categoryLabel.text = category;
        return reusableView;
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
        return CGSizeMake(self.collectionView.frameWidth, 20);
}

@end
