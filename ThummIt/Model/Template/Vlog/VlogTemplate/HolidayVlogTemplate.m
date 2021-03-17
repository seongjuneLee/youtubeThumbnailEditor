//
//  HolidayVlogTemplate.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "HolidayVlogTemplate.h"

@implementation HolidayVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"holidayVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"holidayVlogTemplate";
        
    }
    return self;
    
}

+(HolidayVlogTemplate*)holidayVlogTemplate{
    
    HolidayVlogTemplate* holidayVlogTemplate = [[self alloc] init];
    return holidayVlogTemplate;
    
}

-(void)setUpMainFrames{

}

-(void)setUpPhotoFrame{
    
    FullRectangle *fullRectPhotoFrame = [FullRectangle fullRectangle];
    fullRectPhotoFrame.isTemplateItem = true;
    fullRectPhotoFrame.isBasePhotoFrame = true;
    fullRectPhotoFrame.relativeCenter = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:fullRectPhotoFrame];
    
}

-(void)setUpTexts{
    
    //Vlog
    Text *holidayText = [[Text alloc] init];
    VlogHolidayTypo *holiday = [VlogHolidayTypo vlogHolidayTypo];
    holidayText.scale = 0.23;
    holidayText.relativeCenter = CGPointMake(0.85, 0.8);
    holidayText.rotationDegree = degreesToRadians(-10);
    holidayText.isTemplateItem = true;
    holidayText.text = @"Vlog";
    holidayText.textView.text = holidayText.text;
    holidayText.indexInLayer = @"8";
    holidayText.typo = holiday;
    [self.texts addObject:holidayText];
    
}

-(void)setUpStickers{

    HeartSticker1 *vlogHeartSticker1 = [HeartSticker1 heartSticker1];
    vlogHeartSticker1.scale = 0.085;
    vlogHeartSticker1.tintColor = [UIColor colorWithRed:236/255.0 green:159/255.0 blue:158/255.0 alpha:1];
    vlogHeartSticker1.rotationDegree = degreesToRadians(-30);
    vlogHeartSticker1.isTemplateItem = true;
    vlogHeartSticker1.relativeCenter = CGPointMake(0.26, 0.43);
    vlogHeartSticker1.indexInLayer = @"0";
    [self.stickers addObject:vlogHeartSticker1];

    HeartSticker1 *vlogHeartSticker2 = [HeartSticker1 heartSticker1];
    vlogHeartSticker2.scale = 0.08;
    vlogHeartSticker2.tintColor = [UIColor colorWithRed:254/255.0 green:232/255.0 blue:228/255.0 alpha:1];
    vlogHeartSticker2.rotationDegree = degreesToRadians(-20);
    vlogHeartSticker2.isTemplateItem = true;
    vlogHeartSticker2.indexInLayer = @"1";
    vlogHeartSticker2.relativeCenter = CGPointMake(0.28, 0.4);
    [self.stickers addObject:vlogHeartSticker2];
    
    
    HeartSticker1 *vlogHeartSticker3 = [HeartSticker1 heartSticker1];
    vlogHeartSticker3.scale = 0.095;
    vlogHeartSticker3.tintColor = [UIColor colorWithRed:236/255.0 green:159/255.0 blue:158/255.0 alpha:1];
    vlogHeartSticker3.rotationDegree = degreesToRadians(-30);
    vlogHeartSticker3.isTemplateItem = true;
    vlogHeartSticker3.relativeCenter = CGPointMake(0.35, 0.25);
    vlogHeartSticker3.indexInLayer = @"2";
    [self.stickers addObject:vlogHeartSticker3];

    HeartSticker1 *vlogHeartSticker4 = [HeartSticker1 heartSticker1];
    vlogHeartSticker4.scale = 0.075;
    vlogHeartSticker4.tintColor = [UIColor colorWithRed:254/255.0 green:232/255.0 blue:228/255.0 alpha:1];
    vlogHeartSticker4.rotationDegree = degreesToRadians(-20);
    vlogHeartSticker4.isTemplateItem = true;
    vlogHeartSticker4.indexInLayer = @"3";
    vlogHeartSticker4.relativeCenter = CGPointMake(0.37, 0.23);
    [self.stickers addObject:vlogHeartSticker4];
    
    HeartSticker1 *vlogHeartSticker5 = [HeartSticker1 heartSticker1];
    vlogHeartSticker5.scale = 0.1;
    vlogHeartSticker5.tintColor = [UIColor colorWithRed:236/255.0 green:159/255.0 blue:158/255.0 alpha:1];
    vlogHeartSticker5.rotationDegree = degreesToRadians(10);
    vlogHeartSticker5.isTemplateItem = true;
    vlogHeartSticker5.relativeCenter = CGPointMake(0.7, 0.28);
    vlogHeartSticker5.indexInLayer = @"4";
    [self.stickers addObject:vlogHeartSticker5];

    HeartSticker1 *vlogHeartSticker6 = [HeartSticker1 heartSticker1];
    vlogHeartSticker6.scale = 0.08;
    vlogHeartSticker6.tintColor = [UIColor colorWithRed:254/255.0 green:232/255.0 blue:228/255.0 alpha:1];
    vlogHeartSticker6.isTemplateItem = true;
    vlogHeartSticker6.indexInLayer = @"5";
    vlogHeartSticker6.relativeCenter = CGPointMake(0.69, 0.28);
    [self.stickers addObject:vlogHeartSticker6];
    
    HeartSticker1 *vlogHeartSticker7 = [HeartSticker1 heartSticker1];
    vlogHeartSticker7.scale = 0.095;
    vlogHeartSticker7.tintColor = [UIColor colorWithRed:236/255.0 green:159/255.0 blue:158/255.0 alpha:1];
    vlogHeartSticker7.rotationDegree = degreesToRadians(30);
    vlogHeartSticker7.isTemplateItem = true;
    vlogHeartSticker7.relativeCenter = CGPointMake(0.78, 0.43);
    vlogHeartSticker7.indexInLayer = @"6";
    [self.stickers addObject:vlogHeartSticker7];

    HeartSticker1 *vlogHeartSticker8 = [HeartSticker1 heartSticker1];
    vlogHeartSticker8.scale = 0.08;
    vlogHeartSticker8.tintColor = [UIColor colorWithRed:254/255.0 green:232/255.0 blue:228/255.0 alpha:1];
    vlogHeartSticker8.rotationDegree = degreesToRadians(10);
    vlogHeartSticker8.isTemplateItem = true;
    vlogHeartSticker8.indexInLayer = @"7";
    vlogHeartSticker8.relativeCenter = CGPointMake(0.78, 0.44);
    [self.stickers addObject:vlogHeartSticker8];
    
}

@end
