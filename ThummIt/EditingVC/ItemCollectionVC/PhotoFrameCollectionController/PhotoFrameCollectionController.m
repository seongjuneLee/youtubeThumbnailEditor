//
//  PhotoFrameCollectionController.m
//  ThummIt
//
//  Created by 이성준 on 2020/12/29.
//

#import "PhotoFrameCollectionController.h"
#import "PhotoFrameCollectionViewCell.h"
#import "ItemManager.h"
#import "PhotoManager.h"
#import "PhotoFrame.h"

@implementation PhotoFrameCollectionController

-(id)init{
    
    self = [super init];
    if (self) {
        [PhotoManager.sharedInstance getFirstPhotoFromAlbumWithContentMode:PHImageContentModeAspectFill withSize:CGSizeMake(200, 200) WithCompletionBlock:^(UIImage * _Nonnull image) {
            self.firstPhoto = image;
        }];
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
        [PhotoManager.sharedInstance getFirstPhotoFromAlbumWithContentMode:PHImageContentModeAspectFill withSize:CGSizeMake(200, 200) WithCompletionBlock:^(UIImage * _Nonnull image) {
            self.firstPhoto = image;
        }];
    }
    
    return self;
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return ItemManager.sharedInstance.photoFrameCategories.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (section == 0) {
        return ItemManager.sharedInstance.circlePhotoFrames.count;
    } else if (section == 1){
        return ItemManager.sharedInstance.rectanglePhotoFrames.count;
    }
    return 0;
}

-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PhotoFrameCollectionViewCell *cell = (PhotoFrameCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoFrameCollectionViewCell" forIndexPath:indexPath];
    
    PhotoFrame *photoFrame;
    if (indexPath.section == 0) {
        photoFrame = ItemManager.sharedInstance.circlePhotoFrames[indexPath.item];
    } else if (indexPath.section == 1){
        photoFrame = ItemManager.sharedInstance.rectanglePhotoFrames[indexPath.item];
    }
    photoFrame.imageView.image = self.firstPhoto;
    cell.photoFrameBaseView = photoFrame.baseView;
    
    return cell;
}

@end
