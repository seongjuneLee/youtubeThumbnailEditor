//
//  EditingGestureController.h
//  Thummit
//
//  Created by 이성준 on 2020/12/17.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "EditingModeController.h"
#import "EditingModeController.h"
NS_ASSUME_NONNULL_BEGIN

@protocol EditingGestureControllerDelegate <NSObject>

-(void)didSelectItem:(Item *)item;
-(void)changeSelectedItem:(Item *)item;

// 노멀 모드 팬제스쳐
-(void)pangestureBeganForNoramlMode;
-(void)pangestureChangedInNormalMode:(Item *)item withDelta:(CGPoint)delta withFingerPoint:(CGPoint)fingerPoint;
-(void)pangestureEndedForNoramlMode:(Item *)item withFingerPoint:(CGPoint)fingerPoint;

// 아이템 모드 팬 제스쳐
-(void)pangestureChangedInEditingItemMode:(Item *)item withDelta:(CGPoint)delta;

@end

@interface EditingGestureController : NSObject 

-(id)initWithView:(UIView *)view;

@property (weak, nonatomic) id<EditingGestureControllerDelegate> delegate;

@property (nonatomic) EditingMode editingMode;
@property (weak, nonatomic) EditingModeController *editingModeController;

@property (weak, nonatomic) UIView *gestureView;
@property (strong, nonatomic) NSMutableArray *items;
@property (strong, nonatomic, nullable) Item *currentItem;

@property (nonatomic) CGPoint originalPoint;

-(void)addGestureRecognizers;

@end

NS_ASSUME_NONNULL_END
