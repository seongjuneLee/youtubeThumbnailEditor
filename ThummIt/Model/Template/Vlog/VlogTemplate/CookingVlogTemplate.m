//
//  CookingVlogTemplate.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "CookingVlogTemplate.h"

@implementation CookingVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"cookingVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"cookingVlogTemplate";
        
    }
    return self;
    
}

+(CookingVlogTemplate*)cookingVlogTemplate{
    
    CookingVlogTemplate* cookingVlogTemplate = [[self alloc] init];
    
    return cookingVlogTemplate;
    
}

-(void)setUpMainFrames{
    
    CookingVlogMainFrame *mainFrame = [CookingVlogMainFrame cookingVlogMainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
}

-(void)setUpPhotoFrame{
    
    FullRectangle *fullRectPhotoFrame = [FullRectangle fullRectangle];
    fullRectPhotoFrame.isTemplateItem = true;
    fullRectPhotoFrame.isBasePhotoFrame = true;
    fullRectPhotoFrame.relativeCenter = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:fullRectPhotoFrame];
    
}

-(void)setUpTexts{
    
    //Cooking Vlog
    Text *cookingText = [[Text alloc] init];
    VlogCookingTypo *cooking = [VlogCookingTypo vlogCookingTypo];
    cookingText.scale = 0.25;
    cookingText.relativeCenter = CGPointMake(0.25, 0.33);
    cookingText.isTemplateItem = true;
    cookingText.indexInLayer = @"0";
    cookingText.text = @"Cooking\nVlog";
    cookingText.textView.text = cookingText.text;
    cookingText.typo = cooking;
    [self.texts addObject:cookingText];
    
    //ㅎ
    Text *logoText = [[Text alloc] init];
    VlogLogoTagTypo *logo = [VlogLogoTagTypo vlogLogoTagTypo];
    logoText.scale = 0.12;
    logoText.relativeCenter = CGPointMake(0.05, 0.125);
    logoText.isTemplateItem = true;
    logoText.indexInLayer = @"1";
    logoText.text = @"ㅎ";
    logoText.textView.text = logoText.text;
    logoText.typo = logo;
    [self.texts addObject:logoText];
    
}

-(void)setUpStickers{

    BlinkSticker1 *vlogBlinkSticker1 = [BlinkSticker1 blinkSticker1];
    vlogBlinkSticker1.indexInLayer = @"2";
    vlogBlinkSticker1.scale = 0.15;
    vlogBlinkSticker1.isTemplateItem = true;
    vlogBlinkSticker1.relativeCenter = CGPointMake(0.42, 0.15);
    [self.stickers addObject:vlogBlinkSticker1];
    
    PigtailSticker *vlogPigtailSticker = [PigtailSticker pigtailSticker];
    vlogPigtailSticker.indexInLayer = @"3";
    vlogPigtailSticker.scale = 0.18;
    vlogPigtailSticker.rotationDegree = degreesToRadians(-160);
    vlogPigtailSticker.isTemplateItem = true;
    vlogPigtailSticker.relativeCenter = CGPointMake(0.26, 0.8);
    [self.stickers addObject:vlogPigtailSticker];
    
}

@end
