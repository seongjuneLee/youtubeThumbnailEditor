//
//  PlaylistMusicTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2021/03/11.
//

#import "PlaylistMusicTemplate.h"

@implementation PlaylistMusicTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"playlistMusicPreview";
        self.category = NSLocalizedString(@"Music", nil);
        self.templateName = @"playlistMusicTemplate";
        self.mainFrameImageName = @"playlistMusicFrame";
        
    }
    return self;
    
}

+(PlaylistMusicTemplate *)playlistMusicTemplate{
    
    PlaylistMusicTemplate *playlistMusicTemplate = [[self alloc] init];
    
    return playlistMusicTemplate;
    
}

-(void)setUpMainFrames{

    PlaylistMainFrame *mainFrame = [PlaylistMainFrame playlistMainFrame];
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
    

    //PLAYLIST
    Text *playlistText = [[Text alloc] init];
    PlaylistTypo *playlistTypo = [PlaylistTypo playlistTypo];
    playlistText.scale = 0.68;
    playlistText.relativeCenter = CGPointMake(0.515, 0.45);
    playlistText.isTemplateItem = true;
    playlistText.indexInLayer = @"0";
    playlistText.text = @"PLAYLIST";
    playlistText.textView.text = playlistText.text;
    playlistText.typo = playlistTypo;
    [self.texts addObject:playlistText];
    
    
}

-(void)setUpStickers{
    
    VolumeSticker *volumeSticker = [VolumeSticker volumeSticker];
    volumeSticker.scale = 0.065;
    volumeSticker.rotationDegree = degreesToRadians(0);
    volumeSticker.indexInLayer = @"1";
    volumeSticker.isTemplateItem = true;
    volumeSticker.relativeCenter = CGPointMake(0.5, 0.9);
    
    [self.stickers addObject:volumeSticker];
    
    
}


@end
