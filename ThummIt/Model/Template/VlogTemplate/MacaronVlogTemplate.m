//
//  MacaronVlogTemplate.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "MacaronVlogTemplate.h"

@implementation MacaronVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"macaronVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"macaronVlogTemplate";
        
    }
    return self;
    
}

+(MacaronVlogTemplate*)macaronVlogTemplate{
    
    MacaronVlogTemplate* macaronVlogTemplate = [[self alloc] init];
    return macaronVlogTemplate;
    
}

-(void)setUpMainFrames{

    MacaronVlogMainFrame *mainFrame = [MacaronVlogMainFrame macaronVlogMainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
}

-(void)setUpPhotoFrame{
    
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    
    PhotoFrame *photoFrame1 = [MacaronRectangle1 macaronRectangle1];
    photoFrame1.isTemplateItem = true;
    photoFrame1.isBasePhotoFrame = true;
    photoFrame1.relativeCenter = CGPointMake(0.27, 0.5);
    [self.photoFrames addObject:photoFrame1];
    
    
    PhotoFrame *photoFrame2 = [MacaronRectangle2 macaronRectangle2];
    photoFrame2.isTemplateItem = true;
    photoFrame2.isBasePhotoFrame = true;
    photoFrame2.relativeCenter = CGPointMake(0.77, 0.25);
    [self.photoFrames addObject:photoFrame2];
    
    PhotoFrame *photoFrame3 = [MacaronRectangle2 macaronRectangle2];
    photoFrame3.isTemplateItem = true;
    photoFrame3.isBasePhotoFrame = true;
    photoFrame3.relativeCenter = CGPointMake(0.77, 0.75);
    [self.photoFrames addObject:photoFrame3];
    
}

-(void)setUpTexts{
    
    //vlog
    Text *vlogText = [[Text alloc] init];
    VlogMacaronTypo *vlog = [VlogMacaronTypo vlogMacaronTypo];
    vlogText.scale = 0.16;
    vlogText.relativeCenter = CGPointMake(0.465, 0.25);
    vlogText.isTemplateItem = true;
    vlogText.indexInLayer = @"0";
    vlogText.text = @"vlog";
    vlogText.textView.text = vlogText.text;
    vlogText.typo = vlog;
    [self.texts addObject:vlogText];
    
    //homebaking\n:macaron
    Text *homebakingText = [[Text alloc] init];
    VlogMacaronTypo *homebaking = [VlogMacaronTypo vlogMacaronTypo];
    homebakingText.scale = 0.115;
    homebakingText.relativeCenter = CGPointMake(0.455, 0.35);
    homebakingText.isTemplateItem = true;
    homebakingText.indexInLayer = @"1";
    homebakingText.text = @"homebaking\n:macaron";
    homebakingText.textView.text = homebakingText.text;
    homebakingText.textAlignment = NSTextAlignmentLeft;
    homebakingText.typo = homebaking;
    [self.texts addObject:homebakingText];
    
}

-(void)setUpStickers{
    
    VlogMacaronSticker *vlogMacaronSticker1 = [VlogMacaronSticker vlogMacaronSticker];
    vlogMacaronSticker1.scale = 0.13;
    vlogMacaronSticker1.isTemplateItem = true;
    vlogMacaronSticker1.indexInLayer = @"2";
    vlogMacaronSticker1.rotationDegree = degreesToRadians(-10);
    vlogMacaronSticker1.relativeCenter = CGPointMake(0.06, 0.09);
    [self.stickers addObject:vlogMacaronSticker1];

    VlogMacaronSticker *vlogMacaronSticker2 = [VlogMacaronSticker vlogMacaronSticker];
    vlogMacaronSticker2.scale = 0.13;
    vlogMacaronSticker2.isTemplateItem = true;
    vlogMacaronSticker2.indexInLayer = @"3";
    vlogMacaronSticker2.rotationDegree = degreesToRadians(-10);
    vlogMacaronSticker2.relativeCenter = CGPointMake(0.94, 0.91);
    [self.stickers addObject:vlogMacaronSticker2];

}

@end
