//
//  StickerCollectionController.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/12.
//

#import "StickerCollectionController.h"
#import "StickerCollectionViewCell.h"
#import "StickerCollectionReusableView.h"
#import "EditingViewController.h"
#import "EditingViewController+Buttons.h"

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
    [self didSelectSticker:sticker];
    
}

-(void)didSelectSticker:(Sticker *)sticker{
    
    EditingViewController *editingVC = (EditingViewController *)self.editingVC;
    [sticker loadView];
    [sticker setItemCenterAndScale];
    UIImage *image = [UIImage imageNamed:sticker.backgroundImageName];
    if (editingVC.currentSticker) {
        
        Sticker *currentSticker = (Sticker *)editingVC.currentSticker;
        currentSticker.cannotChangeColor = sticker.cannotChangeColor;
        currentSticker.backgroundImageName = sticker.backgroundImageName;
        if (!currentSticker.cannotChangeColor) {
            currentSticker.backgroundImageView.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            [currentSticker.backgroundImageView setTintColor:sticker.tintColor];
            [UIView animateWithDuration:0.2 animations:^{
                editingVC.hueSlider.alpha = 1.0;
                editingVC.thumbCircleView.alpha = 1.0;
            }];
        } else{
            currentSticker.backgroundImageView.image = image;
            [editingVC hideAndInitSlider];
        }

    } else {

        sticker.baseView.center = editingVC.bgView.center;
        
        if (!sticker.cannotChangeColor) {
            sticker.backgroundImageView.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            [sticker.backgroundImageView setTintColor:sticker.tintColor];
            [UIView animateWithDuration:0.2 animations:^{
                editingVC.hueSlider.alpha = 1.0;
                editingVC.thumbCircleView.alpha = 1.0;
            }];
        } else{
            sticker.backgroundImageView.image = image;
            [editingVC hideAndInitSlider];
        }
        editingVC.currentItem = sticker;
        editingVC.currentSticker = sticker;

        [editingVC.layerController bringCurrentItemToFront:sticker];
    }

    
    editingVC.layerController.currentItem = sticker;
    
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
