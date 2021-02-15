//
//  SinSeoYuGi2Template.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "SinSeoYuGi2Template.h"

@implementation SinSeoYuGi2Template

-(id)init{
    
    self = [super init];
    if(self){
        
        self.templateName = @"sinSeoYuGi2Template";
        self.previewImageName = @"sinseoyugiPreview2";
        self.category = NSLocalizedString(@"Entertain", nil);
        self.backgroundImageName = @"sinseoyugi2Frame";
        
    }
    return self;
    
}

+(SinSeoYuGi2Template*)sinSeoYuGi2Template{
    
    SinSeoYuGi2Template* sinSeoYuGi2Template = [[self alloc] init];
    
    return sinSeoYuGi2Template;
    
}

-(void)setUpPhotoFrame{
    
    FullRectangle *fullRectPhotoFrame = [FullRectangle fullRectangle];
    fullRectPhotoFrame.isTemplateItem = true;
    fullRectPhotoFrame.isFixedPhotoFrame = true;
    fullRectPhotoFrame.center = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:fullRectPhotoFrame];
    
}

-(void)setUpTexts{
    
    //서유기
    Text *logoText = [[Text alloc] init];
    SeoYuGiCloudLogoTypo *cloudLogo = [SeoYuGiCloudLogoTypo seoYuGiCloudLogoTypo];
    logoText.scale = 0.138;
    logoText.center = CGPointMake(0.14, 0.15);
    logoText.isTemplateItem = true;
    logoText.indexInLayer =@"0";
    logoText.text = @"서유기";
    logoText.textView.text = logoText.text;
    logoText.typo = cloudLogo;
    [self.texts addObject:logoText];
    
    //여사친 앞에서
    Text *inFrontOfGirlText = [[Text alloc] init];
    SeoYuGiInFrontOfGirlTypo *inFrontOfGirl = [SeoYuGiInFrontOfGirlTypo seoYuGiInFrontOfGirlTypo];
    inFrontOfGirlText.scale = 0.5;
    inFrontOfGirlText.center = CGPointMake(0.31, 0.7);
    inFrontOfGirlText.isTemplateItem = true;
    inFrontOfGirlText.indexInLayer =@"1";
    inFrontOfGirlText.text = @"여사친 앞에서";
    inFrontOfGirlText.textView.text = inFrontOfGirlText.text;
    inFrontOfGirlText.typo = inFrontOfGirl;
    [self.texts addObject:inFrontOfGirlText];
    
    //상체탈의한 썰.ssul
    Text *ssulText = [[Text alloc] init];
    SeoYuGiInFrontOfGirlTypo *ssul = [SeoYuGiInFrontOfGirlTypo seoYuGiInFrontOfGirlTypo];
    ssul.textColor = [UIColor colorWithRed:253/255.0f green:169/255.0f blue:41/255.0 alpha:1];
    ssulText.scale = 0.7;
    ssulText.center = CGPointMake(0.41, 0.85);
    ssulText.isTemplateItem = true;
    ssulText.indexInLayer =@"2";
    ssulText.text = @"상체탈의한 썰.ssul";
    ssulText.textView.text = ssulText.text;
    ssulText.typo = ssul;
    [self.texts addObject:ssulText];
    
}

-(void)setUpStickers{
    
    SinSeoYuGiExc2Sticker *exc2Sticker = [SinSeoYuGiExc2Sticker sinSeoYuGiExc2Sticker];
    exc2Sticker.indexInLayer =@"3";
    exc2Sticker.scale = 0.17;
    exc2Sticker.isTemplateItem = true;
    exc2Sticker.rotationDegree = degreesToRadians(-20);
    exc2Sticker.center = CGPointMake(0.62, 0.32);
    [self.stickers addObject:exc2Sticker];
    
    SinSeoYuGiQu2Sticker *quSticker = [SinSeoYuGiQu2Sticker sinSeoYuGiQu2Sticker];
    quSticker.indexInLayer =@"4";
    quSticker.scale = 0.18;
    quSticker.isTemplateItem = true;
    quSticker.center = CGPointMake(0.705, 0.3);
    [self.stickers addObject:quSticker];
    
    StartleSticker1 *effectSticker = [StartleSticker1 startleSticker1];
    effectSticker.indexInLayer =@"5";
    effectSticker.scale = 0.15;
    effectSticker.isTemplateItem = true;
    effectSticker.rotationDegree = degreesToRadians(17);
    effectSticker.center = CGPointMake(0.29, 0.31);
    [self.stickers addObject:effectSticker];
    
}

@end
