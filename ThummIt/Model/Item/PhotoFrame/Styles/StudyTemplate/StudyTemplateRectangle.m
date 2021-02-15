//
//  StudyTemplateRectangle.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/16.
//

#import "StudyTemplateRectangle.h"

@implementation StudyTemplateRectangle

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
    self.baseView.frameSize = CGSizeMake(screenWidth * 0.68, screenWidth * 9/16 * 0.73);
}

-(instancetype)initWithCoder:(NSCoder *)decoder{
    if((self = [super initWithCoder:decoder])) {
    }
    return self;
}

+(StudyTemplateRectangle*)studyTemplateRectangle{
    
    StudyTemplateRectangle* studyTemplateRectangle = [[self alloc] init];
    return studyTemplateRectangle;
    
}

@end
