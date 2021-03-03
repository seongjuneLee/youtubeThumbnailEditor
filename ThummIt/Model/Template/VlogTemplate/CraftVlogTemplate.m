//
//  CraftVlog.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "CraftVlogTemplate.h"

@implementation CraftVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"craftVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"craftVlogTemplate";
        
    }
    return self;
    
}

+(CraftVlogTemplate*)craftVlogTemplate{
    
    CraftVlogTemplate* craftVlogTemplate = [[self alloc] init];
    return craftVlogTemplate;
    
}

-(void)setUpMainFrames{

    CraftVlogMainFrame *mainFrame = [CraftVlogMainFrame craftVlogMainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
}

-(void)setUpPhotoFrame{
    
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
    
    Text *vlogText = [[Text alloc] init];
    VlogNanumSquareTypo *vlog = [VlogNanumSquareTypo vlogNanumSquareTypo];
    vlogText.scale = 0.26;
    vlogText.relativeCenter = CGPointMake(0.5, 0.5);
    vlogText.isTemplateItem = true;
    vlogText.indexInLayer = @"0";
    vlogText.text = @"VLOG";
    vlogText.textView.text = vlogText.text;
    vlogText.typo = vlog;
    [self.texts addObject:vlogText];
    
}

-(void)setUpStickers{
    
}

@end
