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
    
    //라라랜드 ost
    Text *lalalandText = [[Text alloc] init];
    LalalandTypo *lalalandTypo = [LalalandTypo lalalandTypo];
    lalalandTypo.textColor = [UIColor colorWithRed:(0/255.0) green:(0/255.0) blue:(0/255.0) alpha:1];
    lalalandText.scale = 0.09;
    lalalandText.relativeCenter = CGPointMake(0.3, 0.77);
    lalalandText.isTemplateItem = true;
    lalalandText.indexInLayer = @"0";
    lalalandText.text = @"라라랜드\nOST";
    lalalandText.textView.text = lalalandText.text;
    lalalandText.typo = lalalandTypo;
    [self.texts addObject:lalalandText];
    
    //your PLAYLIST
    Text *yourPlaylistText = [[Text alloc] init];
    LalalandTypo *yourPlaylistTypo = [LalalandTypo lalalandTypo];
    yourPlaylistTypo.textColor = [UIColor colorWithRed:(0/255.0) green:(0/255.0) blue:(0/255.0) alpha:1];
    yourPlaylistText.scale = 0.09;
    yourPlaylistText.relativeCenter = CGPointMake(0.3, 0.77);
    yourPlaylistText.isTemplateItem = true;
    yourPlaylistText.indexInLayer = @"1";
    yourPlaylistText.text = @"your PLAYLIST";
    yourPlaylistText.textView.text = yourPlaylistText.text;
    yourPlaylistText.typo = yourPlaylistTypo;
    [self.texts addObject:yourPlaylistText];
    
}

-(void)setUpStickers{
    
    RectangleTransparentSticker *rectangleTransparentSticker = [RectangleTransparentSticker rectangleTransparentSticker];
    rectangleTransparentSticker.scale = 0.08;
    rectangleTransparentSticker.rotationDegree = degreesToRadians(-7);
    rectangleTransparentSticker.indexInLayer = @"2";
    rectangleTransparentSticker.isTemplateItem = true;
    rectangleTransparentSticker.relativeCenter = CGPointMake(0.82, 0.31);
    
    [self.stickers addObject:rectangleTransparentSticker];
    
    RectangleFrameSticker *rectangleFrameSticker = [RectangleFrameSticker rectangleFrameSticker];
    rectangleFrameSticker.scale = 0.08;
    rectangleFrameSticker.rotationDegree = degreesToRadians(-7);
    rectangleFrameSticker.indexInLayer = @"3";
    rectangleFrameSticker.isTemplateItem = true;
    rectangleFrameSticker.relativeCenter = CGPointMake(0.82, 0.31);
    
    [self.stickers addObject:rectangleFrameSticker];
    
    
}



@end
