//
//  CebuRectangle.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/14.
//

#import "CebuRectangle.h"

@implementation CebuRectangle
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

    float frameWidth = screenWidth * 0.27;
    float frameHeight = screenHeight * 0.48;

    self.baseView.frameSize = CGSizeMake(frameWidth, frameHeight);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(CebuRectangle*)cebuRectangle{
    
    CebuRectangle* cebuRectangle = [[self alloc] init];
    return cebuRectangle;
    
}


@end
