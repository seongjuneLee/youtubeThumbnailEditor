//
//  WorkManTemplate3.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/28.
//

#import "WorkManTemplate3.h"

@implementation WorkManTemplate3

-(id)init{
    
    self = [super init];
    if(self){
        
        self.templateName = @"WorkManTemplate3";
        self.previewImageName = @"workManPreview3";
        self.category = NSLocalizedString(@"Entertain", nil);
        
    }
    return self;
    
}


+(WorkManTemplate3*)workManTemplate3{
    
    WorkManTemplate3* workManTemplate3 = [[self alloc] init];
    return workManTemplate3;
    
}

-(void)setUpMainFrames{
    
    WorkMan3MainFrame *mainFrame = [WorkMan3MainFrame workMan3MainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
}

-(void)setUpPhotoFrame{
    
    FullRectangle *photoFrame = [FullRectangle fullRectangle];
    photoFrame.isTemplateItem = true;
    photoFrame.isBasePhotoFrame = true;
    photoFrame.relativeCenter = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:photoFrame];
    
}

-(void)setUpTexts{
    
    Text *logoText = [[Text alloc] init];
    WorkManLogo2 *logo = [WorkManLogo2 workManLogo2];
    logoText.scale = 0.12;
    logoText.relativeCenter = CGPointMake(0.905, 0.1);
    logoText.isTemplateItem = true;
    logoText.indexInLayer = @"0";
    logoText.text = @"위크맨";
    logoText.textView.text = @"위크맨";
    logoText.typo = logo;
    [self.texts addObject:logoText];
    
    Text *tagText = [[Text alloc] init];
    WorkManLeftTag *tag = [WorkManLeftTag workManLeftTag];
    tagText.scale = 0.145;
    tagText.relativeCenter = CGPointMake(0.1, 0.13);
    tagText.isTemplateItem = true;
    tagText.indexInLayer = @"1";
    tagText.text = @"기업탐방";
    tagText.textView.text = @"기업탐방";
    tagText.typo = tag;
    [self.texts addObject:tagText];
    
    Text *howMuchText = [[Text alloc] init];
    WorkManFast*howMuch = [WorkManFast workManFast];
    howMuchText.scale = 0.58;
    howMuchText.rotationDegree = degreesToRadians(1);
    howMuchText.relativeCenter = CGPointMake(0.69, 0.20);
    howMuchText.isTemplateItem = true;
    howMuchText.indexInLayer = @"2";
    howMuchText.text = @"연봉 얼마까지 알아보고 오셨어요?";
    howMuchText.textView.text = @"연봉 얼마까지 알아보고 오셨어요?";
    howMuchText.typo = howMuch;
    [self.texts addObject:howMuchText];
    
    Text *youtubeText = [[Text alloc] init];
    WorkManYoutube* youtube = [WorkManYoutube workManYoutube];
    youtubeText.scale = 0.16;
    youtubeText.rotationDegree = degreesToRadians(1);
    youtubeText.relativeCenter = CGPointMake(0.28, 0.13);
    youtubeText.isTemplateItem = true;
    youtubeText.indexInLayer = @"3";
    youtubeText.text = @">> 유튜브";
    youtubeText.textView.text = @">> 유튜브";
    youtubeText.typo = youtube;
    [self.texts addObject:youtubeText];
    
  
    
    Text *blackText = [[Text alloc] init];
    WorkManLogo2 *center = [WorkManLogo2 workManLogo2];
    center.textColor = [UIColor colorWithRed:(0/255.0) green:(0/255.0) blue:(0/255.0) alpha:1];
    blackText.scale = 0.47;
    blackText.relativeCenter = CGPointMake(0.29,0.46);
    blackText.isTemplateItem = true;
    blackText.indexInLayer = @"4";
    blackText.text = @"유튜브 연봉 궁금해?";
    blackText.textView.text = @"유튜브 연봉 궁금해?";
    blackText.typo = center;
    [self.texts addObject:blackText];
    
    Text *letsGoText = [[Text alloc] init];
    WorkmanYelloewTitle *upTitle = [WorkmanYelloewTitle workmanYelloewTitle];
    letsGoText.scale = 0.19;
    letsGoText.relativeCenter = CGPointMake(0.128,0.73);
    letsGoText.isTemplateItem = true;
    letsGoText.indexInLayer = @"5";
    letsGoText.text = @"가자! ";
    letsGoText.textView.text = @"가자! ";
    letsGoText.typo = upTitle;
    
    Text *youtubeText2 = [[Text alloc] init];
    WorkmanYelloewTitle *yellow = [WorkmanYelloewTitle workmanYelloewTitle];
    yellow.textColor = [UIColor colorWithRed:(238/255.0) green:(230/255.0) blue:(50/255.0) alpha:1];
    youtubeText2.scale = 0.225;
    youtubeText2.relativeCenter = CGPointMake(0.328,0.73);
    youtubeText2.isTemplateItem = true;
    youtubeText2.indexInLayer = @"6";
    youtubeText2.text = @"유튜브";
    youtubeText2.textView.text = @"유튜브";
    youtubeText2.typo = yellow;

    Text *headquatersText = [[Text alloc] init];
    headquatersText.scale = 0.24;
    headquatersText.relativeCenter = CGPointMake(0.548,0.73);
    headquatersText.isTemplateItem = true;
    headquatersText.indexInLayer = @"7";
    headquatersText.text = @"본사로!";
    headquatersText.textView.text = @"본사로!";
    headquatersText.typo = upTitle;

    
    [self.texts addObject:youtubeText2];
    [self.texts addObject:letsGoText];
    [self.texts addObject:headquatersText];

    Text *blueYoutube = [[Text alloc] init];
    WorkManRedTitle *blueTypo = [WorkManRedTitle workManRedTitle];
    blueTypo.textColor = [UIColor colorWithRed:(20/255.0) green:(48/255.0) blue:(209/255.0) alpha:1] ;
    blueYoutube.scale = 0.21;
    blueYoutube.relativeCenter = CGPointMake(0.145,0.87);
    blueYoutube.isTemplateItem = true;
    blueYoutube.indexInLayer = @"8";
    blueYoutube.text = @"유튜브";
    blueYoutube.textView.text = @"유튜브";
    blueYoutube.typo = blueTypo;
    
    Text *visitingText = [[Text alloc] init];
    WorkManSecondTitle *secondTitle = [WorkManSecondTitle workManSecondTitle];
    visitingText.scale = 0.15;
    visitingText.relativeCenter = CGPointMake(0.32,0.87);
    visitingText.isTemplateItem = true;
    visitingText.indexInLayer = @"9";
    visitingText.text = @"탐방";
    visitingText.textView.text = @"탐방";
    visitingText.typo = secondTitle;

    [self.texts addObject:blueYoutube];
    [self.texts addObject:visitingText];

}

-(void)setUpStickers{
    
}

@end
