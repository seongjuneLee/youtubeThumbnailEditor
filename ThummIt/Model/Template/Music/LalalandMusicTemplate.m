//
//  LalalandMusicTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/12.
//

#import "LalalandMusicTemplate.h"

@implementation LalalandMusicTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"lalalandMusicPreview";
        self.category = NSLocalizedString(@"Music", nil);
        self.templateName = @"lalalandMusicTemplate";
        self.mainFrameImageName = @"lalalandMusicFrame";
        self.backgroundColor = [UIColor colorWithRed:49/255.0 green:18/255.0 blue:83/255.0 alpha:1.0];
        
    }
    return self;
    
}

+(LalalandMusicTemplate *)lalalandMusicTemplate{
    
    LalalandMusicTemplate *lalalandMusicTemplate = [[self alloc] init];
    
    return lalalandMusicTemplate;
    
}

-(void)setUpMainFrames{

}

-(void)setUpPhotoFrame{
    
    
}

-(void)setUpTexts{
    
    //라라랜드
    Text *lalalandText = [[Text alloc] init];
    LalalandTypo *lalalandTypo = [LalalandTypo lalalandTypo];
    lalalandText.scale = 0.45;
    lalalandText.relativeCenter = CGPointMake(0.5, 0.43);
    lalalandText.isTemplateItem = true;
    lalalandText.indexInLayer = @"0";
    lalalandText.text = @"라라랜드";
    lalalandText.textView.text = lalalandText.text;
    lalalandText.typo = lalalandTypo;
    [self.texts addObject:lalalandText];
    
    //ost
    Text *ostText = [[Text alloc] init];
    LalalandTypo *ostTypo = [LalalandTypo lalalandTypo];
    ostText.scale = 0.197;
    ostText.relativeCenter = CGPointMake(0.5, 0.615);
    ostText.isTemplateItem = true;
    ostText.indexInLayer = @"1";
    ostText.text = @"ost";
    ostText.textView.text = ostText.text;
    ostText.typo = ostTypo;
    [self.texts addObject:ostText];

    
    //your PLAYLIST
    Text *yourPlaylistText = [[Text alloc] init];
    LalalandTypo *yourPlaylistTypo = [LalalandTypo lalalandTypo];
    yourPlaylistTypo.textColor = [UIColor colorWithRed:(169/255.0) green:(96/255.0) blue:(220/255.0) alpha:1];
    yourPlaylistTypo.fontInterval = 1;
    yourPlaylistText.scale = 0.245;
    yourPlaylistText.relativeCenter = CGPointMake(0.163, 0.93);
    yourPlaylistText.isTemplateItem = true;
    yourPlaylistText.indexInLayer = @"2";
    yourPlaylistText.text = @"your PLAYLIST";
    yourPlaylistText.textView.text = yourPlaylistText.text;
    yourPlaylistText.typo = yourPlaylistTypo;
    [self.texts addObject:yourPlaylistText];
    
}

-(void)setUpStickers{
    
    RectangleTransparentSticker *rectangleTransparentSticker = [RectangleTransparentSticker rectangleTransparentSticker];
    rectangleTransparentSticker.scale = 0.47;
    rectangleTransparentSticker.rotationDegree = degreesToRadians(0);
    rectangleTransparentSticker.indexInLayer = @"3";
    rectangleTransparentSticker.isTemplateItem = true;
    rectangleTransparentSticker.relativeCenter = CGPointMake(0.5, 0.5);
    
    [self.stickers addObject:rectangleTransparentSticker];
    
    RectangleFrameSticker *rectangleFrameSticker = [RectangleFrameSticker rectangleFrameSticker];
    rectangleFrameSticker.scale = 0.63;
    rectangleFrameSticker.rotationDegree = degreesToRadians(0);
    rectangleFrameSticker.indexInLayer = @"4";
    rectangleFrameSticker.isTemplateItem = true;
    rectangleFrameSticker.relativeCenter = CGPointMake(0.5, 0.5);
    
    [self.stickers addObject:rectangleFrameSticker];
    
    LalaLandPlaySticker *lalaLandPlaySticker = [LalaLandPlaySticker lalaLandPlaySticker];
    lalaLandPlaySticker.scale = 0.03;
    lalaLandPlaySticker.rotationDegree = degreesToRadians(0);
    lalaLandPlaySticker.indexInLayer = @"5";
    lalaLandPlaySticker.isTemplateItem = true;
    lalaLandPlaySticker.relativeCenter = CGPointMake(0.0355, 0.93);
    
    [self.stickers addObject:lalaLandPlaySticker];

    
}



@end
