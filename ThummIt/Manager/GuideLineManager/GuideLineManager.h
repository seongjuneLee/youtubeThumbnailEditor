//
//  GuideLineManager.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/23.
//

#import <Foundation/Foundation.h>
#import "Item.h"
NS_ASSUME_NONNULL_BEGIN

@interface GuideLineManager : NSObject

+ (GuideLineManager *)sharedInstance;

-(NSMutableArray *)criteriasForFrameWithBGView:(UIView *)bgView;
-(NSMutableArray *)criteriasForItemFrameWithCurrentItem:(Item *)currentItem withBGView:(UIView *)bgView;
-(NSMutableArray *)frameTargetsWithCurrentItem:(Item *)item;
- (CGFloat)distanceBetweenRect:(CGRect)rect andPoint:(CGPoint)point;

@end

NS_ASSUME_NONNULL_END
