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

    }
    return self;
    
}

+(DanceVlogTemplate*)danceVlogTemplate{
    
    DanceVlogTemplate* danceVlogTemplate = [[self alloc] init];
    
    return danceVlogTemplate;
    
}

-(void)setUpMainFrames{

    DanceVlogMainFrame *mainFrame = [DanceVlogMainFrame danceVlogMainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
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
    firstPhotoFrame.isBasePhotoFrame = true;
    secondPhotoFrame.isBasePhotoFrame = true;
    thirdPhotoFrame.isBasePhotoFrame = true;
    fourthPhotoFrame.isBasePhotoFrame = true;
    firstPhotoFrame.relativeCenter = CGPointMake(0.25, 0.25);
    secondPhotoFrame.relativeCenter = CGPointMake(0.75, 0.25);
    thirdPhotoFrame.relativeCenter = CGPointMake(0.25, 0.75);
    fourthPhotoFrame.relativeCenter = CGPointMake(0.75, 0.75);
    [self.photoFrames addObject:firstPhotoFrame];
    [self.photoFrames addObject:secondPhotoFrame];
    [self.photoFrames addObject:thirdPhotoFrame];
    [self.photoFrames addObject:fourthPhotoFrame];
        
}

-(void)setUpTexts{
    
    Text *dacevlogText = [[Text alloc] init];
    VlogLongDance *dancevlog = [VlogLongDance vlogLongDance];
    dacevlogText.scale = 0.3;
    dacevlogText.relativeCenter = CGPointMake(0.5, 0.41);
    dacevlogText.isTemplateItem = true;
    dacevlogText.indexInLayer =@"0";
    dacevlogText.text = @"댄스 동아리 연습";
    dacevlogText.textView.text = @"댄스 동아리 연습";
    dacevlogText.typo = dancevlog;
    [self.texts addObject:dacevlogText];
    
    Text *vlogText = [[Text alloc] init];
    VlogShortDance *vlog = [VlogShortDance vlogShortDance];
    vlogText.scale = 0.17;
    vlogText.relativeCenter = CGPointMake(0.5, 0.59);
    vlogText.isTemplateItem = true;
    vlogText.indexInLayer =@"1";
    vlogText.text = @"브이로그";
    vlogText.textView.text = @"브이로그";
    vlogText.typo = vlog;

    [self.texts addObject:vlogText];
    
}

-(void)setUpStickers{
    
    
    HeartSticker10 *heartSticker10 = [HeartSticker10 heartSticker10];
    heartSticker10.tintColor = [UIColor  colorWithRed:255/255.0 green:112/255.0 blue:255/255.0 alpha:1.0];
    heartSticker10.indexInLayer =@"2";
    heartSticker10.scale = 0.18;
    heartSticker10.isTemplateItem = true;
    heartSticker10.relativeCenter = CGPointMake(0.13, 0.2);

    [self.stickers addObject:heartSticker10];

    
    HeartSticker3 *heartSticker3 = [HeartSticker3 heartSticker3];
    heartSticker3.tintColor = [UIColor colorWithRed:247/255.0 green:141/255.0 blue:131/255.0 alpha:1.0];
    heartSticker3.indexInLayer =@"3";
    heartSticker3.scale = 0.11;
    heartSticker3.isTemplateItem = true;
    heartSticker3.relativeCenter = CGPointMake(0.76, 0.28);


    [self.stickers addObject:heartSticker3];
//    #f78d83
    
    HeartSticker4 *heartSticker4 = [HeartSticker4 heartSticker4];
    heartSticker4.tintColor = [UIColor colorWithRed:248/255.0 green:247/255.0 blue:183/255.0 alpha:1.0];
    heartSticker4.indexInLayer =@"4";
    heartSticker4.scale = 0.13;
    heartSticker4.isTemplateItem = true;
    heartSticker4.relativeCenter = CGPointMake(0.89, 0.51);

    [self.stickers addObject:heartSticker4];
//   #f8f7b7
    HeartSticker5 *heartStickerUnder = [HeartSticker5 heartSticker5];
    heartStickerUnder.tintColor = [UIColor  colorWithRed:182/255.0 green:151/255.0 blue:208/255.0 alpha:1.0];
    heartStickerUnder.indexInLayer =@"5";
    heartStickerUnder.scale = 0.13;
    heartStickerUnder.isTemplateItem = true;
    heartStickerUnder.relativeCenter = CGPointMake(0.045, 0.93);

    [self.stickers addObject:heartStickerUnder];
    
    
    
}


@end
