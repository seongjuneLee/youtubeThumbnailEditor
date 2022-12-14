//
//  AlbumViewController+CollectionViewDelegate.m
//  Thummit
//
//  Created by 이성준 on 2020/12/12.
//

#import "AlbumViewController+CollectionViewDelegate.h"

@implementation AlbumViewController (CollectionViewDelegate)

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    self.selectedIndexPath = indexPath;
    PHAsset *selectedPHAsset = self.phAssets[indexPath.item];

    [self.delegate didSelectPhotoWithPHAsset:selectedPHAsset];
    [collectionView reloadData];
    
}

@end
