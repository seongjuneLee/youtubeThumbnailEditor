//
//  NinetyCenturyMusicTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/11.
//

#import "NinetyCenturyMusicTemplate.h"

@implementation NinetyCenturyMusicTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"ninetyCenturyMusicPreview";
        self.category = NSLocalizedString(@"Music", nil);
        self.templateName = @"ninetyCenturyMusicTemplate";
        self.mainFrameImageName = @"ninetyCenturyMusicFrame";
        
    }
    return self;
    
}

+(NinetyCenturyMusicTemplate *)ninetyCenturyMusicTemplate{
    
    NinetyCenturyMusicTemplate *ninetyCenturyMusicTemplate = [[self alloc] init];
    
    return ninetyCenturyMusicTemplate;
    
}

-(void)setUpMainFrames{

    NinetyCenturyMusicMainFrame *mainFrame = [NinetyCenturyMusicMainFrame ninetyCenturyMusicMainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
}

-(void)setUpPhotoFrame{
    
    FullRectangle *fullRectPhotoFrame = [FullRectangle fullRectangle];
    fullRectPhotoFrame.isTemplateItem = true;
    fullRectPhotoFrame.isBasePhotoFrame = true;
    fullRectPhotoFrame.relativeCenter = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:fullRectPhotoFrame];
    
}

-(void)setUpTexts{
    
    //1990s PLAYLIST
    Text *ninetyCenturyText = [[Text alloc] init];
    NinetyCenturyTypo *ninetyCenturyTypo = [NinetyCenturyTypo ninetyCenturyTypo];
    ninetyCenturyTypo.textColor = UIColor.blackColor;
    ninetyCenturyText.scale = 0.235;
    ninetyCenturyText.relativeCenter = CGPointMake(0.18, 0.628);
    ninetyCenturyText.isTemplateItem = true;
    ninetyCenturyText.indexInLayer = @"0";
    ninetyCenturyText.text = @"1990s PLAYLIST";
    ninetyCenturyText.textView.text = ninetyCenturyText.text;
    ninetyCenturyText.typo = ninetyCenturyTypo;
    [self.texts addObject:ninetyCenturyText];
    
    //나만 몰랐던
    Text *didntKnowText = [[Text alloc] init];
    ThatSongTypo *didntKnowTypo = [ThatSongTypo thatSongTypo];
    didntKnowTypo.textColor = UIColor.whiteColor;
    didntKnowText.scale = 0.33;
    didntKnowText.relativeCenter = CGPointMake(0.206, 0.74);
    didntKnowText.isTemplateItem = true;
    didntKnowText.indexInLayer = @"1";
    didntKnowText.text = @"나만 몰랐던";
    didntKnowText.textView.text = didntKnowText.text;
    didntKnowText.typo = didntKnowTypo;
    [self.texts addObject:didntKnowText];

    
    //그시절 그 노래
    Text *thatSongText = [[Text alloc] init];
    ThatSongTypo *thatSongTypo = [ThatSongTypo thatSongTypo];
    thatSongTypo.textColor = [UIColor colorWithRed:0/255.0 green:220/255.0 blue:184/255.0 alpha:1];;
    thatSongText.scale = 0.41;
    thatSongText.relativeCenter = CGPointMake(0.246, 0.87);
    thatSongText.isTemplateItem = true;
    thatSongText.indexInLayer = @"2";
    thatSongText.text = @"그시절 그 노래";
    thatSongText.textView.text = thatSongText.text;
    thatSongText.typo = thatSongTypo;
    [self.texts addObject:thatSongText];

    
    
}

-(void)setUpStickers{
    
    MintBoxSticker *mintBoxSticker = [MintBoxSticker mintBoxSticker];
    mintBoxSticker.scale = 0.263;
    mintBoxSticker.rotationDegree = degreesToRadians(0);
    mintBoxSticker.indexInLayer = @"3";
    mintBoxSticker.isTemplateItem = true;
    mintBoxSticker.relativeCenter = CGPointMake(0.18, 0.63);
    
    [self.stickers addObject:mintBoxSticker];
    
    
}


@end
