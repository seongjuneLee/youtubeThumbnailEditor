//
//  DailyVlogTemplate.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "DailyVlogTemplate.h"

@implementation DailyVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"dailyVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"dailyVlogTemplate";
        self.backgroundImageName = @"";
        
    }
    return self;
    
}

+(DailyVlogTemplate*)dailyVlogTemplate{
    
    DailyVlogTemplate* dailyVlogTemplate = [[self alloc] init];
    
    return dailyVlogTemplate;
    
}

-(void)setUpPhotoFrame{
    
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float screenHeight = screenWidth * 9/16;
    
    PhotoFrame *photoFrame1 = [[PhotoFrame alloc] init];
    photoFrame1.isTemplateItem = true;
    photoFrame1.isFixedPhotoFrame = true;
    photoFrame1.baseView.frameSize = CGSizeMake(screenWidth * 0.32, screenHeight * 0.4);
    photoFrame1.center = CGPointMake(0.16, 0.2);
    [self.photoFrames addObject:photoFrame1];
    
    
    PhotoFrame *photoFrame2 = [[PhotoFrame alloc] init];
    photoFrame2.isTemplateItem = true;
    photoFrame2.isFixedPhotoFrame = true;
    photoFrame2.baseView.frameSize = CGSizeMake(screenWidth * 0.68, screenHeight * 0.4);
    photoFrame2.center = CGPointMake(0.66, 0.2);
    [self.photoFrames addObject:photoFrame2];
    
    PhotoFrame *photoFrame3 = [[PhotoFrame alloc] init];
    photoFrame3.isTemplateItem = true;
    photoFrame3.isFixedPhotoFrame = true;
    photoFrame3.baseView.frameSize = CGSizeMake(screenWidth * 0.64, screenHeight * 0.6);
    photoFrame3.center = CGPointMake(0.32, 0.7);
    [self.photoFrames addObject:photoFrame3];
    
    PhotoFrame *photoFrame4 = [[PhotoFrame alloc] init];
    photoFrame4.isTemplateItem = true;
    photoFrame4.isFixedPhotoFrame = true;
    photoFrame4.baseView.frameSize = CGSizeMake(screenWidth * 0.36, screenHeight * 0.6);
    photoFrame4.center = CGPointMake(0.82, 0.7);
    [self.photoFrames addObject:photoFrame4];
    
}

-(void)setUpTexts{
    
    //MY DAILY VLOG
    Text *dailyText = [[Text alloc] init];
    VlogDailyTypo *typo = [VlogDailyTypo vlogDailyTypo];
    dailyText.scale = 1.25;
    dailyText.center = CGPointMake(0.5, 0.4);
    dailyText.isTemplateItem = true;
    dailyText.indexInLayer = @"0";
    dailyText.text = @"MY DAILY VLOG";
    dailyText.textView.text = dailyText.text;
    [dailyText applyTypo:typo];
    [self.texts addObject:dailyText];
    
}

-(void)setUpStickers{

}

@end
