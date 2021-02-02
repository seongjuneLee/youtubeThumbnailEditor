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
        self.backgroundImageName = @"kidsVlogFrame";
        
    }
    return self;
    
}

+(KidsVlogTemplate*)kidsVlogTemplate{
    
    KidsVlogTemplate* kidsVlogTemplate = [[self alloc] init];
    return kidsVlogTemplate;
    
}

-(void)setUpPhotoFrame{
    
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float screenHeight = screenWidth * 9/16;
    
    PhotoFrame *smallPhotoFrame1 = [[PhotoFrame alloc] init];
    smallPhotoFrame1.isTemplateItem = true;
    smallPhotoFrame1.isFixedPhotoFrame = true;
    smallPhotoFrame1.baseView.backgroundColor = UIColor.lightGrayColor;
    smallPhotoFrame1.baseView.frameSize = CGSizeMake(screenWidth * 0.5, screenHeight * 0.5);
    smallPhotoFrame1.center = CGPointMake(0.75, 0.25);
    [self.photoFrames addObject:smallPhotoFrame1];
    
    PhotoFrame *smallPhotoFrame2 = [[PhotoFrame alloc] init];
    smallPhotoFrame2.isTemplateItem = true;
    smallPhotoFrame2.isFixedPhotoFrame = true;
    smallPhotoFrame2.baseView.backgroundColor = UIColor.lightGrayColor;
    smallPhotoFrame2.baseView.frameSize = CGSizeMake(screenWidth * 0.4, screenHeight * 0.5);
    smallPhotoFrame2.center = CGPointMake(0.8, 0.75);
    [self.photoFrames addObject:smallPhotoFrame2];
    
    //사다리꼴 윗변 0.5 아랫변 0.68 로
    PhotoFrame *bigPhotoFrame = [[PhotoFrame alloc] init];
    bigPhotoFrame.isTemplateItem = true;
    bigPhotoFrame.isFixedPhotoFrame = true;
    bigPhotoFrame.baseView.backgroundColor = UIColor.grayColor;
    bigPhotoFrame.baseView.frameSize = CGSizeMake(screenWidth * 0.68, screenHeight);
    bigPhotoFrame.center = CGPointMake(0.34, 0.5);
    [self.photoFrames addObject:bigPhotoFrame];
    
}

-(void)setUpTexts{
    
    //맘Vlog
    Text *momVlogText = [[Text alloc] init];
    VlogMomTypo *mom = [VlogMomTypo vlogMomTypo];
    momVlogText.scale = 0.87;
    momVlogText.center = CGPointMake(0.115, 0.74);
    momVlogText.isTemplateItem = true;
    momVlogText.indexInLayer = @"0";
    momVlogText.text = @"맘 Vlog";
    momVlogText.textView.text = momVlogText.text;
    [momVlogText applyTypo:mom];
    [self.texts addObject:momVlogText];
    
    //육아 일상 브이로그
    Text *dailyText = [[Text alloc] init];
    VlogMomTypo *daily = [VlogMomTypo vlogMomTypo];
    daily.textColor = UIColor.whiteColor;
    dailyText.scale = 1;
    dailyText.center = CGPointMake(0.275, 0.88);
    dailyText.isTemplateItem = true;
    dailyText.indexInLayer = @"1";
    dailyText.text = @"육아 일상 브이로그";
    dailyText.textView.text = dailyText.text;
    [dailyText applyTypo:daily];
    [self.texts addObject:dailyText];
    
}

-(void)setUpStickers{
    
}

@end
