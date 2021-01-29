//
//  SinSeoYuGiTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/27.
//

#import "SinSeoYuGi1Template.h"

@implementation SinSeoYuGi1Template

-(id)init{
    
    self = [super init];
    if(self){
        
        self.templateName = @"sinSeoYuGi1Template";
        self.previewImageName = @"sinseoyugiPreview1";
        self.category = NSLocalizedString(@"Entertain", nil);
        self.backgroundImageName = @"sinseoyugi1Frame";
    }
    return self;
    
}

+(SinSeoYuGi1Template*)sinSeoYuGi1Template{
    
    SinSeoYuGi1Template* sinSeoYuGiTemplate = [[self alloc] init];
    
    return sinSeoYuGiTemplate;
    
}

-(void)setUpPhotoFrame{
    
    FullRectangle *fullRectPhotoFrame = [FullRectangle fullRectangle];
    fullRectPhotoFrame.isTemplateItem = true;
    fullRectPhotoFrame.isFixedPhotoFrame = true;
    fullRectPhotoFrame.center = CGPointMake(0.5, 0.5);
    fullRectPhotoFrame.baseView.backgroundColor = UIColor.lightGrayColor;
    [self.photoFrames addObject:fullRectPhotoFrame];
    
    PhotoFrame *circlePhotoFrame = [BasicCirclePhotoFrame basicCirclePhotoFrame];
    circlePhotoFrame.center = CGPointMake(0.72, 0.45);
    circlePhotoFrame.scale = 0.7;
    circlePhotoFrame.isTemplateItem = true;
    [self.photoFrames addObject:circlePhotoFrame];
    
}

-(void)setUpTexts{
         
    //로고
    Text *logoText = [[Text alloc] init];
    SeoYuGiLogoTypo *logo = [SeoYuGiLogoTypo seoYuGiLogoTypo];
    logoText.scale = 0.45;
    logoText.center = CGPointMake(0.5, 0.06);
    logoText.isTemplateItem = true;
    logoText.text = @"서유기";
    logoText.textView.text = @"서유기";
    
    [logoText applyTypo:logo];
    [self.texts addObject:logoText];
    
    //와 나 이런거 무서워한다
    Text *scaredText = [[Text alloc] init];
    SeoYuGiGagwanTypo *gagwanSmall = [SeoYuGiGagwanTypo seoYuGiGagwanTypo];
    scaredText.scale = 0.7;
    scaredText.center = CGPointMake(0.31, 0.71);
    scaredText.isTemplateItem = true;
    scaredText.text = @"와 나 이런거 무서워한다";
    scaredText.textView.text = @"와 나 이런거 무서워한다";
    [scaredText applyTypo:gagwanSmall];
    [self.texts addObject:scaredText];
    
    //가관이네..
    Text *gagwanText = [[Text alloc] init];
    SeoYuGiGagwanTypo *gagwanBig = [SeoYuGiGagwanTypo seoYuGiGagwanTypo];
    gagwanText.scale = 0.85;
    gagwanText.center = CGPointMake(0.6, 0.85);
    gagwanText.isTemplateItem = true;
    gagwanText.text = @"가관이네..";
    gagwanText.textView.text = @"가관이네..";
    [gagwanText applyTypo:gagwanBig];
    [self.texts addObject:gagwanText];
    
}

-(void)setUpStickers{
    
    SinSeoYuGiExc1Sticker *exc1Sticker = [SinSeoYuGiExc1Sticker sinSeoYuGiExc1Sticker];
    exc1Sticker.scale = 0.75;
    exc1Sticker.isTemplateItem = true;
    exc1Sticker.center = CGPointMake(0.37, 0.4);
    
    [self.stickers addObject:exc1Sticker];
    
}

@end
