//
//  ItemLayer.h
//  ThummIt
//
//  Created by 이성준 on 2021/02/24.
//

#import <Foundation/Foundation.h>
#import "Text.h"
#import "PhotoFrame.h"
#import "Sticker.h"
NS_ASSUME_NONNULL_BEGIN

@interface ItemLayer : NSObject <UIGestureRecognizerDelegate>

@property (strong, nonatomic) UIView *barBaseView;
@property (strong, nonatomic) Item *item;
@property (nonatomic) BOOL isLongPressed;

@property (nonatomic) NSInteger originalCenterY;
@property (nonatomic) NSInteger itemLayerIndex; // savemanager itemlayers에 저장된 객체의 index

@property (nonatomic) UIImageView *backgroundImageView;
@property (nonatomic) float barBaseViewHeight;
-(void)makeView;


@end

NS_ASSUME_NONNULL_END
