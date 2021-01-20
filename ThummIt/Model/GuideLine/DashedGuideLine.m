//
//  DashedGuideLine.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/21.
//

#import "DashedGuideLine.h"
#import "Item.h"

@implementation DashedGuideLine

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

-(instancetype)init{
    self = [super init];
    if (self) {
//        self.backgroundColor = UIColor.clearColor;
        self.frameHeight = 2;
    }
    
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self makeViewDashed];
    }
    return self;
}

-(id)initWithItem:(Item *)item{
    
    self = [super init];
    if (self) {
        
        
        
    }
    return self;
    
}

-(void)makeViewDashed{
    
    // Important, otherwise we will be adding multiple sub layers
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    //draw a line
    
    [path moveToPoint:CGPointMake(0, 0)]; //add yourStartPoint here
    [path addLineToPoint:CGPointMake(self.frameSize.width, 0)];// add yourEndPoint here
    [path stroke];

//    CGFloat dashPattern[] = {2.0f,6.0f,4.0f,2.0f}; //make your pattern here
//    [path setLineDash:dashPattern count:4 phase:3];

    UIColor *fill = [UIColor colorWithRed:60.0/255.0 green:120.0/255.0 blue:180.0/255.0 alpha:1.0];
    shapeLayer.strokeStart = 0.0;
    shapeLayer.strokeColor = fill.CGColor;
    shapeLayer.lineWidth = 2.0;
    shapeLayer.lineJoin = kCALineJoinMiter;
    shapeLayer.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:5],[NSNumber numberWithInt:7], nil];
    shapeLayer.path = path.CGPath;
    
    [[self layer] addSublayer:shapeLayer];
}
@end
