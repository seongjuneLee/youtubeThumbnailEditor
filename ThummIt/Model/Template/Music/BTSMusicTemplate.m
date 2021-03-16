//
//  BTSMusicTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/11.
//

#import "BTSMusicTemplate.h"

@implementation BTSMusicTemplate


-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"btsMusicPreview";
        self.category = NSLocalizedString(@"Music", nil);
        self.templateName = @"btsMusicTemplate";
        self.mainFrameImageName = @"btsMusicFrame";
        
    }
    return self;
    
}

+(BTSMusicTemplate *)btsMusicTemplate{
    
    BTSMusicTemplate *btsMusicTemplate = [[self alloc] init];
    
    return btsMusicTemplate;
    
}

-(void)setUpMainFrames{

    BTSMusicMainFrame *mainFrame = [BTSMusicMainFrame btsMusicMainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
}

-(void)setUpPhotoFrame{
    
    AlbumRectangle *albumRectPhotoFrame = [AlbumRectangle albumRectangle];
    albumRectPhotoFrame.isTemplateItem = true;
    albumRectPhotoFrame.isBasePhotoFrame = NO;
    albumRectPhotoFrame.scale = 0.285;
    albumRectPhotoFrame.indexInLayer = @"7";
    albumRectPhotoFrame.relativeCenter = CGPointMake(0.5, 0.62);
    [self.photoFrames addObject:albumRectPhotoFrame];
    
}

-(void)setUpTexts{
    
    //작은 것들을 위한 시
    Text *poemForSmallText = [[Text alloc] init];
    PoemForSmallTypo *poemForSmallTypo = [PoemForSmallTypo poemForSmallTypo];
    poemForSmallText.scale = 0.44;
    poemForSmallText.relativeCenter = CGPointMake(0.5, 0.16);
    poemForSmallText.isTemplateItem = true;
    poemForSmallText.indexInLayer = @"0";
    poemForSmallText.text = @"작은 것들을 위한 시";
    poemForSmallText.textView.text = poemForSmallText.text;
    poemForSmallText.typo = poemForSmallTypo;
    [self.texts addObject:poemForSmallText];
    
    //BTS
    Text *btsText = [[Text alloc] init];
    BTSTypo *btsTypo = [BTSTypo btsTypo];
    btsText.scale = 0.07;
    btsText.relativeCenter = CGPointMake(0.5, 0.3);
    btsText.isTemplateItem = true;
    btsText.indexInLayer = @"1";
    btsText.text = @"BTS";
    btsText.textView.text = btsText.text;
    btsText.typo = btsTypo;
    [self.texts addObject:btsText];
    
    //2020년 한해를..
    Text *legendText = [[Text alloc] init];
    LegendSongTypo *legendSongTypo = [LegendSongTypo legendSongTypo];
    legendText.scale = 0.45;
    legendText.relativeCenter = CGPointMake(0.5, 0.93);
    legendText.isTemplateItem = true;
    legendText.indexInLayer = @"2";
    legendText.text = @"2020년 한해동안 많은 사랑을 받았던 명곡";
    legendText.textView.text = legendText.text;
    legendText.typo = legendSongTypo;
    [self.texts addObject:legendText];
    
}

-(void)setUpStickers{
    
    NextSticker *nextLeftSticker = [NextSticker nextSticker];
    nextLeftSticker.scale = 0.047;
    nextLeftSticker.rotationDegree = degreesToRadians(0);
    nextLeftSticker.indexInLayer = @"3";
    nextLeftSticker.isTemplateItem = true;
    nextLeftSticker.relativeCenter = CGPointMake(0.05, 0.5);
    
    [self.stickers addObject:nextLeftSticker];
    
    NextSticker *nextRightSticker = [NextSticker nextSticker];
    nextRightSticker.scale = 0.047;
    nextRightSticker.rotationDegree = degreesToRadians(180);
    nextRightSticker.indexInLayer = @"4";
    nextRightSticker.isTemplateItem = true;
    nextRightSticker.relativeCenter = CGPointMake(0.95, 0.5);
    
    [self.stickers addObject:nextRightSticker];

    TwoMusicNoteSticker *twoMusicNoteSticker = [TwoMusicNoteSticker twoMusicNoteSticker];
    twoMusicNoteSticker.scale = 0.04;
    twoMusicNoteSticker.rotationDegree = degreesToRadians(0);
    twoMusicNoteSticker.indexInLayer = @"5";
    twoMusicNoteSticker.isTemplateItem = true;
    twoMusicNoteSticker.relativeCenter = CGPointMake(0.04, 0.93);
    
    [self.stickers addObject:twoMusicNoteSticker];

    RectangleShadowSticker *rectangleShadowSticker = [RectangleShadowSticker rectangleShadowSticker];
    rectangleShadowSticker.scale = 0.39;
    rectangleShadowSticker.rotationDegree = degreesToRadians(0);
    rectangleShadowSticker.indexInLayer = @"6";
    rectangleShadowSticker.isTemplateItem = true;
    rectangleShadowSticker.relativeCenter = CGPointMake(0.445, 0.7745);
    
    [self.stickers addObject:rectangleShadowSticker];

    
    
}



@end
