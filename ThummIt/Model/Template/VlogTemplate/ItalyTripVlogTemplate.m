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
        self.mainFrameImageName = @"italyTripVlogFrame";
        
    }
    return self;
    
}

+(ItalyTripVlogTemplate*)italyTripVlogTemplate{
    
    ItalyTripVlogTemplate* italyTripVlogTemplate = [[self alloc] init];
    
    return italyTripVlogTemplate;
    
}

-(void)setUpMainFrames{

    ItalyTripVlogMainFrame *mainFrame = [ItalyTripVlogMainFrame italyTripVlogMainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
}

-(void)setUpPhotoFrame{
    
    FullRectangle *fullRectPhotoFrame = [FullRectangle fullRectangle];
    fullRectPhotoFrame.isTemplateItem = true;
    fullRectPhotoFrame.isFixedPhotoFrame = true;
    fullRectPhotoFrame.relativeCenter = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:fullRectPhotoFrame];
    
}

-(void)setUpTexts{
    
    //vlog_italy
    Text *italyText = [[Text alloc] init];
    VlogItaly *italy = [VlogItaly vlogItaly];
    italyText.scale = 0.09;
    italyText.relativeCenter = CGPointMake(0.3, 0.77);
    italyText.isTemplateItem = true;
    italyText.indexInLayer = @"0";
    italyText.text = @"vlog_italy";
    italyText.textView.text = italyText.text;
    italyText.typo = italy;
    [self.texts addObject:italyText];
    
    //in Italy
    Text *inItalyText = [[Text alloc] init];
    VlogInItaly *inItaly = [VlogInItaly vlogInItaly];
    inItalyText.scale = 0.48;
    inItalyText.relativeCenter = CGPointMake(0.77, 0.65);
    inItalyText.isTemplateItem = true;
    inItalyText.indexInLayer = @"1";
    inItalyText.text = @"in Italy";
    inItalyText.textView.text = inItalyText.text;
    inItalyText.typo = inItaly;
    [self.texts addObject:inItalyText];
    
    //Vlog
    Text *tripText = [[Text alloc] init];
    VlogBarunGothicTypo *barun = [VlogBarunGothicTypo vlogBarunGothicTypo];
    tripText.scale = 0.28;
    tripText.relativeCenter = CGPointMake(0.73, 0.37);
    tripText.isTemplateItem = true;
    tripText.indexInLayer = @"2";
    tripText.text = @"Vlog";
    tripText.textView.text = tripText.text;
    tripText.typo = barun;
    [self.texts addObject:tripText];
    
}

-(void)setUpStickers{

}

@end
