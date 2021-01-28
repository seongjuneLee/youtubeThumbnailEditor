//
//  SinSeoYuGi3Template.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "SinSeoYuGi3Template.h"

@implementation SinSeoYuGi3Template

-(id)init{
    
    self = [super init];
    if(self){
        
        self.templateName = @"sinSeoYuGi3Template";
        self.previewImageName = @"sinseoyugiPreview3";
        self.category = NSLocalizedString(@"Entertain", nil);
        self.backgroundImageName = @"";
        
    }
    return self;
    
}

+(SinSeoYuGi3Template*)sinSeoYuGi3Template{
    
    SinSeoYuGi3Template* sinSeoYuGi3Template = [[self alloc] init];
    
    return sinSeoYuGi3Template;
    
}

-(void)setUpTexts{
    
}

-(void)setUpPhotoFrame{
    
    
}

@end
