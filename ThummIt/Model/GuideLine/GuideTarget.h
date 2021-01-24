//
//  GuideTarget.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    
    GuideTargetCenter = 0,
    GuideTargetTopLeft = 1,
    GuideTargetTopRight = 2,
    GuideTargetBottomLeft = 3,
    GuideTargetBottomRight = 4,

    
}GuideTargetType;
@interface GuideTarget : NSObject

@property (nonatomic) GuideTargetType guideTargetType;
@property (nonatomic) CGPoint targetPoint;

@end

NS_ASSUME_NONNULL_END
