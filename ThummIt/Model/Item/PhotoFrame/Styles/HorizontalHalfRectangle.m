//
//  HorizontalHalfRectangle.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/13.
//

#import "HorizontalHalfRectangle.h"

@implementation HorizontalHalfRectangle

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"HorizontalHalfRectangle";
        [self setBaseViewFrame];
        
    }
    return self;
    
}

-(void)setBaseViewFrame{
    [super setBaseViewFrame];
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float screenHeight = screenWidth * 9/16;
    self.baseView.frameSize = CGSizeMake(screenWidth, screenHeight * 0.5);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(HorizontalHalfRectangle*)horizontalHalfRectangle{
    
    HorizontalHalfRectangle* horizontalHalfRectangle = [[self alloc] init];
    return horizontalHalfRectangle;
    
}

@end
