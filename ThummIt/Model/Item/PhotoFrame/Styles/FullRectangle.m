//
//  FullRectangle.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "FullRectangle.h"

@implementation FullRectangle

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"FullRectangle";
        
    }
    return self;
    
}

-(void)setBaseViewFrame{
    [super setBaseViewFrame];
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float frameWidth = screenWidth;
    self.baseView.frameSize = CGSizeMake(frameWidth, frameWidth * 9/16);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(FullRectangle*)fullRectangle{
    
    FullRectangle* fullRectangle = [[self alloc] init];
    return fullRectangle;
    
}

@end
