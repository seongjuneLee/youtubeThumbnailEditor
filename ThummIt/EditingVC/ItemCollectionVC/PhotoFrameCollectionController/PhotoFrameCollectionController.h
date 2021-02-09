//
//  PhotoFrameCollectionController.h
//  ThummIt
//
//  Created by 이성준 on 2020/12/29.
//

#import <Foundation/Foundation.h>
#import "PhotoFrame.h"

NS_ASSUME_NONNULL_BEGIN
@interface PhotoFrameCollectionController : NSObject <UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UIImage *firstPhoto;
@property (weak, nonatomic) UIViewController *editingVC;

-(id)initWithCollectionView:(UICollectionView *)collectionView;
-(void)didSelectPhotoFrame:(PhotoFrame *)photoFrame;

@end

NS_ASSUME_NONNULL_END
