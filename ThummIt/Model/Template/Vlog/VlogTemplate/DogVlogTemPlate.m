//
//  DogVlogTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/14.
//

#import "DogVlogTemplate.h"

@implementation DogVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"dogVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"DogVlogTemplate";
        
    }
    return self;
    
}
 
+(DogVlogTemplate*)dogVlogTemPlate{
    
    DogVlogTemplate* dogVlogTemPlate = [[self alloc] init];
    
    return dogVlogTemPlate;
    
}

-(void)setUpMainFrames{

    DogVlogMainFrame *mainFrame = [DogVlogMainFrame dogVlogMainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
}

-(void)setUpPhotoFrame{
    
    QuarterRectangle *firstPhotoFrame = [QuarterRectangle quarterRectangle];
    QuarterRectangle *secondPhotoFrame = [QuarterRectangle quarterRectangle];
    firstPhotoFrame.isTemplateItem = true;
    secondPhotoFrame.isTemplateItem = true;
    firstPhotoFrame.isBasePhotoFrame = true;
    secondPhotoFrame.isBasePhotoFrame = true;
   
    firstPhotoFrame.relativeCenter = CGPointMake(0.25, 0.25);
    secondPhotoFrame.relativeCenter = CGPointMake(0.75, 0.25);
    [self.photoFrames addObject:firstPhotoFrame];
    [self.photoFrames addObject:secondPhotoFrame];

    PhotoFrame *photoFrame1 = [HorizontalHalfRectangle horizontalHalfRectangle];
    photoFrame1.isTemplateItem = true;
    photoFrame1.isBasePhotoFrame = true;
    photoFrame1.relativeCenter = CGPointMake(0.5, 0.75);
    [self.photoFrames addObject:photoFrame1];
}

-(void)setUpTexts{
    
    Text *vlogText = [[Text alloc] init];
    VlogDog *vlog = [VlogDog vlogDog];
    vlogText.scale = 0.23;
    vlogText.relativeCenter = CGPointMake(0.5, 0.5);
    vlogText.isTemplateItem = true;
    vlogText.indexInLayer =@"0";
    vlogText.text = @"vlog";
    vlogText.textView.text = @"vlog";
    vlogText.typo = vlog;
    [self.texts addObject:vlogText];
    
}

-(void)setUpStickers{
    
}
@end
