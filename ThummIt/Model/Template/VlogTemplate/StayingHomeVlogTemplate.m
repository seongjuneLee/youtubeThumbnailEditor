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
        self.backgroundImageName = @"";
        [self setUpPhotoFrame];
        [self setUpTexts];
        
    }
    return self;
    
}

+(StayingHomeVlogTemplate*)stayingHomeVlogTemplate{
    
    StayingHomeVlogTemplate* stayingHomeVlogTemplate = [[self alloc] init];
    
    return stayingHomeVlogTemplate;
    
}

-(void)setUpPhotoFrame{
    
    
    self.photoFrames = [NSMutableArray new];
    VerticalHalfRectangle *firstPhotoFrame = [VerticalHalfRectangle verticalHalfRectangle];
    QuarterRectangle *secondPhotoFrame = [QuarterRectangle quarterRectangle];
    QuarterRectangle *thirdPhotoFrame = [QuarterRectangle quarterRectangle];
    firstPhotoFrame.indexInLayer =@"0";
    secondPhotoFrame.indexInLayer =@"1";
    thirdPhotoFrame.indexInLayer =@"2";
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
    stayText.scale = 0.65;
    stayText.center = CGPointMake(0.18, 0.75);
    stayText.isTemplateItem = true;
    stayText.indexInLayer =@"3";
    stayText.text = @"#Staying Home";
    stayText.textView.text = @"#Staying Home";
    [stayText applyTypo:stay];
    [self.texts addObject:stayText];
    
    Text *understayText = [[Text alloc] init];
    VlogBMDohyunTypo *underStay = [VlogBMDohyunTypo vlogBMDohyunTypo];
    understayText.scale = 0.9;
    understayText.center = CGPointMake(0.22, 0.88);
    understayText.isTemplateItem = true;
    understayText.indexInLayer =@"4";
    understayText.text = @"집콕 브이로그";
    understayText.textView.text = @"집콕 브이로그";
    [understayText applyTypo:underStay];
    [self.texts addObject:understayText];
    
}

-(void)setUpStickers{
    
    
    
}

@end
