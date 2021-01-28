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
        
        self.templateName = @"sinSeoYuGi1Template";
        self.previewImageName = @"sinseoyugiPreview1";
        self.category = NSLocalizedString(@"Entertain", nil);
        self.backgroundImageName = @"sinseoyugi1Frame";
    }
    return self;
    
}

+(SinSeoYuGi1Template*)sinSeoYuGi1Template{
    
    SinSeoYuGi1Template* sinSeoYuGiTemplate = [[self alloc] init];
    
    return sinSeoYuGiTemplate;
    
}

-(void)setUpTexts{
         
    
}
-(void)setUpPhotoFrame{
    
    self.photoFrames = [NSMutableArray array];
    PhotoFrame *photoFrame = [BasicCirclePhotoFrame basicCirclePhotoFrame];
    photoFrame.center = CGPointMake(0.7, 0.4);
    photoFrame.scale = 0.8;
    photoFrame.baseView.backgroundColor = UIColor.whiteColor;
    photoFrame.isTemplateItem = true;
    [self.photoFrames addObject:photoFrame];
    
}


@end
