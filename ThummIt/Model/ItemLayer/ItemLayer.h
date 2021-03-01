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
@property (strong, nonatomic) UIView *itemViewAtBGView; /* editingvc view의 index에 일치하는 itemview 를 가져와서 여기 넣어줌(이 뷰를 다시 Image화 해서 이 객체의 photoframeview나 stickerview에 넣어줌*/
@property (nonatomic) BOOL isLongPressed;

@property (nonatomic) NSInteger originalCenterY;
@property (nonatomic) NSInteger itemLayerIndex; // savemanager itemlayers에 저장된 객체의 index

-(void)makeView;


@end

NS_ASSUME_NONNULL_END
