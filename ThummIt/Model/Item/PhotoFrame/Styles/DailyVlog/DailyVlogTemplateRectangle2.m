//
//  DailyVlogTemplateRecntangle2.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/13.
//

#import "DailyVlogTemplateRectangle2.h"

@implementation DailyVlogTemplateRectangle2

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"DailyVlogTemplateRecntangle2";
        [self setBaseViewFrame];
        
    }
    return self;
    
}

-(void)setBaseViewFrame{
    [super setBaseViewFrame];
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float screenHeight = screenWidth * 9/16;
    self.baseView.frameSize = CGSizeMake(screenWidth * 0.68, screenHeight * 0.4);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(DailyVlogTemplateRectangle2*)dailyVlogTemplateRectangle2{
    
    DailyVlogTemplateRectangle2* dailyVlogTemplateRecntangle2 = [[self alloc] init];
    return dailyVlogTemplateRecntangle2;
    
}

@end
