//
//  QuarterRectangle.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/18.
//

#import "QuarterRectangle.h"

@implementation QuarterRectangle

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"HlafRectangle";
        [self setBaseViewFrame];
        
    }
    return self;
    
}

-(void)setBaseViewFrame{
    [super setBaseViewFrame];
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float circleViewWidth = screenWidth/2;
    self.baseView.frameSize = CGSizeMake(circleViewWidth, circleViewWidth * 9/16);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(QuarterRectangle *)quarterRectangle{
    
    QuarterRectangle *quarterRectangle = [[self alloc] init];
    return quarterRectangle;
    
}

@end
