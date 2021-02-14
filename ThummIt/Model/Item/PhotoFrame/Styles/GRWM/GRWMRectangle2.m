//
//  GRWMRectangle2.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/13.
//

#import "GRWMRectangle2.h"

@implementation GRWMRectangle2

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
    float frameWidth4 = screenWidth * 2/3;
    self.baseView.frameSize = CGSizeMake(frameWidth4, screenWidth * 9/16);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(GRWMRectangle2*)grwmRectangle2{
    
    GRWMRectangle2* grwmRectangle2 = [[self alloc] init];
    return grwmRectangle2;
    
}

@end
