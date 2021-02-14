//
//  DailyVlogTemplateRectangle1.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/13.
//

#import "DailyVlogTemplateRectangle1.h"

@implementation DailyVlogTemplateRectangle1

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"DailyVlogTemplateRectangle1";
        [self setBaseViewFrame];
        
    }
    return self;
    
}

-(void)setBaseViewFrame{
    [super setBaseViewFrame];
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float screenHeight = screenWidth * 9/16;
    self.baseView.frameSize = CGSizeMake(screenWidth * 0.32, screenHeight * 0.4);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(DailyVlogTemplateRectangle1*)dailyVlogTemplateRectangle1{
    
    DailyVlogTemplateRectangle1* dailyVlogTemplateRectangle1 = [[self alloc] init];
    return dailyVlogTemplateRectangle1;
    
}

@end
