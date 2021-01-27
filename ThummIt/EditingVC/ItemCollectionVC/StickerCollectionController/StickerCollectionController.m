//
//  StickerCollectionController.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/12.
//

#import "StickerCollectionController.h"
#import "StickerCollectionViewCell.h"
#import "StickerCollectionReusableView.h"

#import "ItemManager.h"

@implementation StickerCollectionController

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
        
        [self.collectionView registerNib:[UINib nibWithNibName:@"StickerCollectionViewCell" bundle:NSBundle.mainBundle] forCellWithReuseIdentifier:@"StickerCollectionViewCell"];
        [self.collectionView registerNib:[UINib nibWithNibName:@"StickerCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"StickerCollectionReusableView"];

    }
    
    return self;
    
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return ItemManager.sharedInstance.stickerCategories.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
        
    NSArray *stickers = ItemManager.sharedInstance.stickerDatas[section];
    return stickers.count;

}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    StickerCollectionViewCell *cell = (StickerCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"StickerCollectionViewCell" forIndexPath:indexPath];
   
    NSArray *stickers = ItemManager.sharedInstance.stickerDatas[indexPath.section];
    
    Sticker *sticker = stickers[indexPath.item];
    cell.stickerImageView.image = [UIImage imageNamed:sticker.backgroundImageName];
    
    return cell;
    
}

#pragma mark - 델리게이트

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *stickers = ItemManager.sharedInstance.stickerDatas[indexPath.section];
    Sticker *sticker = stickers[indexPath.item];
    [self.delegate didSelectSticker:sticker];
    
}

#pragma mark - 레이아웃 델리게이트

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    StickerCollectionReusableView *reusableView = (StickerCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"StickerCollectionReusableView" forIndexPath:indexPath];
    NSString *category = ItemManager.sharedInstance.stickerCategories[indexPath.section];
    reusableView.categoryLabel.text = category;
    
    return reusableView;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.collectionView.frameWidth, 25);
}

@end
