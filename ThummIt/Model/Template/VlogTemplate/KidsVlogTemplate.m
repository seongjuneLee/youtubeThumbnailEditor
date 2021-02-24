//
//  KidsVlogTemplate.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/30.
//

#import "KidsVlogTemplate.h"

@implementation KidsVlogTemplate

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"kidsVlogPreview";
        self.category = NSLocalizedString(@"Vlog", nil);
        self.templateName = @"kidsVlogTemplate";
        
    }
    return self;
    
}

+(KidsVlogTemplate*)kidsVlogTemplate{
    
    KidsVlogTemplate* kidsVlogTemplate = [[self alloc] init];
    return kidsVlogTemplate;
    
}

-(void)setUpMainFrames{

    KidsVlogMainFrame *mainFrame = [KidsVlogMainFrame kidsVlogMainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
}

-(void)setUpPhotoFrame{
    
    PhotoFrame *smallPhotoFrame1 = [KidsTrapezoid1 kidsTrapezoid1];
    smallPhotoFrame1.isTemplateItem = true;
    smallPhotoFrame1.isFixedPhotoFrame = true;
    smallPhotoFrame1.indexInLayer = @"0";
    smallPhotoFrame1.center = CGPointMake(0.75, 0.25);
    [self.photoFrames addObject:smallPhotoFrame1];
    
    PhotoFrame *smallPhotoFrame2 = [KidsTrapezoid2 kidsTrapezoid2];
    smallPhotoFrame2.isTemplateItem = true;
    smallPhotoFrame2.isFixedPhotoFrame = true;
    smallPhotoFrame2.indexInLayer = @"1";
    smallPhotoFrame2.center = CGPointMake(0.8, 0.75);
    [self.photoFrames addObject:smallPhotoFrame2];
    
    PhotoFrame *bigPhotoFrame = [KidsTrapezoid3 kidsTrapezoid3];
    bigPhotoFrame.isTemplateItem = true;
    bigPhotoFrame.isFixedPhotoFrame = true;
    bigPhotoFrame.indexInLayer = @"2";
    bigPhotoFrame.center = CGPointMake(0.35, 0.5);
    [self.photoFrames addObject:bigPhotoFrame];
    
}

-(void)setUpTexts{
    
    //맘Vlog
    Text *momVlogText = [[Text alloc] init];
    VlogMomTypo *mom = [VlogMomTypo vlogMomTypo];
    momVlogText.scale = 0.222;
    momVlogText.center = CGPointMake(0.115, 0.74);
    momVlogText.isTemplateItem = true;
    momVlogText.indexInLayer = @"3";
    momVlogText.text = @"맘 Vlog";
    momVlogText.textView.text = momVlogText.text;
    momVlogText.typo = mom;
    [self.texts addObject:momVlogText];
    
    //육아 일상 브이로그
    Text *dailyText = [[Text alloc] init];
    VlogMomTypo *daily = [VlogMomTypo vlogMomTypo];
    daily.textColor = UIColor.whiteColor;
    dailyText.scale = 0.612;
    dailyText.center = CGPointMake(0.275, 0.88);
    dailyText.isTemplateItem = true;
    dailyText.indexInLayer = @"4";
    dailyText.text = @"육아 일상 브이로그";
    dailyText.textView.text = dailyText.text;
    dailyText.typo = daily;
    [self.texts addObject:dailyText];
    
}

-(void)setUpStickers{
    
}

@end
