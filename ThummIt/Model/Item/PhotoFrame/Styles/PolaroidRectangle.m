//
//  PolaroidRectangle.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/14.
//

#import "PolaroidRectangle.h"

@implementation PolaroidRectangle

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"PolaroidRectangle";
        self.backgroundImageName = @"polaroidPhotoFrame";
        [self setBaseViewFrame];
        
    }
    return self;
    
}

-(void)setBaseViewFrame{
    [super setBaseViewFrame];
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float frameWidth = screenWidth * 0.19;
    self.baseView.frameSize = CGSizeMake(frameWidth, frameWidth);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(PolaroidRectangle*)polaroidRectangle{
    
    PolaroidRectangle* polaroidRectangle = [[self alloc] init];
    return polaroidRectangle;
    
}
@end
