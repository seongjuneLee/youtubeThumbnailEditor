//
//  ClothesTemplateRect1.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/14.
//

#import "ClothesTemplateRect1.h"

@implementation ClothesTemplateRect1

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
    float frameWidth = screenWidth * 0.55;
    self.baseView.frameSize = CGSizeMake(frameWidth, screenWidth * 9/16);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(ClothesTemplateRect1*)clothesTemplateRect1{
    
    ClothesTemplateRect1* clothesTemplateRect1 = [[self alloc] init];
    return clothesTemplateRect1;
    
}

@end
