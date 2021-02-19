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
#import "TypoHeader.h"
#import "PhotoFrameHeader.h"
#import "StickerHeader.h"
#import "AppManager.h"

NS_ASSUME_NONNULL_BEGIN
@interface EditingViewController : UIViewController

@property (strong, nonatomic) EditingViewController *collectionView;
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

// 최근 데이터
@property (strong, nonatomic, nullable) Typography *recentTypo;
@property (strong, nonatomic, nullable) PhotoFrame *recentPhotoFrame;
@property (strong, nonatomic, nullable) Sticker *recentSticker;
@property (strong, nonatomic, nullable) PHAsset *recentPHAsset;

// 아이템 변경전 기본값
@property (nonatomic) CGPoint originalCenter;
@property (nonatomic) CGAffineTransform originalTransform;

@property (strong, nonatomic, nullable) PhotoFrame *originalPhotoFrame;

@property (strong, nonatomic) Typography *originalTypo; // text
@property (strong, nonatomic) NSString *originalText;

@property (strong, nonatomic) NSString *originalStickerBGImageName; // sticker
@property (strong, nonatomic) UIColor *originalTintColor;
@property (strong, nonatomic) Sticker *originalSticker;
@property (nonatomic) BOOL originalColorChangable;
@property (nonatomic) NSUInteger originalIndexInLayer;

@property (strong, nonatomic, nullable) UIColor *originalColor; // bgColor

@property (weak, nonatomic) IBOutlet UIView *upperArea;
@property (weak, nonatomic) IBOutlet UIView *gestureView;
@property (weak, nonatomic) IBOutlet UIView *photoFrameButtonContainerView;
@property (weak, nonatomic) IBOutlet UIView *deleteButtonContainerView;
@property (weak, nonatomic) IBOutlet UIView *underAreaView;
@property (weak, nonatomic) IBOutlet UIView *textButtonContainerView;
@property (weak, nonatomic) IBOutlet UIButton *textButtonInScrollView;

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
@property (weak, nonatomic) IBOutlet UISlider *hueSlider;
@property (weak, nonatomic) IBOutlet UIImageView *mainFrameImageView;
@property (weak, nonatomic) IBOutlet UIButton *leftItem;
@property (weak, nonatomic) IBOutlet UIButton *rightItem;

@property (strong, nonatomic) UIImageView *hueImageView;
@property (strong, nonatomic) UIView *thumbCircleView;
@property (nonatomic) BOOL itemLoaded;

@property (strong, nonatomic, nullable) NSString *justTyped;
@property (strong, nonatomic, nullable) UIColor *originalCursorColor;

-(void)loadItems;
-(void)showItemsForNormalMode;
-(void)hideItemsForItemMode;

@property (weak, nonatomic) IBOutlet UIView *scrollContentView;




@end

NS_ASSUME_NONNULL_END
