//
//  GuideLine.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/23.
//

#import "GuideLine.h"

@implementation GuideLine

-(instancetype)init{
    self = [super init];
    
    self.guideLineView = [[GuideLineView alloc] init];
    self.dashedGuideLineView = [[DashedGuideLineView alloc] init];
    
    return self;
}

-(void)removeFromSuperView{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.2 animations:^{
            self.guideLineView.alpha =
            self.dashedGuideLineView.alpha = 0.0;
        }completion:^(BOOL finished) {
            [self.guideLineView removeFromSuperview];
            [self.dashedGuideLineView removeFromSuperview];
        }];
    });
    
    
}

@end
