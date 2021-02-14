//
//  KidsRecntangle1.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/14.
//

#import "KidsTrapezoid1.h"

@implementation KidsTrapezoid1
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
    
    self.baseView.frameSize = CGSizeMake(screenWidth * 0.5, screenHeight * 0.5);
    UIBezierPath *path1 = [[UIBezierPath alloc] init];
    [path1 moveToPoint:CGPointMake(0, 0)];
    [path1 addLineToPoint:CGPointMake(screenWidth * 0.5, 0)];
    [path1 addLineToPoint:CGPointMake(screenWidth * 0.5, screenHeight * 0.5)];
    [path1 addLineToPoint:CGPointMake(screenWidth * 0.1, screenHeight * 0.5)];
    [path1 closePath];
    
    CAShapeLayer *shapeLayer1 = [CAShapeLayer layer];
    shapeLayer1.path = path1.CGPath;
    self.baseView.layer.mask = shapeLayer1;

}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(KidsTrapezoid1*)kidsTrapezoid1{
    
    KidsTrapezoid1* kidsTrapezoid1 = [[self alloc] init];
    return kidsTrapezoid1;
    
}

@end
