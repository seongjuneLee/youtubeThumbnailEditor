//
//  EditingLayerController.h
//  Thummit
//
//  Created by 이성준 on 2020/12/19.
//

#import <Foundation/Foundation.h>
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@interface EditingLayerController : NSObject

@property (weak, nonatomic) UIViewController *editingVC;

@property (strong, nonatomic, nullable) UIView *transparentView;
@property (nonatomic) NSUInteger originalIndex;

@property (strong, nonatomic) Item *currentItem;

@property (nonatomic, strong) UIImpactFeedbackGenerator *impactFeedbackGenerator;

-(void)bringCurrentItemToFront;
-(void)recoverOriginalLayer;
-(void)showTransparentView;
-(void)hideTransparentView;
-(void)updateLayer;

@end

NS_ASSUME_NONNULL_END
