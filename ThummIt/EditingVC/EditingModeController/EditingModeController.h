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
    ItemMode = 1,
    BGColorMode = 2
} EditingMode;

@interface EditingModeController : NSObject

@property (nonatomic) EditingMode editingMode;
@property (weak, nonatomic) UIViewController *editingVC;

@end

NS_ASSUME_NONNULL_END
