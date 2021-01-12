//
//  StickerCollectionController.h
//  ThummIt
//
//  Created by 조재훈 on 2021/01/12.
//

#import <Foundation/Foundation.h>
#import "StickerManager.h"
#import "Sticker.h"

NS_ASSUME_NONNULL_BEGIN

@protocol StickerCollectionControllerDelegate <NSObject>

-(void)didSelectSticker:(Sticker *)sticker;

@end

@interface StickerCollectionController : NSObject <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) id<StickerCollectionControllerDelegate> delegate;
@property (weak, nonatomic) UICollectionView *collectionView;

-(id)initWithCollectionView:(UICollectionView *)collectionView;

@end

NS_ASSUME_NONNULL_END
