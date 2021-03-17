//
//  SinSeoYuGi3Template.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "SinSeoYuGi3Template.h"

@implementation SinSeoYuGi3Template

-(id)init{
    
    self = [super init];
    if(self){
        
        self.templateName = @"sinSeoYuGi3Template";
        self.previewImageName = @"sinseoyugiPreview3";
        self.category = NSLocalizedString(@"Entertain", nil);
        
    }
    return self;
    
}

+(SinSeoYuGi3Template*)sinSeoYuGi3Template{
    
    SinSeoYuGi3Template* sinSeoYuGi3Template = [[self alloc] init];
    
    return sinSeoYuGi3Template;
    
}

-(void)setUpMainFrames{
    
}

-(void)setUpPhotoFrame{
    
    FullRectangle *fullRectPhotoFrame = [FullRectangle fullRectangle];
    fullRectPhotoFrame.isTemplateItem = true;
    fullRectPhotoFrame.isBasePhotoFrame = true;
    fullRectPhotoFrame.relativeCenter = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:fullRectPhotoFrame];
    
}

-(void)setUpTexts{
    
    //서유기
    Text *logoText = [[Text alloc] init];
    SeoYuGiLogoTypo *cloudLogo = [SeoYuGiLogoTypo seoYuGiLogoTypo];
    logoText.scale = 0.138;
    logoText.relativeCenter = CGPointMake(0.1, 0.15);
    logoText.isTemplateItem = true;
    logoText.indexInLayer =@"0";
    logoText.text = @"서유기";
    logoText.textView.text = logoText.text;
    logoText.typo = cloudLogo;
    [self.texts addObject:logoText];
    
    //※공복주의※
    Text *hungryText = [[Text alloc] init];
    SeoYuGiHungryTypo *hungry = [SeoYuGiHungryTypo seoYuGiHungryTypo];
    hungryText.scale = 0.48;
    hungryText.relativeCenter = CGPointMake(0.27, 0.7);
    hungryText.isTemplateItem = true;
    hungryText.indexInLayer =@"1";
    hungryText.text = @"※공복주의※";
    hungryText.textView.text = hungryText.text;
    hungryText.typo = hungry;
    [self.texts addObject:hungryText];
    
    //2020 먹방 모음.zip
    Text *mukBangText = [[Text alloc] init];
    SeoYuGiHungryTypo *mukBang = [SeoYuGiHungryTypo seoYuGiHungryTypo];
    mukBang.textColor = [UIColor colorWithRed:253/255.0f green:199/255.0f blue:46/255.0 alpha:1 ];
    mukBangText.scale = 0.67;
    mukBangText.relativeCenter = CGPointMake(0.37, 0.87);
    mukBangText.isTemplateItem = true;
    mukBangText.indexInLayer =@"2";
    mukBangText.text = @"2020 먹방 모음.zip";
    mukBangText.textView.text = mukBangText.text;
    mukBangText.typo = mukBang;
    [self.texts addObject:mukBangText];
    
    //(소오오ㅗ름)
    Text *cowRiseText = [[Text alloc] init];
    SeoYuGiCowRiseTypo *cowRise = [SeoYuGiCowRiseTypo seoYuGiCowRiseTypo];
    cowRiseText.scale = 0.28;
    cowRiseText.relativeCenter = CGPointMake(0.77, 0.57);
    cowRiseText.isTemplateItem = true;
    cowRiseText.indexInLayer =@"3";
    cowRiseText.text = @"(소오오ㅗ름)";
    cowRiseText.textView.text = cowRiseText.text;
    cowRiseText.typo = cowRise;
    [self.texts addObject:cowRiseText];
    
    //*새벽 시청 금지!!!*
    Text *dawnWatchingText = [[Text alloc] init];
    SeoYuGiDawnWatchingTypo *dawnWatching = [SeoYuGiDawnWatchingTypo seoYuGiDawnWatchingTypo];
    dawnWatchingText.scale = 0.4;
    dawnWatchingText.relativeCenter = CGPointMake(0.53, 0.35);
    dawnWatchingText.rotationDegree = degreesToRadians(-15);
    dawnWatchingText.isTemplateItem = true;
    dawnWatchingText.indexInLayer =@"4";
    dawnWatchingText.text = @"*새벽 시청 금지!!!*";
    dawnWatchingText.textView.text = dawnWatchingText.text;
    dawnWatchingText.typo = dawnWatching;
    [self.texts addObject:dawnWatchingText];
    
}

@end
