//
//  EditingPhotoViewController.h
//  ThummIt
//
//  Created by 이성준 on 2021/02/24.
//

#import <UIKit/UIKit.h>
#import "Photo.h"
#import "EditingPhotoButtonViewController.h"
#import "UndoManager.h"
NS_ASSUME_NONNULL_BEGIN

@interface EditingPhotoViewController : UIViewController <UIGestureRecognizerDelegate>

@property (strong, nonatomic) UIImageView *photoImageView;
@property (strong, nonatomic) UIViewController *editingVC;
@property (weak, nonatomic) UIButton *includeButton;
@property (weak, nonatomic) UIButton *eraseButton;
@property (weak, nonatomic) IBOutlet UIView *gestureView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (nonatomic) CGPoint originalPoint;
@property (nonatomic) CGPoint originalCenter;
@property (nonatomic) CGPoint originalFirstFinger;
@property (nonatomic) CGPoint originalSecondFinger;
@property (nonatomic) CGPoint originalPinchCenter;
@property (nonatomic) CGPoint originalItemViewCenter;

@property (nonatomic) CGPoint lastPoint;

@property (nonatomic) float originalScaleRatio;
@property (nonatomic) float originalPinchDistance;
@property (nonatomic) float lastPinchDistance;

@property (nonatomic) BOOL isPinching;
@property (nonatomic) BOOL singleFingerOffedWhilePinching;
@property (nonatomic) BOOL photoLoaded;

-(void)dismissSelf;

@end

NS_ASSUME_NONNULL_END
