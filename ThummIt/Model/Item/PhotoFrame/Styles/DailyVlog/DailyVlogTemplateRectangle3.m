//
//  DailyVlogTemplateRectangle3.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/13.
//

#import "DailyVlogTemplateRectangle3.h"

@implementation DailyVlogTemplateRectangle3

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"DailyVlogTemplateRectangle3";
        [self setBaseViewFrame];
        
    }
    return self;
    
}

-(void)setBaseViewFrame{
    [super setBaseViewFrame];
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float screenHeight = screenWidth * 9/16;
    self.baseView.frameSize = CGSizeMake(screenWidth * 0.64, screenHeight * 0.6);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(DailyVlogTemplateRectangle3*)dailyVlogTemplateRectangle3{
    
    DailyVlogTemplateRectangle3* dailyVlogTemplateRectangle3 = [[self alloc] init];
    return dailyVlogTemplateRectangle3;
    
}

@end
