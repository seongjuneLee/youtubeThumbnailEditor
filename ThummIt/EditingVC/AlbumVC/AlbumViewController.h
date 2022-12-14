//
//  AlbumViewController.h
//  Thummit
//
//  Created by 이성준 on 2020/12/12.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "AlbumCollectionViewCell.h"
#import "PhotoManager.h"
#import "AlbumCategoryViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AlbumViewControllerDelegate <NSObject>

-(void)didSelectPhotoWithPHAsset:(PHAsset*)phAsset;

@end

@interface AlbumViewController : UIViewController <AlbumCategoryVCDelegate>
@property (weak, nonatomic) id<AlbumViewControllerDelegate> delegate;
@property (strong, nonatomic) NSMutableArray *phAssets;
@property (strong, nonatomic) NSIndexPath *selectedIndexPath;
@property (strong, nonatomic) UIViewController *editingVC;
@property (strong, nonatomic) AlbumCategoryViewController *albumCategoryVC;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *albumCategoryContainerTopConstraint;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewTopConstraint;

-(void)showWithAnimation;
-(void)hideWithAnimation;
-(void)dismissSelf;

@end

NS_ASSUME_NONNULL_END
