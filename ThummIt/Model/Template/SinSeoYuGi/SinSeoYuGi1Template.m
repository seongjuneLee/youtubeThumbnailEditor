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
    
    FullRectangle *fullRectangle = [FullRectangle fullRectangle];
    fullRectangle.isFixedPhotoFrame = true;
    fullRectangle.isTemplateItem = true;
    fullRectangle.center = CGPointMake(0.5, 0.5);
    fullRectangle.plusLabel.hidden = true;
    [self.photoFrames addObject:fullRectangle];

    PhotoFrame *basicCirclePhotoFrame = [BasicCirclePhotoFrame basicCirclePhotoFrame];
    basicCirclePhotoFrame.center = CGPointMake(0.6, 0.4);
    basicCirclePhotoFrame.scale = 0.7;
    basicCirclePhotoFrame.plusLabel.hidden = true;
    basicCirclePhotoFrame.baseView.backgroundColor = UIColor.whiteColor;
    basicCirclePhotoFrame.isTemplateItem = true;
    [self.photoFrames addObject:basicCirclePhotoFrame];
    
}


@end
