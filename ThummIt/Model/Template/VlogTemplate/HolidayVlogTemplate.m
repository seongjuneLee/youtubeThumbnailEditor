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
        self.backgroundImageName = @"";
        
    }
    return self;
    
}

+(HolidayVlogTemplate*)holidayVlogTemplate{
    
    HolidayVlogTemplate* holidayVlogTemplate = [[self alloc] init];
    return holidayVlogTemplate;
    
}

-(void)setUpPhotoFrame{
    
    FullRectangle *fullRectPhotoFrame = [FullRectangle fullRectangle];
    fullRectPhotoFrame.isTemplateItem = true;
    fullRectPhotoFrame.isFixedPhotoFrame = true;
    fullRectPhotoFrame.center = CGPointMake(0.5, 0.5);
    fullRectPhotoFrame.baseView.backgroundColor = UIColor.lightGrayColor;
    [self.photoFrames addObject:fullRectPhotoFrame];
    
}

-(void)setUpTexts{
    
    //Vlog
    Text *holidayText = [[Text alloc] init];
    VlogHolidayTypo *holiday = [VlogHolidayTypo vlogHolidayTypo];
    holidayText.scale = 2.4;
    holidayText.center = CGPointMake(0.85, 0.8);
    holidayText.rotationDegree = 350;
    holidayText.isTemplateItem = true;
    holidayText.text = @"Vlog";
    holidayText.textView.text = holidayText.text;
    [holidayText applyTypo:holiday];
    [self.texts addObject:holidayText];
    
}

-(void)setUpStickers{

    VlogHeartSticker1 *vlogHeartSticker1 = [VlogHeartSticker1 vlogHeartSticker1];
    vlogHeartSticker1.scale = 0.5;
    vlogHeartSticker1.tintColor = UIColor.blackColor;
    vlogHeartSticker1.rotationDegree = degreesToRadians(0);
    vlogHeartSticker1.isTemplateItem = true;
    vlogHeartSticker1.center = CGPointMake(0.26, 0.2);
    [self.stickers addObject:vlogHeartSticker1];
    
}

@end
