//
//  StickerCollectionController.h
//  ThummIt
//
//  Created by 조재훈 on 2021/01/12.
//

#import <Foundation/Foundation.h>
#import "Sticker.h"

NS_ASSUME_NONNULL_BEGIN

@interface StickerCollectionController : NSObject <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) UICollectionView *collectionView;
@property (weak, nonatomic) UIViewController *editingVC;

-(id)initWithCollectionView:(UICollectionView *)collectionView;
-(void)didSelectSticker:(Sticker *)sticker;

@end

NS_ASSUME_NONNULL_END
