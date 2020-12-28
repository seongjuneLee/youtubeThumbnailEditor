//
//  EditingContentModeController.h
//  Thummit
//
//  Created by 이성준 on 2020/12/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum {
    NormalMode = 0,
    EditingPhotoFrameMode = 1,
} EditingMode;

@protocol EditingModeControllerDelegate <NSObject>


@end
//상태에 따른 기본적인 UI 컨트롤러
@interface EditingModeController : NSObject

@property (weak, nonatomic) id<EditingModeControllerDelegate> delegate;
@property (nonatomic) EditingMode editingMode;

@property (weak, nonatomic) UIButton *leftItem;
@property (weak, nonatomic) NSLayoutConstraint *leftItemWidthConstraint;
@property (weak, nonatomic) UIButton *rightItem;

-(void)setUpEditingMode:(EditingMode)editingMode;

@end

NS_ASSUME_NONNULL_END
