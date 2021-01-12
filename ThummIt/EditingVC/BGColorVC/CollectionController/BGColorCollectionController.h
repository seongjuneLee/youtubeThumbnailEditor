//
//  BGColorCollectionController.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BGColorCollectionController : NSObject <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) UICollectionView *collectionView;
@property (weak, nonatomic) UIImage *currentImage;

@end

NS_ASSUME_NONNULL_END
