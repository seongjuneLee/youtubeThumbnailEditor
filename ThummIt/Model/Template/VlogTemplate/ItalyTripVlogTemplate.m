//
//  ItalyTripTemplate.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "ItalyTripVlogTemplate.h"

@implementation ItalyTripVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"italyTripPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"italyTripVlogTemplate";
        self.backgroundImageName = @"italyTripVlogFrame";
        
    }
    return self;
    
}

+(ItalyTripVlogTemplate*)italyTripVlogTemplate{
    
    ItalyTripVlogTemplate* italyTripVlogTemplate = [[self alloc] init];
    
    return italyTripVlogTemplate;
    
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
    
    //vlog_italy
    Text *italyText = [[Text alloc] init];
    VlogItaly *italy = [VlogItaly vlogItaly];
    italyText.scale = 0.33;
    italyText.center = CGPointMake(0.3, 0.77);
    italyText.isTemplateItem = true;
    italyText.text = @"vlog_italy";
    italyText.textView.text = italyText.text;
    [italyText applyTypo:italy];
    [self.texts addObject:italyText];
    
    //in Italy
    Text *inItalyText = [[Text alloc] init];
    VlogInItaly *inItaly = [VlogInItaly vlogInItaly];
    inItalyText.scale = 1.88;
    inItalyText.center = CGPointMake(0.77, 0.65);
    inItalyText.isTemplateItem = true;
    inItalyText.text = @"in Italy";
    inItalyText.textView.text = inItalyText.text;
    [inItalyText applyTypo:inItaly];
    [self.texts addObject:inItalyText];
    
    //Vlog
    Text *tripText = [[Text alloc] init];
    VlogBarunGothicTypo *barun = [VlogBarunGothicTypo vlogBarunGothicTypo];
    tripText.scale = 1.3;
    tripText.center = CGPointMake(0.73, 0.37);
    tripText.isTemplateItem = true;
    tripText.text = @"Vlog";
    tripText.textView.text = tripText.text;
    [tripText applyTypo:barun];
    [self.texts addObject:tripText];
    
}

-(void)setUpStickers{

}

@end
