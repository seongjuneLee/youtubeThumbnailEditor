//
//  UIColor+Additions.h
//  Vlogr
//
//  Created by TaejunLee on 2019. 2. 17..
//  Copyright © 2019년 TaejunLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Additions)

-(UIColor*)setBrightness:(CGFloat)brightness alpha:(CGFloat)alpha;
+ (UIColor*) diagonalGradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(int)height;
@end
