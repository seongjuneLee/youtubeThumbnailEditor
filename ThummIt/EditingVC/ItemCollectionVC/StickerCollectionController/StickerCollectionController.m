//
//  StickerCollectionController.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/12.
//

#import "StickerCollectionController.h"
#import "StickerCollectionViewCell.h"

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
//        [self.collectionView registerNib:[UINib nibWithNibName:@"PhotoFrameCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"PhotoFrameCollectionReusableView"];

    }
    
    return self;
    
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return StickerManager.sharedInstance.stickers.count; //
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    StickerCollectionViewCell *cell = (StickerCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"StickerCollectionViewCell" forIndexPath:indexPath];
   
    Sticker *sticker = StickerManager.sharedInstance.stickers[indexPath.item];
    cell.stickerImageView.image = [UIImage imageNamed:sticker.backgroundImageName];
    
    return cell;
    
}

#pragma mark - 테이블 델리게이트

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    Sticker *sticker = StickerManager.sharedInstance.stickers[indexPath.item];
    [self.delegate didSelectSticker:sticker];
    
}

@end
