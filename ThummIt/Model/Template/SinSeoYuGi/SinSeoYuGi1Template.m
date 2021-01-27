//
//  SinSeoYuGiTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "SinSeoYuGi1Template.h"

@implementation SinSeoYuGi1Template

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"sinseoyugiPreview";
        self.category = NSLocalizedString(@"Entertain", nil);
        self.templateName = @"SinSeoYuGi1Template";
        self.backgroundImageName = @"sinseoyugi1Frame";
        [self setUpPhotoFrame];
        
    }
    return self;
    
}

+(SinSeoYuGi1Template*)sinSeoYuGiTemplate1{
    
    SinSeoYuGi1Template* sinSeoYuGiTemplate = [[self alloc] init];
    
    return sinSeoYuGiTemplate;
    
}

-(void)setUpTexts{
         
    
}

-(void)setUpPhotoFrame{
    
    PhotoFrame *photoFrame = [BasicCirclePhotoFrame basicCirclePhotoFrame];
    photoFrame.center = CGPointMake(0.6, 0.4);
    photoFrame.scale = 0.7;
    photoFrame.baseView.backgroundColor = UIColor.whiteColor;
    
    photoFrame.isTemplateItem = true;
    [self.photoFrames addObject:photoFrame];
    
}


@end
