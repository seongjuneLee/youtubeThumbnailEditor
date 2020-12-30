//
//  ItemCollectionViewController.h
//  ThummIt
//
//  Created by 이성준 on 2020/12/29.
//

#import <UIKit/UIKit.h>
#import "PhotoFrameCollectionController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ItemCollectionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) UIVisualEffectView *blurView;
@property (strong, nonatomic) PhotoFrameCollectionController *collectionController;

@end

NS_ASSUME_NONNULL_END
