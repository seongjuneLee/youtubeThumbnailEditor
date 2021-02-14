//
//  GRWMRectangle1.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/13.
//

#import "GRWMRectangle1.h"

@implementation GRWMRectangle1

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
    float frameWidth1 = screenWidth * 1/3;
    self.baseView.frameSize = CGSizeMake(frameWidth1, frameWidth1 * 9/16);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(GRWMRectangle1*)grwmRectangle1{
    
    GRWMRectangle1* grwmRectangle1 = [[self alloc] init];
    return grwmRectangle1;
    
}

@end
