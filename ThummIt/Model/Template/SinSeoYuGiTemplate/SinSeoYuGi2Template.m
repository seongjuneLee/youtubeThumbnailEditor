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
    fullRectPhotoFrame.baseView.backgroundColor = UIColor.lightGrayColor;
    [self.photoFrames addObject:fullRectPhotoFrame];
    
}

-(void)setUpTexts{
    
    //서유기
    Text *logoText = [[Text alloc] init];
    SeoYuGiCloudLogoTypo *cloudLogo = [SeoYuGiCloudLogoTypo seoYuGiCloudLogoTypo];
    logoText.scale = 0.52;
    logoText.center = CGPointMake(0.14, 0.15);
    logoText.isTemplateItem = true;
    logoText.indexInLayer =@"0";
    logoText.text = @"서유기";
    logoText.textView.text = logoText.text;
    [logoText applyTypo:cloudLogo];
    [self.texts addObject:logoText];
    
    //여사친 앞에서
    Text *inFrontOfGirlText = [[Text alloc] init];
    SeoYuGiInFrontOfGirlTypo *inFrontOfGirl = [SeoYuGiInFrontOfGirlTypo seoYuGiInFrontOfGirlTypo];
    inFrontOfGirlText.scale = 1.15;
    inFrontOfGirlText.center = CGPointMake(0.31, 0.7);
    inFrontOfGirlText.isTemplateItem = true;
    inFrontOfGirlText.indexInLayer =@"1";
    inFrontOfGirlText.text = @"여사친 앞에서";
    inFrontOfGirlText.textView.text = inFrontOfGirlText.text;
    [inFrontOfGirlText applyTypo:inFrontOfGirl];
    [self.texts addObject:inFrontOfGirlText];
    
    //상체탈의한 썰.ssul
    Text *ssulText = [[Text alloc] init];
    SeoYuGiInFrontOfGirlTypo *ssul = [SeoYuGiInFrontOfGirlTypo seoYuGiInFrontOfGirlTypo];
    ssul.textColor = [UIColor colorWithRed:253/255.0f green:169/255.0f blue:41/255.0 alpha:1];
    ssulText.scale = 1.15;
    ssulText.center = CGPointMake(0.41, 0.85);
    ssulText.isTemplateItem = true;
    ssulText.indexInLayer =@"2";
    ssulText.text = @"상체탈의한 썰.ssul";
    ssulText.textView.text = ssulText.text;
    [ssulText applyTypo:ssul];
    [self.texts addObject:ssulText];
    
}

-(void)setUpStickers{
    
    SinSeoYuGiExc2Sticker *exc2Sticker = [SinSeoYuGiExc2Sticker sinSeoYuGiExc2Sticker];
    exc2Sticker.indexInLayer =@"3";
    exc2Sticker.scale = 0.55;
    exc2Sticker.isTemplateItem = true;
    exc2Sticker.rotationDegree = degreesToRadians(340);
    exc2Sticker.center = CGPointMake(0.67, 0.37);
    [self.stickers addObject:exc2Sticker];
    
    SinSeoYuGiQuSticker *quSticker = [SinSeoYuGiQuSticker sinSeoYuGiQuSticker];
    quSticker.indexInLayer =@"4";
    quSticker.scale = 0.65;
    quSticker.isTemplateItem = true;
    quSticker.center = CGPointMake(0.75, 0.37);
    [self.stickers addObject:quSticker];
    
    SinSeoYuGiEffectSticker *effectSticker = [SinSeoYuGiEffectSticker sinSeoYuGiEffectSticker];
    effectSticker.indexInLayer =@"5";
    effectSticker.scale = 0.52;
    effectSticker.isTemplateItem = true;
    effectSticker.rotationDegree = degreesToRadians(20);
    effectSticker.center = CGPointMake(0.31, 0.38);
    [self.stickers addObject:effectSticker];
    
}

@end
