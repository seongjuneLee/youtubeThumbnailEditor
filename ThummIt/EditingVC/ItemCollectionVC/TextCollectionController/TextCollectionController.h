//
//  TextCollectionController.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/08.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TextCollectionController : NSObject <UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

//@property (weak, nonatomic) id<PhotoFrameCollectionControllerDelegate> delegate;
@property (weak, nonatomic) UICollectionView *collectionView;

-(id)initWithCollectionView:(UICollectionView *)collectionView;

@end

NS_ASSUME_NONNULL_END
