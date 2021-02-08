//
//  EditingGestureController.h
//  Thummit
//
//  Created by 이성준 on 2020/12/17.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "PhotoFrame.h"
#import "Text.h"
#import "Sticker.h"
#import "EditingModeController.h"
#import "GuideLineView.h"
#import "DashedGuideLineView.h"

NS_ASSUME_NONNULL_BEGIN

@interface EditingGestureController : NSObject <UIGestureRecognizerDelegate>

-(id)initWithView:(UIView *)view;

@property (nonatomic) EditingMode editingMode;
@property (weak, nonatomic) UIViewController *editingVC;
@property (weak, nonatomic) UIView *gestureView;

@property (nonatomic) BOOL isPinching;

@property (nonatomic) CGPoint originalPoint;
@property (nonatomic) CGPoint originalCenter;

@property (nonatomic) float originalScaleRatio;
@property (nonatomic) float originalPinchDistance;
@property (nonatomic) float currentRotation;
@property (nonatomic) float lastRotation;
@property (nonatomic) CGPoint originalPinchCenter;
@property (nonatomic) CGPoint originalFirstFinger;
@property (nonatomic) CGPoint originalSecondFinger;
@property (nonatomic) CGPoint originalItemViewCenter;

@property (strong, nonatomic) NSMutableArray *guideLines;
@property (strong, nonatomic) NSMutableArray *itemGuideLines;
@property (strong, nonatomic) NSMutableArray *itemSizeGuideLines;
@property (strong, nonatomic) NSMutableArray *itemGuideTargets;
@property (strong, nonatomic) NSMutableArray *itemDegreeGuides;
@property (nonatomic) BOOL isMagneting;
@property (nonatomic) float shortestDistance;

@property (nonatomic) BOOL isPinchingItem;

@property (strong, nonatomic) GuideLineView *top;
@property (strong, nonatomic) GuideLineView *bottom;
@property (strong, nonatomic) GuideLineView *trailing;
@property (strong, nonatomic) GuideLineView *leading;
@property (strong, nonatomic, nullable) DashedGuideLineView *rotationDashedLine;

@property (strong, nonatomic) UIView *comparingView;

-(void)addGestureRecognizers;

@end

NS_ASSUME_NONNULL_END
