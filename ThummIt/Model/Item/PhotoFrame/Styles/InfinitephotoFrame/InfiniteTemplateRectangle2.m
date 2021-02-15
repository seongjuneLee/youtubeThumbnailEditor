//
//  InfiniteTemplateRectangle2.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/16.
//

#import "InfiniteTemplateRectangle2.h"

@implementation InfiniteTemplateRectangle2

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"InfiniteTemplateRectangle2";
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

+(InfiniteTemplateRectangle2*)infiniteTemplateRectangle2{
    
    InfiniteTemplateRectangle2* infiniteTemplateRectangle2 = [[self alloc] init];
    return infiniteTemplateRectangle2;
    
}

@end
