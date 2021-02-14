//
//  TwoThirdsPhotoFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/13.
//

#import "ThreeFifthsRectangle.h"

@implementation ThreeFifthsRectangle

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"threeFifthsRectangle";
        [self setBaseViewFrame];
        
    }
    return self;
    
}

-(void)setBaseViewFrame{
    [super setBaseViewFrame];
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float frameWidth = screenWidth * 0.6;
    self.baseView.frameSize = CGSizeMake(frameWidth, screenWidth * 9/16);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(ThreeFifthsRectangle*)threeFifthsRectangle{
    
    ThreeFifthsRectangle* threeFifthsRectangle = [[self alloc] init];
    return threeFifthsRectangle;
    
}


@end
