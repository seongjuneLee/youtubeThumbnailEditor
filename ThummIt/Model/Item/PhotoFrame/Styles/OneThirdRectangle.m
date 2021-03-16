//
//  OneThirdRectangle.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/13.
//

#import "OneThirdRectangle.h"

@implementation OneThirdRectangle

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"OneThirdPhotoFrame";
        [self setBaseViewFrame];
        
    }
    return self;
    
}

-(void)setBaseViewFrame{
    [super setBaseViewFrame];
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float frameWidth = screenWidth * 0.333;
    self.baseView.frameSize = CGSizeMake(frameWidth, screenWidth * 9/16);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(OneThirdRectangle*)oneThirdRectangle{
    
    OneThirdRectangle* oneThirdRectangle = [[self alloc] init];
    return oneThirdRectangle;
    
}
@end
