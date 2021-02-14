//
//  ClothesTemplateRect2.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/14.
//

#import "ClothesTemplateRect2.h"

@implementation ClothesTemplateRect2

-(id)init{
    
    self = [super init];
    if(self){
        
        self.itemName = @"ClothesTemplateRect1";
        [self setBaseViewFrame];
        
    }
    return self;
    
}

-(void)setBaseViewFrame{
    [super setBaseViewFrame];
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float frameWidth = screenWidth * 0.45;
    self.baseView.frameSize = CGSizeMake(frameWidth, screenWidth * 9/16);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(ClothesTemplateRect2*)clothesTemplateRect2{
    
    ClothesTemplateRect2* clothesTemplateRect2 = [[self alloc] init];
    return clothesTemplateRect2;
    
}

@end
