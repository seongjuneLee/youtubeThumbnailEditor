//
//  PhotoFrameCollectionController.h
//  ThummIt
//
//  Created by 이성준 on 2020/12/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoFrameCollectionController : NSObject <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UIImage *firstPhoto;

-(id)initWithCollectionView:(UICollectionView *)collectionView;

@end

NS_ASSUME_NONNULL_END
