//
//  DoubleCircleTemplate.m
//  Thummit
//
//  Created by 이성준 on 2020/12/16.
//

#import "DoubleCircleTemplate.h"

@implementation DoubleCircleTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"doubleCircleTemplatePreview";
        self.category = NSLocalizedString(@"Entertain", nil);
        self.templateName = @"doubleCircleTemplate";
        self.backgroundColor = UIColor.blackColor;
        self.backgroundImageName = @"";
        
    }
    return self;
    
}

+(DoubleCircleTemplate*)doubleCircleTemplate{
    
    DoubleCircleTemplate* doubleCircleTemplate = [[self alloc] init];
    return doubleCircleTemplate;
    
}

-(void)setUpPhotoFrame{
    
    PhotoFrame *firstPhotoFrame = [BasicCirclePhotoFrame basicCirclePhotoFrame];
    PhotoFrame *secondPhotoFrame = [BasicCirclePhotoFrame basicCirclePhotoFrame];
    firstPhotoFrame.center = CGPointMake(0.32, 0.5);
    firstPhotoFrame.isTemplateItem = true;
    
    secondPhotoFrame.center = CGPointMake(0.68, 0.5);
    secondPhotoFrame.scale = 0.9;
    secondPhotoFrame.isTemplateItem = true;

    [self.photoFrames addObject:firstPhotoFrame];
    [self.photoFrames addObject:secondPhotoFrame];

}

-(void)setUpTexts{
    
}


@end
