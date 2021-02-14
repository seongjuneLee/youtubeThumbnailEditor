//
//  DailyVlogTemplateRectangle4.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/13.
//

#import "DailyVlogTemplateRectangle4.h"

@implementation DailyVlogTemplateRectangle4

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"DailyVlogTemplateRectangle4";
        [self setBaseViewFrame];
        
    }
    return self;
    
}

-(void)setBaseViewFrame{
    [super setBaseViewFrame];
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float screenHeight = screenWidth * 9/16;
    self.baseView.frameSize = CGSizeMake(screenWidth * 0.36, screenHeight * 0.6);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(DailyVlogTemplateRectangle4*)dailyVlogTemplateRectangle4{
    
    DailyVlogTemplateRectangle4* dailyVlogTemplateRectangle4 = [[self alloc] init];
    return dailyVlogTemplateRectangle4;
    
}


@end
