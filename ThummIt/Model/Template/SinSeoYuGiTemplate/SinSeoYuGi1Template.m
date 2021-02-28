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
    }
    return self;
    
}

+(SinSeoYuGi1Template*)sinSeoYuGi1Template{
    
    SinSeoYuGi1Template* sinSeoYuGiTemplate = [[self alloc] init];
    
    return sinSeoYuGiTemplate;
    
}

-(void)setUpMainFrames{
    
    SinSeoYuGi1MainFrame *mainFrame = [SinSeoYuGi1MainFrame sinSeoYuGi1MainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
}

-(void)setUpPhotoFrame{
    
    FullRectangle *fullRectPhotoFrame = [FullRectangle fullRectangle];
    fullRectPhotoFrame.indexInLayer = @"0";
    fullRectPhotoFrame.isTemplateItem = true;
    fullRectPhotoFrame.isFixedPhotoFrame = true;
    fullRectPhotoFrame.center = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:fullRectPhotoFrame];
    
    PhotoFrame *circlePhotoFrame = [BasicCirclePhotoFrame basicCirclePhotoFrame];
    circlePhotoFrame.indexInLayer =@"1";
    circlePhotoFrame.center = CGPointMake(0.72, 0.45);
    circlePhotoFrame.scale = 0.3;
    circlePhotoFrame.isTemplateItem = true;
    [self.photoFrames addObject:circlePhotoFrame];
    
}

-(void)setUpTexts{
         
    //로고
    Text *logoText = [[Text alloc] init];
    SeoYuGiLogoTypo *logo = [SeoYuGiLogoTypo seoYuGiLogoTypo];
    logoText.scale = 0.13;
    logoText.center = CGPointMake(0.5, 0.06);
    logoText.isTemplateItem = true;
    logoText.indexInLayer =@"2";
    logoText.text = @"서유기";
    logoText.textView.text = logoText.text;
    
    logoText.typo = logo;
    [self.texts addObject:logoText];
    
    //와 나 이런거 무서워한다
    Text *scaredText = [[Text alloc] init];
    SeoYuGiGagwanTypo *gagwanSmall = [SeoYuGiGagwanTypo seoYuGiGagwanTypo];
    scaredText.scale = 0.65;
    scaredText.center = CGPointMake(0.3, 0.71);
    scaredText.isTemplateItem = true;
    scaredText.indexInLayer =@"3";
    scaredText.text = @"와 나 이런거 무서워한다";
    scaredText.textView.text = scaredText.text;
    scaredText.typo = gagwanSmall;
    [self.texts addObject:scaredText];
    
    //가관이네..
    Text *gagwanText = [[Text alloc] init];
    SeoYuGiGagwanTypo *gagwanBig = [SeoYuGiGagwanTypo seoYuGiGagwanTypo];
    gagwanText.scale = 0.384;
    gagwanText.center = CGPointMake(0.58, 0.85);
    gagwanText.isTemplateItem = true;
    gagwanText.indexInLayer =@"4";
    gagwanText.text = @"가관이네..";
    gagwanText.textView.text = gagwanText.text;
    gagwanText.typo = gagwanBig;
    [self.texts addObject:gagwanText];
    
}

-(void)setUpStickers{
    
    SinSeoYuGiExc1Sticker *exc1Sticker = [SinSeoYuGiExc1Sticker sinSeoYuGiExc1Sticker];
    exc1Sticker.indexInLayer =@"5";
    exc1Sticker.scale = 0.23;
    exc1Sticker.rotationDegree = degreesToRadians(-5);
    exc1Sticker.isTemplateItem = true;
    exc1Sticker.center = CGPointMake(0.35, 0.37);
    
    [self.stickers addObject:exc1Sticker];
    
}

@end
