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
    ninetyCenturyText.scale = 0.09;
    ninetyCenturyText.relativeCenter = CGPointMake(0.3, 0.77);
    ninetyCenturyText.isTemplateItem = true;
    ninetyCenturyText.indexInLayer = @"0";
    ninetyCenturyText.text = @"PLAYLIST";
    ninetyCenturyText.textView.text = ninetyCenturyText.text;
    ninetyCenturyText.typo = ninetyCenturyTypo;
    [self.texts addObject:ninetyCenturyText];
    
    
}

-(void)setUpStickers{
    
    MintBoxSticker *mintBoxSticker = [MintBoxSticker mintBoxSticker];
    mintBoxSticker.scale = 0.08;
    mintBoxSticker.rotationDegree = degreesToRadians(-7);
    mintBoxSticker.indexInLayer = @"1";
    mintBoxSticker.isTemplateItem = true;
    mintBoxSticker.relativeCenter = CGPointMake(0.82, 0.31);
    
    [self.stickers addObject:mintBoxSticker];
    
    
}


@end
