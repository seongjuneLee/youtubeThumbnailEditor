//
//  EditingViewController.h
//  Thummit
//
//  Created by 이성준 on 2020/12/14.
//

#import <UIKit/UIKit.h>
#import "Template.h"
#import "AlbumViewController.h"
#import "EditingGestureController.h"
#import "EditingModeController.h"
#import "BGColorViewController.h"
#import "EditingLayerController.h"
#import "ItemCollectionViewController.h"
#import "SaveManager.h"
#import "ItemManager.h"
#import "Typography.h"
#import "UndoManager.h"
NS_ASSUME_NONNULL_BEGIN
@interface EditingViewController : UIViewController

// 컨트롤러
@property (strong, nonatomic) EditingModeController *modeController;
@property (strong, nonatomic) EditingGestureController *gestureController;
@property (strong, nonatomic) EditingLayerController *layerController;
@property (strong, nonatomic, nullable) BGColorViewController *bgColorVC;
@property (strong, nonatomic) ItemCollectionViewController *itemCollectionVC;
@property (strong, nonatomic, nullable) AlbumViewController *albumVC;

// 모델
@property (strong, nonatomic) Template *selectedTemplate;
@property (strong, nonatomic, nullable) Item *currentItem;
@property (strong, nonatomic, nullable) Text *currentText;
@property (strong, nonatomic, nullable) PhotoFrame *currentPhotoFrame;
@property (strong, nonatomic, nullable) Sticker *currentSticker;
@property (strong, nonatomic, nullable) Typography *recentTypo;

// 아이템 변경전 기본값
@property (strong, nonatomic, nullable) UIColor *originalColor;
@property (strong, nonatomic, nullable) UIImage *originalPhotoFrameImage;
@property (strong, nonatomic, nullable) PHAsset *originalPHAsset;
@property (nonatomic) CGPoint originalImageViewCenter;
@property (nonatomic) CGAffineTransform originalTransform;

@property (weak, nonatomic) IBOutlet UIView *upperArea;
@property (weak, nonatomic) IBOutlet UIView *gestureView;
@property (weak, nonatomic) IBOutlet UIButton *leftItem;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftItemWidthConstraint;
@property (weak, nonatomic) IBOutlet UIButton *rightItem;
@property (weak, nonatomic) IBOutlet UIView *photoFrameButtonContainerView;
@property (weak, nonatomic) IBOutlet UIView *deleteButtonContainerView;
@property (weak, nonatomic) IBOutlet UIView *underAreaView;
@property (weak, nonatomic) IBOutlet UIView *textButtonContainerView;

@property (weak, nonatomic) IBOutlet UIButton *photoFrameButton;
@property (weak, nonatomic) IBOutlet UIButton *textButton;
@property (weak, nonatomic) IBOutlet UIButton *stickerButton;
@property (weak, nonatomic) IBOutlet UIButton *bgColorButton;
@property (weak, nonatomic) IBOutlet UIView *stickerButtonContainerView;
@property (weak, nonatomic) IBOutlet UIView *bgColorButtonContainerView;
@property (weak, nonatomic) IBOutlet UIScrollView *buttonScrollView;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIButton *undoButton;
@property (weak, nonatomic) IBOutlet UIButton *redoButton;

-(void)loadItems;

@end

NS_ASSUME_NONNULL_END
