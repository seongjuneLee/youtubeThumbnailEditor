//
//  BabyVlogTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "BabyVlogTemplate.h"

@implementation BabyVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"babyVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"BabyVlogTemplate";
        
    }
    return self;
    
}

+(BabyVlogTemplate*)babyVlogTemplate{
    
    BabyVlogTemplate* babyVlogTemplate = [[self alloc] init];
    
    return babyVlogTemplate;
    
}

-(void)setUpMainFrames{

    BabyVlogMainFrame *mainFrame = [BabyVlogMainFrame babyVlogMainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
}

-(void)setUpPhotoFrame{
    
    FullRectangle *photoFrame = [FullRectangle fullRectangle];
    photoFrame.isTemplateItem = true;
    photoFrame.isBasePhotoFrame = true;
    photoFrame.relativeCenter = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:photoFrame];
        
}

-(void)setUpTexts{
    
    Text *vlogText = [[Text alloc] init];
    VlogBrushTypo *vlog = [VlogBrushTypo vlogBrushTypo];
    vlogText.scale = 0.38;
    vlogText.relativeCenter = CGPointMake(0.5, 0.5);
    vlogText.isTemplateItem = true;
    vlogText.indexInLayer =@"0";
    vlogText.text = @"돌잔치 브이로그";
    vlogText.textView.text = @"돌잔치 브이로그";
    vlogText.typo = vlog;
    [self.texts addObject:vlogText];
    
}

-(void)setUpStickers{
    
    
    
}

@end
