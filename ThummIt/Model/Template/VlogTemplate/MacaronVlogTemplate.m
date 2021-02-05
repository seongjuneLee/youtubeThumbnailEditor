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
        self.backgroundImageName = @"macaronVlogFrame";
        
    }
    return self;
    
}

+(MacaronVlogTemplate*)macaronVlogTemplate{
    
    MacaronVlogTemplate* macaronVlogTemplate = [[self alloc] init];
    return macaronVlogTemplate;
    
}

-(void)setUpPhotoFrame{
    
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float screenHeight = screenWidth * 9/16;
    
    PhotoFrame *photoFrame1 = [[PhotoFrame alloc] init];
    photoFrame1.isTemplateItem = true;
    photoFrame1.isFixedPhotoFrame = true;
    photoFrame1.baseView.frameSize = CGSizeMake(screenWidth * 0.54, screenHeight);
    photoFrame1.center = CGPointMake(0.27, 0.5);
    [self.photoFrames addObject:photoFrame1];
    
    
    PhotoFrame *photoFrame2 = [[PhotoFrame alloc] init];
    photoFrame2.isTemplateItem = true;
    photoFrame2.isFixedPhotoFrame = true;
    photoFrame2.baseView.frameSize = CGSizeMake(screenWidth * 0.46, screenHeight * 0.5);
    photoFrame2.center = CGPointMake(0.77, 0.25);
    [self.photoFrames addObject:photoFrame2];
    
    PhotoFrame *photoFrame3 = [[PhotoFrame alloc] init];
    photoFrame3.isTemplateItem = true;
    photoFrame3.isFixedPhotoFrame = true;
    photoFrame3.baseView.frameSize = CGSizeMake(screenWidth * 0.46, screenHeight * 0.5);
    photoFrame3.center = CGPointMake(0.77, 0.75);
    [self.photoFrames addObject:photoFrame3];
    
}

-(void)setUpTexts{
    
    //vlog
    Text *vlogText = [[Text alloc] init];
    VlogMacaronTypo *vlog = [VlogMacaronTypo vlogMacaronTypo];
    vlogText.scale = 0.16;
    vlogText.center = CGPointMake(0.465, 0.25);
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
    homebakingText.center = CGPointMake(0.455, 0.35);
    homebakingText.isTemplateItem = true;
    homebakingText.indexInLayer = @"0";
    homebakingText.text = @"homebaking\n:macaron";
    homebakingText.textView.text = homebakingText.text;
    homebakingText.textAlignment = NSTextAlignmentLeft;
    homebakingText.typo = homebaking;
    [self.texts addObject:homebakingText];
    
}

-(void)setUpStickers{
    
    VlogMacaronSticker *vlogMacaronSticker1 = [VlogMacaronSticker vlogMacaronSticker];
    vlogMacaronSticker1.scale = 0.19;
    vlogMacaronSticker1.isTemplateItem = true;
    vlogMacaronSticker1.cannotChangeColor = true;
    vlogMacaronSticker1.rotationDegree = -10;
    vlogMacaronSticker1.center = CGPointMake(0.1, 0.13);
    [self.stickers addObject:vlogMacaronSticker1];

    VlogMacaronSticker *vlogMacaronSticker2 = [VlogMacaronSticker vlogMacaronSticker];
    vlogMacaronSticker2.scale = 0.19;
    vlogMacaronSticker2.isTemplateItem = true;
    vlogMacaronSticker2.cannotChangeColor = true;
    vlogMacaronSticker2.rotationDegree = -10;
    vlogMacaronSticker2.center = CGPointMake(1, 0.99);
    [self.stickers addObject:vlogMacaronSticker2];

}

@end
