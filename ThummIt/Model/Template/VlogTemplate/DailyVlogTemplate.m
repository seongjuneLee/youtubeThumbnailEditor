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
        
    }
    return self;
    
}

+(DailyVlogTemplate*)dailyVlogTemplate{
    
    DailyVlogTemplate* dailyVlogTemplate = [[self alloc] init];
    
    return dailyVlogTemplate;
    
}

-(void)setUpMainFrames{

}

-(void)setUpPhotoFrame{
    
    
    PhotoFrame *photoFrame1 = [DailyVlogTemplateRectangle1 dailyVlogTemplateRectangle1];
    photoFrame1.isTemplateItem = true;
    photoFrame1.isFixedPhotoFrame = true;
    photoFrame1.center = CGPointMake(0.16, 0.2);
    [self.photoFrames addObject:photoFrame1];
    
    
    PhotoFrame *photoFrame2 = [DailyVlogTemplateRectangle2 dailyVlogTemplateRectangle2];
    photoFrame2.isTemplateItem = true;
    photoFrame2.isFixedPhotoFrame = true;
    photoFrame2.center = CGPointMake(0.66, 0.2);
    [self.photoFrames addObject:photoFrame2];
    
    PhotoFrame *photoFrame3 = [DailyVlogTemplateRectangle3 dailyVlogTemplateRectangle3];
    photoFrame3.isTemplateItem = true;
    photoFrame3.isFixedPhotoFrame = true;
    photoFrame3.center = CGPointMake(0.32, 0.7);
    [self.photoFrames addObject:photoFrame3];
    
    PhotoFrame *photoFrame4 = [DailyVlogTemplateRectangle4 dailyVlogTemplateRectangle4];
    photoFrame4.isTemplateItem = true;
    photoFrame4.isFixedPhotoFrame = true;
    photoFrame4.center = CGPointMake(0.82, 0.7);
    [self.photoFrames addObject:photoFrame4];
    
}

-(void)setUpTexts{
    
    //MY DAILY VLOG
    Text *dailyText = [[Text alloc] init];
    VlogDailyTypo *typo = [VlogDailyTypo vlogDailyTypo];
    dailyText.scale = 0.65;
    dailyText.center = CGPointMake(0.5, 0.4);
    dailyText.isTemplateItem = true;
    dailyText.indexInLayer = @"0";
    dailyText.text = @"MY DAILY VLOG";
    dailyText.textView.text = dailyText.text;
    dailyText.typo = typo;
    [self.texts addObject:dailyText];
    
}

-(void)setUpStickers{

}

@end
