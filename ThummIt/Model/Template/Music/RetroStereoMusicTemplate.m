//
//  RetroStereoMusicTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/12.
//

#import "RetroStereoMusicTemplate.h"

@implementation RetroStereoMusicTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"retroMusicPreview";
        self.category = NSLocalizedString(@"Music", nil);
        self.templateName = @"retroMusicTemplate";
        self.mainFrameImageName = @"retroMusicFrame";
//        self.backgroundColor = [UIColor blaccol];
        
    }
    return self;
    
}

+(RetroStereoMusicTemplate *)retroStereoMusicTemplate{
    
    RetroStereoMusicTemplate *retroStereoMusicTemplate = [[self alloc] init];
    
    return retroStereoMusicTemplate;
    
}

-(void)setUpMainFrames{

    RetroMusicMainFrame *mainFrame = [RetroMusicMainFrame retroMusicMainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
}

-(void)setUpPhotoFrame{
    
    
}

-(void)setUpTexts{
    
    //RETRO
    Text *retroText = [[Text alloc] init];
    RetroTypo *retroTypo = [RetroTypo retroTypo];
//    retroTypo.textColor = [UIColor colorWithRed:(0/255.0) green:(0/255.0) blue:(0/255.0) alpha:1];//그라대ㅔ이션
    retroText.scale = 0.4;
    retroText.relativeCenter = CGPointMake(0.4, 0.42);
    retroText.isTemplateItem = true;
    retroText.indexInLayer = @"0";
    retroText.text = @"RETRO";
    retroText.textView.text = retroText.text;
    retroText.typo = retroTypo;
    [self.texts addObject:retroText];
    
    //MUSIC
    Text *musicText = [[Text alloc] init];
    RetroTypo *musicTypo = [RetroTypo retroTypo];
//    musicTypo.textColor = [UIColor colorWithRed:(0/255.0) green:(0/255.0) blue:(0/255.0) alpha:1];//그라대ㅔ이션
    musicText.scale = 0.4;
    musicText.relativeCenter = CGPointMake(0.61, 0.68); /* 87 184 218   ---  97 46 135*/
    musicText.isTemplateItem = true;
    musicText.indexInLayer = @"1";
    musicText.text = @"MUSIC";
    musicText.textView.text = musicText.text;
    musicText.typo = musicTypo;
    [self.texts addObject:musicText];

    
    //copyright
    Text *appleSDText = [[Text alloc] init];
    AppleSDTypo *appleSDTypo = [AppleSDTypo appleSDTypo];
    appleSDTypo.textColor = [UIColor whiteColor];
    appleSDText.scale = 0.4;
    appleSDText.relativeCenter = CGPointMake(0.5, 0.94);
    appleSDText.isTemplateItem = true;
    appleSDText.indexInLayer = @"2";
    appleSDText.text = @"Copyright 2020. XXXX. All rights reserved";
    appleSDText.textView.text = appleSDText.text;
    appleSDText.typo = appleSDTypo;
    [self.texts addObject:appleSDText];
    
}

-(void)setUpStickers{
    
    RetroPlaySticker *retroPlaySticker = [RetroPlaySticker retroPlaySticker];
    retroPlaySticker.scale = 0.25;
    retroPlaySticker.rotationDegree = degreesToRadians(0);
    retroPlaySticker.indexInLayer = @"3";
    retroPlaySticker.isTemplateItem = true;
    retroPlaySticker.relativeCenter = CGPointMake(0.52, 0.5);
    
    [self.stickers addObject:retroPlaySticker];

    
    
}


@end
