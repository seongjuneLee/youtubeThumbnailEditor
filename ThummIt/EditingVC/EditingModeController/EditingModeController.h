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
    EditingItemMode = 1,
    AddingItemMode = 2,
    MainFrameAndBGColorMode = 3
} EditingMode;

@interface EditingModeController : NSObject

@property (nonatomic) EditingMode editingMode;
@property (weak, nonatomic) UIViewController *editingVC;

@end

NS_ASSUME_NONNULL_END
