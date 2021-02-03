//
//  DanceVlogTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/01.
//

#import "DanceVlogTemplate.h"

@implementation DanceVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"danceVlogPreView";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"DanceVlogTemplate";
        self.backgroundImageName = @"danceVlogFrame";

    }
    return self;
    
}

+(DanceVlogTemplate*)danceVlogTemplate{
    
    DanceVlogTemplate* danceVlogTemplate = [[self alloc] init];
    
    return danceVlogTemplate;
    
}

-(void)setUpPhotoFrame{
    
    self.photoFrames = [NSMutableArray new];
    QuarterRectangle *firstPhotoFrame = [QuarterRectangle quarterRectangle];
    QuarterRectangle *secondPhotoFrame = [QuarterRectangle quarterRectangle];
    QuarterRectangle *thirdPhotoFrame = [QuarterRectangle quarterRectangle];
    QuarterRectangle *fourthPhotoFrame = [QuarterRectangle quarterRectangle];
    firstPhotoFrame.isTemplateItem = true;
    secondPhotoFrame.isTemplateItem = true;
    thirdPhotoFrame.isTemplateItem = true;
    fourthPhotoFrame.isTemplateItem = true;
    firstPhotoFrame.isFixedPhotoFrame = true;
    secondPhotoFrame.isFixedPhotoFrame = true;
    thirdPhotoFrame.isFixedPhotoFrame = true;
    fourthPhotoFrame.isFixedPhotoFrame = true;
    firstPhotoFrame.center = CGPointMake(0.25, 0.25);
    secondPhotoFrame.center = CGPointMake(0.75, 0.25);
    thirdPhotoFrame.center = CGPointMake(0.25, 0.75);
    fourthPhotoFrame.center = CGPointMake(0.75, 0.75);
    [self.photoFrames addObject:firstPhotoFrame];
    [self.photoFrames addObject:secondPhotoFrame];
    [self.photoFrames addObject:thirdPhotoFrame];
    [self.photoFrames addObject:fourthPhotoFrame];
        
}

-(void)setUpTexts{
    
    Text *dacevlogText = [[Text alloc] init];
    VlogLongDance *dancevlog = [VlogLongDance vlogLongDance];
    dacevlogText.scale = 0.6;
    dacevlogText.center = CGPointMake(0.5, 0.41);
    dacevlogText.isTemplateItem = true;
    dacevlogText.indexInLayer =@"0";
    dacevlogText.text = @"댄스 동아리 연습";
    dacevlogText.textView.text = @"댄스 동아리 연습";
    dacevlogText.typo = dancevlog;
    [self.texts addObject:dacevlogText];
    
    Text *vlogText = [[Text alloc] init];
    VlogShortDance *vlog = [VlogShortDance vlogShortDance];
    vlogText.scale = 0.6;
    vlogText.center = CGPointMake(0.5, 0.59);
    vlogText.isTemplateItem = true;
    vlogText.indexInLayer =@"1";
    vlogText.text = @"브이로그";
    vlogText.textView.text = @"브이로그";
    vlogText.typo = vlog;

    [self.texts addObject:vlogText];
    
}

-(void)setUpStickers{
    
    
//    VlogHeartSticker2 *heartSticker2 = [VlogHeartSticker2 vlogHeartSticker2];
//    heartSticker2.scale = 0.6;
//    heartSticker2.isTemplateItem = true;
//    heartSticker2.center = CGPointMake(0.1, 0.99);
//
//    [self.stickers addObject:heartSticker2];
//  #b598ce
    
    HeartSticker3 *heartSticker3 = [HeartSticker3 heartSticker3];
    heartSticker3.indexInLayer =@"2";
    heartSticker3.scale = 0.6;
    heartSticker3.isTemplateItem = true;
    heartSticker3.center = CGPointMake(0.8, 0.35);

    [self.stickers addObject:heartSticker3];
//    #f78d83
    
    HeartSticker4 *heartSticker4 = [HeartSticker4 heartSticker4];
    heartSticker4.indexInLayer =@"3";
    heartSticker4.scale = 0.6;
    heartSticker4.isTemplateItem = true;
    heartSticker4.center = CGPointMake(0.97, 0.58);

    [self.stickers addObject:heartSticker4];
//   #f8f7b7
    HeartSticker4 *heartStickerUnder = [HeartSticker4 heartSticker4];
    heartStickerUnder.indexInLayer =@"4";
    heartStickerUnder.scale = 0.6;
    heartStickerUnder.isTemplateItem = true;
    heartStickerUnder.center = CGPointMake(0.25, 0.75);

    [self.stickers addObject:heartStickerUnder];
    
    
    
}


@end
