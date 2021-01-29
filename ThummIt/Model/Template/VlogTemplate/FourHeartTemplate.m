//
//  FourHeartTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "FourHeartTemplate.h"

@implementation FourHeartTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"FourHeartTemplate";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"FourHeartTemplate";
        self.backgroundImageName = @"FourHeartTemplate";
        [self setUpPhotoFrame];
        [self setUpTexts];
        
    }
    return self;
    
}

+(FourHeartTemplate*)fourHeartTemplate{
    
    FourHeartTemplate* fourHeartTemplate = [[self alloc] init];
    
    return fourHeartTemplate;
    
}

-(void)setUpPhotoFrame{
    
    self.photoFrames = [NSMutableArray new];
    FullRectangle *photoFrame = [FullRectangle fullRectangle];
    photoFrame.isTemplateItem = true;
    photoFrame.center = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:photoFrame];
        
}

-(void)setUpTexts{
    
    Text *vlogText = [[Text alloc] init];
    AtmosphereTypo *vlog = [AtmosphereTypo atmosphereTypo];
    vlogText.scale = 0.61;
    vlogText.rotationDegree = -10;
    vlogText.center = CGPointMake(0.9, 0.9);
    vlogText.isTemplateItem = true;
    vlogText.text = @"Vlog";
    vlogText.textView.text = @"Vlog";
    [vlogText applyTypo:vlog];
    [self.texts addObject:vlogText];
    
}

-(void)setUpStickers{
    
    self.stickers = [NSMutableArray new];
    VlogHeartSticker1 *heart = [VlogHeartSticker1 vlogHeartSticker1];
    heart.scale = 0.40;
    heart.rotationDegree = -5;
    heart.isTemplateItem = true;
    heart.center = CGPointMake(0.79, 0.365);
    
    [self.stickers addObject:heart];
    
}


@end
