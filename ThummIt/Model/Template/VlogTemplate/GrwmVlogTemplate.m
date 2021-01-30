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
        self.backgroundImageName = @"";
        
    }
    return self;
    
}

+(GrwmVlogTemplate*)grwmVlogTemplate{
    
    GrwmVlogTemplate* grwmVlogTemplate = [[self alloc] init];

    return grwmVlogTemplate;
    
}

-(void)setUpPhotoFrame{
    
    PhotoFrame *photoFrame1 = [[PhotoFrame alloc] init];
    photoFrame1.isTemplateItem = true;
    photoFrame1.isFixedPhotoFrame = true;
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float frameWidth1 = screenWidth * 1/3;
    photoFrame1.baseView.backgroundColor = UIColor.lightGrayColor;
    photoFrame1.baseView.frameSize = CGSizeMake(frameWidth1, frameWidth1 * 9/16);
    photoFrame1.center = CGPointMake(0.16666, 0.16666);
    [self.photoFrames addObject:photoFrame1];
    
    
    PhotoFrame *photoFrame2 = [[PhotoFrame alloc] init];
    photoFrame2.isTemplateItem = true;
    photoFrame2.isFixedPhotoFrame = true;
    float frameWidth2 = screenWidth * 1/3;
    photoFrame2.baseView.backgroundColor = UIColor.whiteColor;
    photoFrame2.baseView.frameSize = CGSizeMake(frameWidth2, frameWidth2 * 9/16);
    photoFrame2.center = CGPointMake(0.16666, 0.5);
    [self.photoFrames addObject:photoFrame2];
    
    PhotoFrame *photoFrame3 = [[PhotoFrame alloc] init];
    photoFrame3.isTemplateItem = true;
    photoFrame3.isFixedPhotoFrame = true;
    float frameWidth3 = screenWidth * 1/3;
    photoFrame3.baseView.backgroundColor = UIColor.lightGrayColor;
    photoFrame3.baseView.frameSize = CGSizeMake(frameWidth3, frameWidth3 * 9/16);
    photoFrame3.center = CGPointMake(0.16666, 0.83333);
    [self.photoFrames addObject:photoFrame3];
    
    PhotoFrame *photoFrame4 = [[PhotoFrame alloc] init];
    photoFrame4.isTemplateItem = true;
    photoFrame4.isFixedPhotoFrame = true;
    float frameWidth4 = screenWidth * 2/3;
    photoFrame4.baseView.backgroundColor = UIColor.grayColor;
    photoFrame4.baseView.frameSize = CGSizeMake(frameWidth4, screenWidth * 9/16);
    photoFrame4.center = CGPointMake(0.66666, 0.5);
    [self.photoFrames addObject:photoFrame4];
    
}

-(void)setUpTexts{
    
    //GRWM VLOG
    Text *grwmText = [[Text alloc] init];
    VlogGRWMTypo *grwm = [VlogGRWMTypo vlogGRWMTypo];
    grwmText.scale = 1;
    grwmText.center = CGPointMake(0.42, 0.4);
    grwmText.isTemplateItem = true;
    grwmText.text = @"GRWM\nVLOG";
    grwmText.textView.text = grwmText.text;
    [grwmText applyTypo:grwm];
    [self.texts addObject:grwmText];
    
}

@end
