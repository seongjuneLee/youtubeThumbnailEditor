//
//  EditingViewController+GestureControllerDelegate.h
//  Thummit
//
//  Created by 이성준 on 2020/12/17.
//

#import "EditingViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface EditingViewController (GestureControllerDelegate)


-(void)didSelectItem:(Item *)item;

// 노멀 모드 팬제스쳐
-(void)readyUIForPanning;
-(void)deleteImageRespondToCurrentPointY:(float)currentPointY;
-(void)panGestureEndedForItem:(Item *)item withFingerPoint:(CGPoint)fingerPoint;

@end

NS_ASSUME_NONNULL_END
