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
#import "EditingPhotoViewController.h"
#import "ItemCollectionViewController.h"
#import "SaveManager.h"
#import "ItemManager.h"
#import "ItemLayer.h"
#import "Typography.h"
#import "UndoManager.h"
#import "TypoHeader.h"
#import "PhotoFrameHeader.h"
#import "Photo.h"
#import "StickerHeader.h"
#import "MainFrameHeader.h"
#import "AppManager.h"
#import "EditingPhotoButtonViewController.h"

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
@property (strong, nonatomic, nullable) EditingPhotoViewController *editingPhotoVC;
@property (strong, nonatomic, nullable) EditingPhotoButtonViewController *editingPhotoButtonVC;

// 모델
@property (strong, nonatomic) Template *selectedTemplate;
@property (strong, nonatomic, nullable) Item *currentItem;
@property (strong, nonatomic, nullable) Text *currentText;
@property (strong, nonatomic, nullable) PhotoFrame *currentPhotoFrame;
@property (strong, nonatomic, nullable) Photo *currentPhoto;
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
@property (strong, nonatomic, nullable) Photo *originalPhoto;

@property (strong, nonatomic) Typography *originalTypo; // text
@property (strong, nonatomic) NSString *originalText;

@property (strong, nonatomic) NSString *originalStickerBGImageName; // sticker
@property (strong, nonatomic) UIColor *originalTintColor;
@property (strong, nonatomic) Sticker *originalSticker;
@property (nonatomic) BOOL originalColorChangable;
@property (nonatomic) NSUInteger originalIndexInLayer;

@property (strong, nonatomic) MainFrame *origialMainFrame;
@property (strong, nonatomic) NSString *originalMainFrameImageName; // mainframe

@property (strong, nonatomic, nullable) UIColor *originalColor; // bgColor

@property (weak, nonatomic) IBOutlet UIView *upperArea;
@property (weak, nonatomic) IBOutlet UIView *gestureView;
@property (weak, nonatomic) IBOutlet UIView *photoFrameButtonContentView;
@property (weak, nonatomic) IBOutlet UIView *deleteButtonContentView;
@property (weak, nonatomic) IBOutlet UIView *underAreaView;
@property (weak, nonatomic) IBOutlet UIView *textButtonContentView;
@property (weak, nonatomic) IBOutlet UIButton *textButtonInScrollView;
@property (weak, nonatomic) IBOutlet UIView *photoButtonContentView;

@property (weak, nonatomic) IBOutlet UIButton *photoFrameButton;
@property (weak, nonatomic) IBOutlet UIButton *textButton;
@property (weak, nonatomic) IBOutlet UIButton *stickerButton;
@property (weak, nonatomic) IBOutlet UIButton *mainFrameButton;
@property (weak, nonatomic) IBOutlet UIButton *bgColorButton;
@property (weak, nonatomic) IBOutlet UIView *stickerButtonContentView;
@property (weak, nonatomic) IBOutlet UIView *bgColorButtonContentView;
@property (weak, nonatomic) IBOutlet UIScrollView *itemLayerScrollView;
@property (weak, nonatomic) IBOutlet UIView *itemLayerContentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *itemLayerContentViewHeightConstraint;

@property (weak, nonatomic) IBOutlet UIScrollView *buttonScrollView;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIButton *undoButton;
@property (weak, nonatomic) IBOutlet UIButton *redoButton;
@property (weak, nonatomic) IBOutlet UISlider *hueSlider;
@property (weak, nonatomic) IBOutlet UIImageView *mainFrameImageView;
@property (weak, nonatomic) IBOutlet UIButton *leftItem;
@property (weak, nonatomic) IBOutlet UIButton *rightItem;
@property (weak, nonatomic) IBOutlet UIButton *photoButton;

@property (strong, nonatomic) UIImageView *hueImageView;
@property (strong, nonatomic) UIView *thumbCircleView;
@property (nonatomic) BOOL itemLoaded;

@property (strong, nonatomic, nullable) NSString *justTyped;
@property (strong, nonatomic, nullable) UIColor *originalCursorColor;

-(void)loadItems;
-(void)showItemsForNormalMode;
-(void)hideItemsForItemMode;

@property (weak, nonatomic) IBOutlet UIView *scrollContentView;
@property (weak, nonatomic) IBOutlet UIView *itemCollectionContainerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *itemCollectionContainerTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *itemCollectionContainerHeightConstraint;

@property (weak, nonatomic) IBOutlet UIView *bgColorContainerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bgColorTopConstraint;

@property (nonatomic) BOOL isFirstLoadView;
@property (nonatomic) BOOL isApproachByContinue;

- (IBAction)photoButtonTapped:(id)sender;

@end

NS_ASSUME_NONNULL_END
