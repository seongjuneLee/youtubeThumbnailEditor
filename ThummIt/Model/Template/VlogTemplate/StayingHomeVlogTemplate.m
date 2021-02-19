//
//  StayingHomeTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "StayingHomeVlogTemplate.h"

@implementation StayingHomeVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"stayingHomePreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"StayingHomeTemplate";
        self.mainFrameImageName = @"";
        
    }
    return self;
    
}

+(StayingHomeVlogTemplate*)stayingHomeVlogTemplate{
    
    StayingHomeVlogTemplate* stayingHomeVlogTemplate = [[self alloc] init];
    return stayingHomeVlogTemplate;
    
}

-(void)setUpPhotoFrame{
    
    VerticalHalfRectangle *firstPhotoFrame = [VerticalHalfRectangle verticalHalfRectangle];
    QuarterRectangle *secondPhotoFrame = [QuarterRectangle quarterRectangle];
    QuarterRectangle *thirdPhotoFrame = [QuarterRectangle quarterRectangle];
    firstPhotoFrame.isTemplateItem = true;
    secondPhotoFrame.isTemplateItem = true;
    thirdPhotoFrame.isTemplateItem = true;
    firstPhotoFrame.isFixedPhotoFrame = true;
    secondPhotoFrame.isFixedPhotoFrame = true;
    thirdPhotoFrame.isFixedPhotoFrame = true;
    firstPhotoFrame.center = CGPointMake(0.25, 0.5);
    secondPhotoFrame.center = CGPointMake(0.75, 0.25);
    thirdPhotoFrame.center = CGPointMake(0.75, 0.75);
    [self.photoFrames addObject:firstPhotoFrame];
    [self.photoFrames addObject:secondPhotoFrame];
    [self.photoFrames addObject:thirdPhotoFrame];
        
}

-(void)setUpTexts{
    
    Text *stayText = [[Text alloc] init];
    VlogHashTagTypo *stay = [VlogHashTagTypo vlogHashTagTypo];
    stayText.scale = 0.24;
    stayText.center = CGPointMake(0.155, 0.78);
    stayText.isTemplateItem = true;
    stayText.indexInLayer =@"0";
    stayText.text = @"#Staying Home";
    stayText.textView.text = @"#Staying Home";
    stayText.typo = stay;
    [self.texts addObject:stayText];
    
    Text *understayText = [[Text alloc] init];
    VlogBMDohyunTypo *underStay = [VlogBMDohyunTypo vlogBMDohyunTypo];
    understayText.scale = 0.38;
    understayText.center = CGPointMake(0.2, 0.9);
    understayText.isTemplateItem = true;
    understayText.indexInLayer =@"1";
    understayText.text = @"집콕 브이로그";
    understayText.textView.text = @"집콕 브이로그";
    understayText.typo = underStay;
    [self.texts addObject:understayText];
    
}

-(void)setUpStickers{
    
}

@end
