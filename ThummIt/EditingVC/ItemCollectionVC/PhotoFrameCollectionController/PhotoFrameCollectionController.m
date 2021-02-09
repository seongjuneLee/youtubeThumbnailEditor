//
//  PhotoFrameCollectionController.m
//  ThummIt
//
//  Created by 이성준 on 2020/12/29.
//

#import "PhotoFrameCollectionController.h"
#import "PhotoFrameCollectionViewCell.h"
#import "PhotoFrameCollectionReusableView.h"
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

    }
    
    return self;
    
}

#pragma mark - 데이타 소스

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return ItemManager.sharedInstance.photoFrameCategories.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    NSArray *photoFrames = ItemManager.sharedInstance.photoFrameDatas[section];
    
    return photoFrames.count;
}

-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PhotoFrameCollectionViewCell *cell = (PhotoFrameCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoFrameCollectionViewCell" forIndexPath:indexPath];
    NSArray *photoFrames = ItemManager.sharedInstance.photoFrameDatas[indexPath.section];

    PhotoFrame *photoFrame = photoFrames[indexPath.item];
    [photoFrame loadView];

    [PhotoManager.sharedInstance getFirstPhotoFromAlbumWithContentMode:PHImageContentModeAspectFill withSize:CGSizeMake(500, 500) WithCompletionBlock:^(UIImage * _Nonnull image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            photoFrame.photoImageView.image = image;
            cell.previewImageView.image = [photoFrame.baseView toImage];

        });
    }];

    
    return cell;
}

#pragma mark - 델리게이트

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *photoFrames = ItemManager.sharedInstance.photoFrameDatas[indexPath.section];

    PhotoFrame *photoFrame = photoFrames[indexPath.item];
    [self didSelectPhotoFrame:photoFrame];
    
}

-(void)didSelectPhotoFrame:(PhotoFrame *)photoFrame{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;

    [photoFrame loadView];
    if (editingVC.currentItem) {
        PhotoFrame *currentPhotoFrame = (PhotoFrame *)editingVC.currentItem;
        // 위치, 크기,사진 유지
        photoFrame.baseView.center = currentPhotoFrame.baseView.center;
        photoFrame.baseView.transform = currentPhotoFrame.baseView.transform;
        photoFrame.photoImageView.frame = currentPhotoFrame.photoImageView.frame;
        photoFrame.photoImageView.image = currentPhotoFrame.photoImageView.image;

        [currentPhotoFrame.baseView removeFromSuperview];// 기존 것 떼어주고
    } else {
        [photoFrame scaleItem];
        photoFrame.baseView.center = editingVC.bgView.center;
    }

    [editingVC.layerController bringCurrentItemToFront:photoFrame];
    editingVC.recentPhotoFrame = photoFrame;
    editingVC.currentItem = photoFrame;
    editingVC.currentPhotoFrame = photoFrame;
    
}


#pragma mark - 레이아웃 델리게이트

//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    
//    PhotoFrameCollectionReusableView *reusableView = (PhotoFrameCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"PhotoFrameCollectionReusableView" forIndexPath:indexPath];
//    NSString *category = ItemManager.sharedInstance.photoFrameCategories[indexPath.section];
//    reusableView.categoryLabel.text = category;
//    
//    return reusableView;
//}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.collectionView.frameWidth, 25);
}

@end
