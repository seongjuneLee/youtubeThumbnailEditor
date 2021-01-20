//
//  GuideLine.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum {
    Center = 0,
    Frame = 1,
    Top = 2,
    Bottom = 3,
    Leading = 4,
    Trailing = 5,
}GuideType;

@interface GuideLine : UIView

@property (nonatomic) GuideType guideType;

@end

NS_ASSUME_NONNULL_END
