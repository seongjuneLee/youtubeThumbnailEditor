//
//  KidsTrapezoid3.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/14.
//

#import "KidsTrapezoid3.h"

@implementation KidsTrapezoid3

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
        
    self.baseView.frameSize = CGSizeMake(screenWidth * 0.7, screenHeight);;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(screenWidth * 0.5, 0)];
    [path addLineToPoint:CGPointMake(screenWidth * 0.7, screenHeight)];
    [path addLineToPoint:CGPointMake(0, screenHeight)];
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

+(KidsTrapezoid3*)kidsTrapezoid3{
    
    KidsTrapezoid3* kidsTrapezoid3 = [[self alloc] init];
    return kidsTrapezoid3;
    
}

@end
