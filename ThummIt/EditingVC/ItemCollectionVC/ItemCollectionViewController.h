//
//  ItemCollectionViewController.h
//  ThummIt
//
//  Created by 이성준 on 2020/12/29.
//

#import <UIKit/UIKit.h>
#import "PhotoFrameCollectionController.h"
#import "TextCollectionController.h"
#import "StickerCollectionController.h"
#import "MainFrameCollectionController.h"
#import "Item.h"
#import "PhotoManager.h"
#import "ItemManager.h"
#import "Text.h"
#import "EditingPhotoButtonViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef enum {
    PhotoType = 0,
    PhotoFrameType = 1,
    TextType = 2,
    StickerType = 3,
    MainFrameType = 4
}ItemType;

@interface ItemCollectionViewController : UIViewController 

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UIView *textScrollContainerView;
@property (weak, nonatomic) IBOutlet UIView *photoFrameScrollContanerView;
@property (weak, nonatomic) IBOutlet UIView *stickerScrollContainerView;
@property (weak, nonatomic) IBOutlet UIButton *textButton;
@property (weak, nonatomic) IBOutlet UIButton *typoButton;
@property (weak, nonatomic) IBOutlet UIButton *photoFrameStyleButton;
@property (weak, nonatomic) IBOutlet UIButton *photoFramePhotoButton;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *photoScrollContainerView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *photoButton;
@property (weak, nonatomic) IBOutlet UIButton *editPhotoButton;

@property (nonatomic) ItemType itemType;
@property (strong, nonatomic) PhotoFrameCollectionController *photoFrameCollectionController;
@property (strong, nonatomic) TextCollectionController *textCollectionController;
@property (strong, nonatomic) StickerCollectionController *stickerCollectionController;
@property (strong, nonatomic) MainFrameCollectionController *mainFrameCollectionController;
@property (strong, nonatomic, nullable) EditingPhotoButtonViewController *editingPhotoButtonVC;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerTopConstraint;
@property (weak, nonatomic) UIViewController *editingVC;

-(void)dismissSelf;

@end

NS_ASSUME_NONNULL_END
