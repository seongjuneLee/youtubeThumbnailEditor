//
//  ChristmasCircle.m
//  Thummit
//
//  Created by 이성준 on 2020/12/15.
//

#import "ChristmasCircle.h"

@implementation ChristmasCircle

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"BasicCircle";
        self.backgroundImageName = @"christmasCircle";
        self.isCircle = true;
        [self setBaseViewFrame];
        
    }
    return self;
    
}

-(void)setBaseViewFrame{
    [super setBaseViewFrame];
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float circleViewWidth = screenWidth*0.8/2;
    self.baseView.frameSize = CGSizeMake(circleViewWidth, circleViewWidth);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(ChristmasCircle*)christmasCircle{
    
    ChristmasCircle* christmasCircle = [[self alloc] init];
    return christmasCircle;
    
}
@end
