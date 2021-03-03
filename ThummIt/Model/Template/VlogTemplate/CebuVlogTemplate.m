//
//  CebuVlogTemplate.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "CebuVlogTemplate.h"

@implementation CebuVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"cebuVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"cebuVlogTemplate";
        self.backgroundColor = UIColor.whiteColor;
        
    }
    return self;
    
}

+(CebuVlogTemplate*)cebuVlogTemplate{
    
    CebuVlogTemplate* cebuVlogTemplate = [[self alloc] init];
    
    return cebuVlogTemplate;
    
}

-(void)setUpMainFrames{

}

-(void)setUpPhotoFrame{
    
    
    float centerX1 = 0.115 + 0.135;
    float centerX2 = 1 - centerX1;
    float centerY1 = 0.01 + 0.24;
    float centerY2 = 1 - centerY1;
    
    PhotoFrame *photoFrame1 = [CebuRectangle cebuRectangle];
    photoFrame1.isTemplateItem = true;
    photoFrame1.isFixedPhotoFrame = true;
    photoFrame1.relativeCenter = CGPointMake(centerX1, centerY1);
    [self.photoFrames addObject:photoFrame1];
    
    
    PhotoFrame *photoFrame2 = [CebuRectangle cebuRectangle];
    photoFrame2.isTemplateItem = true;
    photoFrame2.isFixedPhotoFrame = true;
    photoFrame2.relativeCenter = CGPointMake(centerX2, centerY1);
    [self.photoFrames addObject:photoFrame2];
    
    PhotoFrame *photoFrame3 = [CebuRectangle cebuRectangle];
    photoFrame3.isTemplateItem = true;
    photoFrame3.isFixedPhotoFrame = true;
    photoFrame3.relativeCenter = CGPointMake(centerX1, centerY2);
    [self.photoFrames addObject:photoFrame3];
    
    PhotoFrame *photoFrame4 = [CebuRectangle cebuRectangle];
    photoFrame4.isTemplateItem = true;
    photoFrame4.isFixedPhotoFrame = true;
    photoFrame4.relativeCenter = CGPointMake(centerX2, centerY2);
    [self.photoFrames addObject:photoFrame4];
    
}

-(void)setUpTexts{
    
    //MY DAILY VLOG
    Text *cebuText = [[Text alloc] init];
    VlogSummer *cebu = [VlogSummer vlogSummer];
    cebuText.scale = 0.035;
    cebuText.relativeCenter = CGPointMake(0.5, 0.5);
    cebuText.isTemplateItem = true;
    cebuText.indexInLayer = @"0";
    cebuText.text = @"C\nE\nB\nU\n\n&\n\nB\nO\nH\nO\nL";
    cebuText.textView.text = cebuText.text;
    cebuText.typo = cebu;
    [self.texts addObject:cebuText];
    
}

-(void)setUpStickers{

}

@end
