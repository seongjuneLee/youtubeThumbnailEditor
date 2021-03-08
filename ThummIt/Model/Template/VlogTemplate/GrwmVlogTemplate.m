//
//  GrwmVlogTemplate.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "GrwmVlogTemplate.h"

@implementation GrwmVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"grwmVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"grwmVlogTemplate";
        
    }
    return self;
    
}

+(GrwmVlogTemplate*)grwmVlogTemplate{
    
    GrwmVlogTemplate* grwmVlogTemplate = [[self alloc] init];

    return grwmVlogTemplate;
    
}

-(void)setUpMainFrames{

}

-(void)setUpPhotoFrame{

    PhotoFrame *photoFrame1 = [GRWMRectangle1 grwmRectangle1];
    photoFrame1.isTemplateItem = true;
    photoFrame1.isBasePhotoFrame = true;
    photoFrame1.relativeCenter = CGPointMake(0.16666, 0.16666);
    [self.photoFrames addObject:photoFrame1];
    
    
    PhotoFrame *photoFrame2 = [GRWMRectangle1 grwmRectangle1];
    photoFrame2.isTemplateItem = true;
    photoFrame2.isBasePhotoFrame = true;
    photoFrame2.relativeCenter = CGPointMake(0.16666, 0.5);
    [self.photoFrames addObject:photoFrame2];
    
    PhotoFrame *photoFrame3 = [GRWMRectangle1 grwmRectangle1];
    photoFrame3.isTemplateItem = true;
    photoFrame3.isBasePhotoFrame = true;
    photoFrame3.relativeCenter = CGPointMake(0.16666, 0.83333);
    [self.photoFrames addObject:photoFrame3];
    
    PhotoFrame *photoFrame4 = [GRWMRectangle2 grwmRectangle2];
    photoFrame4.isTemplateItem = true;
    photoFrame4.isBasePhotoFrame = true;
    photoFrame4.relativeCenter = CGPointMake(0.66666, 0.5);
    [self.photoFrames addObject:photoFrame4];
    
}

-(void)setUpTexts{
    
    //GRWM VLOG
    Text *grwmText = [[Text alloc] init];
    VlogGRWMTypo *grwm = [VlogGRWMTypo vlogGRWMTypo];
    grwmText.scale = 0.2;
    grwmText.relativeCenter = CGPointMake(0.42, 0.4);
    grwmText.isTemplateItem = true;
    grwmText.indexInLayer = @"0";
    grwmText.text = @"GRWM\nVLOG";
    grwmText.textView.text = grwmText.text;
    grwmText.typo = grwm;
    [self.texts addObject:grwmText];
    
}

@end
