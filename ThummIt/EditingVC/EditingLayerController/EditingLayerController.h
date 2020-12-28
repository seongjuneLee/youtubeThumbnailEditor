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

@property (weak, nonatomic) UIView *view;
@property (weak, nonatomic) UIView *gestureView;
@property (weak, nonatomic) UIImageView *imageView;
@property (strong, nonatomic, nullable) UIView *transparentView;
@property (nonatomic) NSUInteger originalIndex;

@property (weak, nonatomic) Item *selectedItem;


-(void)bringSelectedItemToFront:(Item *)selectedItem;
-(void)recoverOriginalLayer;

@end

NS_ASSUME_NONNULL_END
