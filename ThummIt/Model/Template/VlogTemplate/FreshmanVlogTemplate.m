//
//  FreshmanVlogTemplate.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/30.
//

#import "FreshmanVlogTemplate.h"

@implementation FreshmanVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"freshmanVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"FreshmanVlogTemplate";
        
    }
    return self;
    
}

+(FreshmanVlogTemplate*)freshmanVlogTemplate{
    
    FreshmanVlogTemplate* freshmanVlogTemplate = [[self alloc] init];
    
    return freshmanVlogTemplate;
    
}

-(void)setUpMainFrames{

    FreshManVlogMainFrame *mainFrame = [FreshManVlogMainFrame freshManVlogMainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
}

-(void)setUpPhotoFrame{
    
    FullRectangle *photoFrame = [FullRectangle fullRectangle];
    photoFrame.isTemplateItem = true;
    photoFrame.isFixedPhotoFrame = true;
    photoFrame.center = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:photoFrame];
        
}

-(void)setUpTexts{
    
    Text *firstVlogText = [[Text alloc] init];
    VlogFreshmanTypo *firstVlog = [VlogFreshmanTypo vlogFreshmanTypo];
    firstVlogText.scale = 0.27;
    firstVlogText.center = CGPointMake(0.83, 0.48);
    firstVlogText.isTemplateItem = true;
    firstVlogText.indexInLayer =@"0";
    firstVlogText.text = @"새내기의\n일주일\nvlog";
    firstVlogText.textView.text = @"새내기의\n일주일\nvlog";
    firstVlogText.textAlignment = NSTextAlignmentRight;
    firstVlogText.typo = firstVlog;
    [self.texts addObject:firstVlogText];
    
    Text *leftVlogText = [[Text alloc] init];
    VlogNewCampus *leftVlog = [VlogNewCampus vlogNewCampus];
    leftVlogText.scale = 0.12;
    leftVlogText.center = CGPointMake(0.065, 0.05);
    leftVlogText.isTemplateItem = true;
    leftVlogText.indexInLayer =@"3";
    leftVlogText.text = @"Thumm-log";
    leftVlogText.textView.text = @"Thumm-log";
    leftVlogText.typo = leftVlog;
    [self.texts addObject:leftVlogText];
    
}

-(void)setUpStickers{
    
    
    
}



@end
