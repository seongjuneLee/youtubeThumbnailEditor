//
//  DogVlogTemPlate.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "DogVlogTemPlate.h"

@implementation DogVlogTemPlate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"dogVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"DogVlogTemPlate";
        self.backgroundImageName = @"dogVlogFrame";
        
    }
    return self;
    
}

+(DogVlogTemPlate*)dogVlogTemPlate{
    
    DogVlogTemPlate* dogVlogTemPlate = [[self alloc] init];
    
    return dogVlogTemPlate;
    
}

-(void)setUpPhotoFrame{
    
    QuarterRectangle *firstPhotoFrame = [QuarterRectangle quarterRectangle];
    QuarterRectangle *secondPhotoFrame = [QuarterRectangle quarterRectangle];

    firstPhotoFrame.isTemplateItem = true;
    secondPhotoFrame.isTemplateItem = true;
    firstPhotoFrame.isFixedPhotoFrame = true;
    secondPhotoFrame.isFixedPhotoFrame = true;
    firstPhotoFrame.center = CGPointMake(0.25, 0.25);
    secondPhotoFrame.center = CGPointMake(0.75, 0.25);
    [self.photoFrames addObject:firstPhotoFrame];
    [self.photoFrames addObject:secondPhotoFrame];

    PhotoFrame *photoFrame1 = [[PhotoFrame alloc] init];
    photoFrame1.isTemplateItem = true;
    photoFrame1.isFixedPhotoFrame = true;
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float screenHeight = screenWidth * 9/16;
    photoFrame1.baseView.backgroundColor = UIColor.grayColor;
    photoFrame1.baseView.frameSize = CGSizeMake(screenWidth, screenHeight * 0.5);
    photoFrame1.center = CGPointMake(0.5, 0.75);
    [self.photoFrames addObject:photoFrame1];
    
}

-(void)setUpTexts{
    
    Text *vlogText = [[Text alloc] init];
    VlogDog *vlog = [VlogDog vlogDog];
    vlogText.scale = 1.2;
    vlogText.center = CGPointMake(0.5, 0.5);
    vlogText.isTemplateItem = true;
    vlogText.indexInLayer =@"3";
    vlogText.text = @"vlog";
    vlogText.textView.text = @"vlog";
    [vlogText applyTypo:vlog];
    [self.texts addObject:vlogText];
    
}

-(void)setUpStickers{
    
}

@end
