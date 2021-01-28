//
//  SinSeoYuGi2Template.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "SinSeoYuGi2Template.h"

@implementation SinSeoYuGi2Template

-(id)init{
    
    self = [super init];
    if(self){
        
        self.templateName = @"sinSeoYuGi2Template";
        self.previewImageName = @"sinseoyugiPreview2";
        self.category = NSLocalizedString(@"Entertain", nil);
        self.backgroundImageName = @"sinseoyugi2Frame";
        
    }
    return self;
    
}

+(SinSeoYuGi2Template*)sinSeoYuGi2Template{
    
    SinSeoYuGi2Template* sinSeoYuGi2Template = [[self alloc] init];
    
    return sinSeoYuGi2Template;
    
}

-(void)setUpTexts{
    
}

-(void)setUpPhotoFrame{
    
    
}

@end
