//
//  AThirdPhotoFrame.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/13.
//

#import "TwoFifthRectangle.h"

@implementation TwoFifthRectangle

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
    float frameWidth = screenWidth * 0.4;
    self.baseView.frameSize = CGSizeMake(frameWidth, screenWidth * 9/16);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(TwoFifthRectangle*)twoFifthRectangle{
    
    TwoFifthRectangle* twoFifthRectangle = [[self alloc] init];
    return twoFifthRectangle;
    
}


@end
