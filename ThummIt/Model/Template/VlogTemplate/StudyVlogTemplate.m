//
//  StudyVlogTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/02.
//

#import "StudyVlogTemplate.h"

@implementation StudyVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"studyVlogPreView";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"StudyVlogTemplate";
        self.backgroundImageName = @"";
        
    }
    return self;
    
}

+(StudyVlogTemplate*)studyVlogTemplate{
    
    StudyVlogTemplate* studyVlogTemplate = [[self alloc] init];
    
    return studyVlogTemplate;
    
}

-(void)setUpPhotoFrame{
    
    PhotoFrame *photoFrame1 = [[PhotoFrame alloc] init];
    photoFrame1.isTemplateItem = true;
    photoFrame1.isFixedPhotoFrame = true;
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float frameWidth = screenWidth;
    photoFrame1.baseView.backgroundColor = UIColor.grayColor;
    photoFrame1.baseView.frameSize = CGSizeMake(frameWidth * 0.68, screenWidth * 9/16 * 0.73);
    photoFrame1.center = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:photoFrame1];
  
        
}

-(void)setUpTexts{
    
    Text *vlogText = [[Text alloc] init];
    VlogStudy *vlog = [VlogStudy vlogStudy];
    vlogText.scale = 0.65;
    vlogText.center = CGPointMake(0.5, 0.93);
    vlogText.isTemplateItem = true;
    vlogText.indexInLayer =@"0";
    vlogText.text = @"Study With Me";
    vlogText.textView.text = @"Study With Me";
    [vlogText applyTypo:vlog];
    [self.texts addObject:vlogText];
    
    Text *epVlogText = [[Text alloc] init];
    VlogStudy *epvlog = [VlogStudy vlogStudy];
    epVlogText.scale = 0.65;
    epVlogText.center = CGPointMake(0.5, 0.07);
    epVlogText.isTemplateItem = true;
    epVlogText.indexInLayer =@"1";
    epVlogText.text = @"EP-1";
    epVlogText.textView.text = @"EP-1";
    [epVlogText applyTypo:epvlog];
    [self.texts addObject:epVlogText];
    
    Text *Vlog365Text = [[Text alloc] init];
    Vlog365 *vlog365 = [Vlog365 vlog365];
    Vlog365Text.scale = 0.8;
    Vlog365Text.center = CGPointMake(0.9, 0.05);
    Vlog365Text.isTemplateItem = true;
    Vlog365Text.indexInLayer =@"2";
    Vlog365Text.text = @"D-365";
    Vlog365Text.textView.text = @"D-365";
    [Vlog365Text applyTypo:vlog365];
    [self.texts addObject:Vlog365Text];
    
}

-(void)setUpStickers{
    
    VlogTapeSticker *upTapeSticker = [VlogTapeSticker vlogTapeSticker];
    upTapeSticker.indexInLayer =@"3";
    upTapeSticker.scale = 0.7;
    upTapeSticker.isTemplateItem = true;
    upTapeSticker.center = CGPointMake(0.21, 0.23);

    [self.stickers addObject:upTapeSticker];
    
    VlogTapeSticker *underTapeSticker = [VlogTapeSticker vlogTapeSticker];
    underTapeSticker.indexInLayer =@"4";
    underTapeSticker.scale = 0.7;
    underTapeSticker.isTemplateItem = true;
    underTapeSticker.center = CGPointMake(0.87, 0.9);

    [self.stickers addObject:underTapeSticker];
    
    
}



@end
