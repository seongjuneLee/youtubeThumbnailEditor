//
//  InfiniteTemplateRectangle1.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/16.
//

#import "InfiniteTemplateRectangle1.h"

@implementation InfiniteTemplateRectangle1

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"InfiniteTemplateRectangle1";
        [self setBaseViewFrame];
        
    }
    return self;
    
}

-(void)setBaseViewFrame{
    [super setBaseViewFrame];
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float frameWidth = screenWidth * 0.6;
    self.baseView.frameSize = CGSizeMake(frameWidth, screenWidth * 9/16);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(InfiniteTemplateRectangle1*)infiniteTemplateRectangle1{
    
    InfiniteTemplateRectangle1* infiniteTemplateRectangle1 = [[self alloc] init];
    return infiniteTemplateRectangle1;
    
}

@end
