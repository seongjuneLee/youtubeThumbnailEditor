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
        self.backgroundImageName = @"cookingVlogFrame";
        
    }
    return self;
    
}

+(CookingVlogTemplate*)cookingVlogTemplate{
    
    CookingVlogTemplate* cookingVlogTemplate = [[self alloc] init];
    
    return cookingVlogTemplate;
    
}

-(void)setUpPhotoFrame{
    
    FullRectangle *fullRectPhotoFrame = [FullRectangle fullRectangle];
    fullRectPhotoFrame.isTemplateItem = true;
    fullRectPhotoFrame.isFixedPhotoFrame = true;
    fullRectPhotoFrame.center = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:fullRectPhotoFrame];
    
}

-(void)setUpTexts{
    
    //Cooking Vlog
    Text *cookingText = [[Text alloc] init];
    VlogCookingTypo *cooking = [VlogCookingTypo vlogCookingTypo];
    cookingText.scale = 1;
    cookingText.center = CGPointMake(0.25, 0.3);
    cookingText.isTemplateItem = true;
    cookingText.indexInLayer = @"0";
    cookingText.text = @"Cooking\nVlog";
    cookingText.textView.text = cookingText.text;
    [cookingText applyTypo:cooking];
    [self.texts addObject:cookingText];
    
    //ㅎ
    Text *logoText = [[Text alloc] init];
    VlogLogoTagTypo *logo = [VlogLogoTagTypo vlogLogoTagTypo];
    logoText.scale = 1.05;
    logoText.center = CGPointMake(0.05, 0.12);
    logoText.isTemplateItem = true;
    logoText.indexInLayer = @"1";
    logoText.text = @"ㅎ";
    logoText.textView.text = logoText.text;
    [logoText applyTypo:logo];
    [self.texts addObject:logoText];
    
}

-(void)setUpStickers{

    BlinkSticker1 *vlogBlinkSticker1 = [BlinkSticker1 blinkSticker1];
    vlogBlinkSticker1.indexInLayer = @"2";
    vlogBlinkSticker1.scale = 0.57;
    vlogBlinkSticker1.isTemplateItem = true;
    vlogBlinkSticker1.center = CGPointMake(0.46, 0.22);
    [self.stickers addObject:vlogBlinkSticker1];
    
    PigtailSticker *vlogPigtailSticker = [PigtailSticker pigtailSticker];
    vlogPigtailSticker.indexInLayer = @"3";
    vlogPigtailSticker.scale = 0.5;
    vlogPigtailSticker.rotationDegree = degreesToRadians(200);
    vlogPigtailSticker.isTemplateItem = true;
    vlogPigtailSticker.center = CGPointMake(0.26, 0.7);
    [self.stickers addObject:vlogPigtailSticker];
    
}

@end
