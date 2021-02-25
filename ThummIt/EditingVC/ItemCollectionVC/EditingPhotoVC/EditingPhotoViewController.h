//
//  EditingPhotoViewController.h
//  ThummIt
//
//  Created by 이성준 on 2021/02/24.
//

#import <UIKit/UIKit.h>
#import "PhotoFrame.h"
#import "EditingPhotoButtonViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface EditingPhotoViewController : UIViewController <EditingPhotoButtonViewControllerDelegate>


@property (strong, nonatomic) UIImageView *photoImageView;
@property (strong, nonatomic) UIViewController *editingVC;
@property (weak, nonatomic) IBOutlet UIView *gestureView;
@property (nonatomic) CGPoint originalPoint;
@property (nonatomic) CGPoint originalCenter;
@property (nonatomic) CGPoint originalFirstFinger;
@property (nonatomic) CGPoint originalSecondFinger;
@property (nonatomic) CGPoint originalPinchCenter;
@property (nonatomic) CGPoint originalItemViewCenter;

@property (nonatomic) float originalScaleRatio;
@property (nonatomic) float originalPinchDistance;

@property (nonatomic) BOOL isPinching;
@property (nonatomic) BOOL photoLoaded;

-(void)dismissSelf;

@end

NS_ASSUME_NONNULL_END
