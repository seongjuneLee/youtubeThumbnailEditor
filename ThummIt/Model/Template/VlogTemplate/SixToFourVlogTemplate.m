//
//  SixToFourTemplate.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "SixToFourVlogTemplate.h"

@implementation SixToFourVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"sixToFourVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"sixToFourVlogTemplate";
        self.backgroundImageName = @"sixToFourVlogFrame";
        
    }
    return self;
    
}

+(SixToFourVlogTemplate*)sixToFourVlogTemplate{
    
    SixToFourVlogTemplate* sixToFourVlogTemplate = [[self alloc] init];

    return sixToFourVlogTemplate;
    
}

-(void)setUpPhotoFrame{
    
    PhotoFrame *photoFrame1 = [[PhotoFrame alloc] init];
    photoFrame1.isTemplateItem = true;
    photoFrame1.isFixedPhotoFrame = true;
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float frameWidth = screenWidth * 0.55;
    photoFrame1.baseView.frameSize = CGSizeMake(frameWidth, screenWidth * 9/16);
    photoFrame1.center = CGPointMake(0.275, 0.5);
    [self.photoFrames addObject:photoFrame1];
    
    PhotoFrame *photoFrame2 = [[PhotoFrame alloc] init];
    photoFrame2.isTemplateItem = true;
    photoFrame2.isFixedPhotoFrame = true;
    float frameWidth2 = screenWidth * 0.45;
    photoFrame2.baseView.frameSize = CGSizeMake(frameWidth2, screenWidth * 9/16);
    photoFrame2.center = CGPointMake(0.775, 0.5);
    [self.photoFrames addObject:photoFrame2];
    
}

-(void)setUpTexts{
    
    //VLOG
    Text *vlogText = [[Text alloc] init];
    VlogMyeongjoTypo *myeongjo = [VlogMyeongjoTypo vlogMyeongjoTypo];
    vlogText.scale = 1.2;
    vlogText.center = CGPointMake(0.5, 0.5);
    vlogText.isTemplateItem = true;
    vlogText.indexInLayer = @"0";
    vlogText.text = @"VLOG";
    vlogText.textView.text = vlogText.text;
    [vlogText applyTypo:myeongjo];
    [self.texts addObject:vlogText];
    
}

@end
