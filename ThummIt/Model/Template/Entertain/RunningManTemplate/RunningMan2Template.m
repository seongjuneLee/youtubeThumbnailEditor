//
//  RunningMan2Template.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "RunningMan2Template.h"

@implementation RunningMan2Template

-(id)init{
    
    self = [super init];
    if(self){
        
        self.templateName = @"runningMan2Template";
        self.previewImageName = @"runningManPreview2";
        self.category = NSLocalizedString(@"Entertain", nil);

        
    }
    return self;
    
}

+(RunningMan2Template*)runningMan2Template{
    
    RunningMan2Template* runningMan2Template = [[self alloc] init];
    return runningMan2Template;
    
}

-(void)setUpMainFrames{
    
    RunningMan2MainFrame *mainFrame = [RunningMan2MainFrame runningMan2MainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
}

-(void)setUpPhotoFrame{
    
    FullRectangle *fullRectPhotoFrame = [FullRectangle fullRectangle];
    fullRectPhotoFrame.isTemplateItem = true;
    fullRectPhotoFrame.isBasePhotoFrame = true;
    fullRectPhotoFrame.relativeCenter = CGPointMake(0.5, 0.5);
    fullRectPhotoFrame.scale = 1;
    [self.photoFrames addObject:fullRectPhotoFrame];
    
    PhotoFrame *circlePhotoFrame = [BasicCirclePhotoFrame basicCirclePhotoFrame];
    circlePhotoFrame.indexInLayer =@"0";
    circlePhotoFrame.relativeCenter = CGPointMake(0.8, 0.5);
    circlePhotoFrame.scale = 0.3;
    circlePhotoFrame.backgroundImageName = @"runningManCircle";
    circlePhotoFrame.isTemplateItem = true;
    [self.photoFrames addObject:circlePhotoFrame];
    
}

-(void)setUpTexts{
    
    //로고
    Text *logoText = [[Text alloc] init];
    RunningManLogoTypo *logo = [RunningManLogoTypo runningManLogoTypo];
    logoText.indexInLayer =@"10";
    logoText.text = @"러닝맨";
    logoText.textView.text = logoText.text;
    logoText.scale = 0.09;
    logoText.relativeCenter = CGPointMake(0.09, 0.13);
    logoText.isTemplateItem = true;
    logoText.typo = logo;
    [self.texts addObject:logoText];
    
    //SBC WOW
    Text *SBCLogoText = [[Text alloc] init];
    BlueMoonTypo *blueMoon = [BlueMoonTypo blueMoonTypo];
    SBCLogoText.indexInLayer =@"1";
    SBCLogoText.text = @"SBC\nWOW";
    SBCLogoText.textView.text = SBCLogoText.text;
    SBCLogoText.scale = 0.11;
    SBCLogoText.relativeCenter = CGPointMake(0.925, 0.13);
    SBCLogoText.isTemplateItem = true;
    SBCLogoText.typo = blueMoon;
    [self.texts addObject:SBCLogoText];
    
    //환상의 티키타카
    Text *tikitakaText = [[Text alloc] init];
    TikiTypo *tikitaka = [TikiTypo tikiTypo];
    tikitakaText.indexInLayer =@"2";
    tikitakaText.text = @"환상의 티키타카";
    tikitakaText.textView.text = tikitakaText.text;
    tikitakaText.scale = 0.55;
    tikitakaText.relativeCenter = CGPointMake(0.32, 0.67);
    tikitakaText.isTemplateItem = true;
    tikitakaText.typo = tikitaka;
    [self.texts addObject:tikitakaText];
    
    //애드립 모음집
    Text *dripText = [[Text alloc] init];
    WhiteYellowGradientTypo *gradient = [WhiteYellowGradientTypo whiteYellowGradientTypo];
    dripText.indexInLayer =@"3";
    dripText.text = @"애드립 모음집";
    dripText.textView.text = dripText.text;
    dripText.scale = 0.63;
    dripText.relativeCenter = CGPointMake(0.35, 0.83);
    dripText.isTemplateItem = true;
    dripText.typo = gradient;
    [self.texts addObject:dripText];
    
    //뭐?
    Text *whatText = [[Text alloc] init];
    WhatTypo *what = [WhatTypo whatTypo];
    whatText.indexInLayer =@"4";
    whatText.text = @"뭐?";
    whatText.textView.text = whatText.text;
    whatText.scale = 0.05;
    whatText.relativeCenter = CGPointMake(0.64, 0.36);
    whatText.isTemplateItem = true;
    whatText.typo = what;
    [self.texts addObject:whatText];
    
    //분위기 파악 못해?!
    Text *asmosphereText = [[Text alloc] init];
    AtmosphereTypo *asmosphere = [AtmosphereTypo atmosphereTypo];
    asmosphereText.indexInLayer =@"5";
    asmosphereText.text = @"분위기 파악 못해?!";
    asmosphereText.textView.text = asmosphereText.text;
    asmosphereText.scale = 0.36;
    asmosphereText.relativeCenter = CGPointMake(0.75, 0.43);
    asmosphereText.isTemplateItem = true;
    asmosphereText.typo = asmosphere;
    [self.texts addObject:asmosphereText];
    
    //혼절직전
    CGFloat xCenter1 = 0.12;
    CGFloat xCenter2 = 0.55;
    CGFloat yCenter1 = 0.23;
    CGFloat yCenter2 = 0.53;
    CGFloat scale = 0.063;
    
    KnockOutTypo *knockOut = [KnockOutTypo knockOutTypo];
    
    Text *knockOutText1 = [[Text alloc] init];
    knockOutText1.indexInLayer =@"6";
    knockOutText1.text = @"혼";
    knockOutText1.textView.text = knockOutText1.text;
    knockOutText1.scale = scale;
    knockOutText1.relativeCenter = CGPointMake(xCenter1, yCenter1);
    knockOutText1.isTemplateItem = true;
    knockOutText1.typo = knockOut;
    [self.texts addObject:knockOutText1];
    
    Text *knockOutText2 = [[Text alloc] init];
    knockOutText2.indexInLayer =@"7";
    knockOutText2.text = @"절";
    knockOutText2.textView.text = knockOutText2.text;
    knockOutText2.scale = scale;
    knockOutText2.relativeCenter = CGPointMake(xCenter2, yCenter1);
    knockOutText2.isTemplateItem = true;
    knockOutText2.typo = knockOut;
    [self.texts addObject:knockOutText2];
    
    Text *knockOutText3 = [[Text alloc] init];
    knockOutText3.indexInLayer =@"8";
    knockOutText3.text = @"직";
    knockOutText3.textView.text = knockOutText3.text;
    knockOutText3.scale = scale;
    knockOutText3.relativeCenter = CGPointMake(xCenter1, yCenter2);
    knockOutText3.isTemplateItem = true;
    knockOutText3.typo = knockOut;
    [self.texts addObject:knockOutText3];
    
    Text *knockOutText4 = [[Text alloc] init];
    knockOutText4.indexInLayer =@"9";
    knockOutText4.text = @"전";
    knockOutText4.textView.text = knockOutText4.text;
    knockOutText4.scale = scale;
    knockOutText4.relativeCenter = CGPointMake(xCenter2, yCenter2);
    knockOutText4.isTemplateItem = true;
    knockOutText4.typo = knockOut;
    [self.texts addObject:knockOutText4];
    
}

-(void)setUpStickers{
    
}

@end
