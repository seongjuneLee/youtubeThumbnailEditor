//
//  GuideLine.h
//  ThummIt
//
//  Created by 이성준 on 2021/01/23.
//

#import <Foundation/Foundation.h>
#import "GuideLineView.h"
#import "DashedGuideLineView.h"
#import "Item.h"
NS_ASSUME_NONNULL_BEGIN

@interface GuideLine : NSObject

@property (strong, nonatomic) Item *criteriaItem;
@property (strong, nonatomic) GuideLineView *guideLineView;
@property (strong, nonatomic) DashedGuideLineView *dashedGuideLineView;
@property (nonatomic) CGRect guideArea;
@property (nonatomic) float guideValue;

-(void)removeFromSuperView;

@end

NS_ASSUME_NONNULL_END
