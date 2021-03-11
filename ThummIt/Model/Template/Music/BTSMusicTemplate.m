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
    
//    FullRectangle *fullRectPhotoFrame = [FullRectangle fullRectangle];
//    fullRectPhotoFrame.isTemplateItem = true;
//    fullRectPhotoFrame.isBasePhotoFrame = true;
//    fullRectPhotoFrame.relativeCenter = CGPointMake(0.5, 0.5);
//    [self.photoFrames addObject:fullRectPhotoFrame];
    
}

-(void)setUpTexts{
    
    //작은 것들을 위한 시
    Text *poemForSmallText = [[Text alloc] init];
    PoemForSmallTypo *poemForSmallTypo = [PoemForSmallTypo poemForSmallTypo];
    poemForSmallText.scale = 0.09;
    poemForSmallText.relativeCenter = CGPointMake(0.3, 0.77);
    poemForSmallText.isTemplateItem = true;
    poemForSmallText.indexInLayer = @"0";
    poemForSmallText.text = @"작은 것들을 위한 시";
    poemForSmallText.textView.text = poemForSmallText.text;
    poemForSmallText.typo = poemForSmallTypo;
    [self.texts addObject:poemForSmallText];
    
    //BTS
    Text *btsText = [[Text alloc] init];
    BTSTypo *btsTypo = [BTSTypo btsTypo];
    btsText.scale = 0.48;
    btsText.relativeCenter = CGPointMake(0.77, 0.65);
    btsText.isTemplateItem = true;
    btsText.indexInLayer = @"1";
    btsText.text = @"BTS";
    btsText.textView.text = btsText.text;
    btsText.typo = btsTypo;
    [self.texts addObject:btsText];
    
    //2020년 한해를..
    Text *legendText = [[Text alloc] init];
    LegendSongTypo *legendSongTypo = [LegendSongTypo legendSongTypo];
    legendText.scale = 0.28;
    legendText.relativeCenter = CGPointMake(0.73, 0.37);
    legendText.isTemplateItem = true;
    legendText.indexInLayer = @"2";
    legendText.text = @"2020년 한해동안 많은 사랑을 받았던 명곡";
    legendText.textView.text = legendText.text;
    legendText.typo = legendSongTypo;
    [self.texts addObject:legendText];
    
}

-(void)setUpStickers{
    
    NextSticker *nextSticker = [NextSticker nextSticker];
    nextSticker.scale = 0.08;
    nextSticker.rotationDegree = degreesToRadians(-7);
    nextSticker.indexInLayer = @"9";
    nextSticker.isTemplateItem = true;
    nextSticker.relativeCenter = CGPointMake(0.82, 0.31);
    
    [self.stickers addObject:nextSticker];
    
    TwoMusicNoteSticker *twoMusicNoteSticker = [TwoMusicNoteSticker twoMusicNoteSticker];
    twoMusicNoteSticker.scale = 0.08;
    twoMusicNoteSticker.rotationDegree = degreesToRadians(-7);
    twoMusicNoteSticker.indexInLayer = @"9";
    twoMusicNoteSticker.isTemplateItem = true;
    twoMusicNoteSticker.relativeCenter = CGPointMake(0.82, 0.31);
    
    [self.stickers addObject:twoMusicNoteSticker];

    RectangleShadowSticker *rectangleShadowSticker = [RectangleShadowSticker rectangleShadowSticker];
    rectangleShadowSticker.scale = 0.08;
    rectangleShadowSticker.rotationDegree = degreesToRadians(-7);
    rectangleShadowSticker.indexInLayer = @"9";
    rectangleShadowSticker.isTemplateItem = true;
    rectangleShadowSticker.relativeCenter = CGPointMake(0.82, 0.31);
    
    [self.stickers addObject:rectangleShadowSticker];

    
    
}



@end
