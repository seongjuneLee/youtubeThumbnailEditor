//
//  TextCollectionController.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/08.
//

#import <Foundation/Foundation.h>
#import "Text.h"
NS_ASSUME_NONNULL_BEGIN

@protocol TextCollectionControllerDelegate <NSObject>

-(void)didSelectTypo:(Typography *)typo;

@end

@interface TextCollectionController : NSObject <UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) id<TextCollectionControllerDelegate> delegate;
@property (weak, nonatomic) UICollectionView *collectionView;
@property (weak, nonatomic) UIViewController *editingVC;

-(id)initWithCollectionView:(UICollectionView *)collectionView;

@end

NS_ASSUME_NONNULL_END
