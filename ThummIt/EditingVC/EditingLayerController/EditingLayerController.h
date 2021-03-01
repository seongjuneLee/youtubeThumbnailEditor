//
//  EditingLayerController.h
//  Thummit
//
//  Created by 이성준 on 2020/12/19.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "ItemLayer.h"
NS_ASSUME_NONNULL_BEGIN

@interface EditingLayerController : NSObject 

@property (weak, nonatomic) UIViewController *editingVC;

@property (strong, nonatomic, nullable) UIView *transparentView;
@property (nonatomic) NSUInteger originalIndex;

@property (strong, nonatomic) Item *currentItem;
@property (strong, nonatomic) ItemLayer *itemLayer;
@property (nonatomic) CGPoint previousPoint;
@property (strong, nonatomic) ItemLayer *pressedItemLayer;
@property (strong, nonatomic) ItemLayer *nextItemLayer;

@property (nonatomic) NSInteger pressedItemOriginalCenterY;
@property (nonatomic) NSInteger nextItemOriginalCenterY;


-(void)bringCurrentItemToFront:(Item *)CurrentItem;
-(void)recoverOriginalLayer;
-(void)showTransparentView;
-(void)hideTransparentView;
-(void)addItemLayerGestureRecognizers:(ItemLayer *)itemLayer;

@end

NS_ASSUME_NONNULL_END
