//
//  SinSeoYuGiTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "SinSeoYuGiTemplate1.h"

@implementation SinSeoYuGiTemplate1

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"sinseoyugiPreview";
        self.category = NSLocalizedString(@"Entertain", nil);
        self.templateName = @"sinSeoYuGiTemplate1";
        self.backgroundImageName = @"sinseoyugi1Frame";
        [self setUpPhotoFrame];
        
    }
    return self;
    
}

+(SinSeoYuGiTemplate1*)sinSeoYuGiTemplate1{
    
    SinSeoYuGiTemplate1* sinSeoYuGiTemplate = [[self alloc] init];
    
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
