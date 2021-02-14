//
//  KidsTrapezoid2.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/14.
//

#import "KidsTrapezoid2.h"

@implementation KidsTrapezoid2

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"TwoFifthPhotoFrame";
        [self setBaseViewFrame];
        
    }
    return self;
    
}

-(void)setBaseViewFrame{
    [super setBaseViewFrame];
    
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float screenHeight = screenWidth * 9/16;
    
    self.baseView.frameSize = CGSizeMake(screenWidth * 0.4, screenHeight * 0.5);
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(screenWidth * 0.4, 0)];
    [path addLineToPoint:CGPointMake(screenWidth * 0.4, screenHeight * 0.5)];
    [path addLineToPoint:CGPointMake(screenWidth * 0.1, screenHeight * 0.5)];
    [path closePath];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    self.baseView.layer.mask = shapeLayer;


}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(KidsTrapezoid2*)kidsTrapezoid2{
    
    KidsTrapezoid2* kidsTrapezoid2 = [[self alloc] init];
    return kidsTrapezoid2;
    
}

@end
