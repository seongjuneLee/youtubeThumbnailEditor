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
        self.backgroundImageName = @"workManFrame3";
        
    }
    return self;
    
}


+(WorkManTemplate3*)workManTemplate3{
    
    WorkManTemplate3* workManTemplate3 = [[self alloc] init];
    return workManTemplate3;
    
}

-(void)setUpPhotoFrame{
    
    FullRectangle *photoFrame = [FullRectangle fullRectangle];
    photoFrame.isTemplateItem = true;
    photoFrame.isFixedPhotoFrame = true;
    photoFrame.center = CGPointMake(0.5, 0.5);
    [self.photoFrames addObject:photoFrame];
    
}

-(void)setUpTexts{
    
    Text *logoText = [[Text alloc] init];
    WorkManLogo2 *logo = [WorkManLogo2 workManLogo2];
    logoText.scale = 0.68;
    logoText.center = CGPointMake(0.92, 0.12);
    logoText.isTemplateItem = true;
    logoText.indexInLayer = @"0";
    logoText.text = @"위크맨";
    logoText.textView.text = @"위크맨";
    [logoText applyTypo:logo];
    [self.texts addObject:logoText];
    
    Text *tagText = [[Text alloc] init];
    WorkManLeftTag *tag = [WorkManLeftTag workManLeftTag];
    tagText.scale = 1;
    tagText.center = CGPointMake(0.1, 0.13);
    tagText.isTemplateItem = true;
    tagText.indexInLayer = @"1";
    tagText.text = @"기업탐방";
    tagText.textView.text = @"기업탐방";
    [tagText applyTypo:tag];
    [self.texts addObject:tagText];
    
    Text *howMuchText = [[Text alloc] init];
    WorkManFast*howMuch = [WorkManFast workManFast];
    howMuchText.scale = 0.7;
    howMuchText.rotationDegree = 1;
    howMuchText.center = CGPointMake(0.69, 0.22);
    howMuchText.isTemplateItem = true;
    howMuchText.indexInLayer = @"2";
    howMuchText.text = @"연봉 얼마까지 알아보고 오셨어요?";
    howMuchText.textView.text = @"연봉 얼마까지 알아보고 오셨어요?";
    [howMuchText applyTypo:howMuch];
    [self.texts addObject:howMuchText];
    
    Text *youtubeText = [[Text alloc] init];
    WorkManYoutube* youtube = [WorkManYoutube workManYoutube];
    youtubeText.scale = 0.7;
    youtubeText.rotationDegree = 1;
    youtubeText.center = CGPointMake(0.3, 0.13);
    youtubeText.isTemplateItem = true;
    youtubeText.indexInLayer = @"3";
    youtubeText.text = @">> 유튜브";
    youtubeText.textView.text = @">> 유튜브";
    [youtubeText applyTypo:youtube];
    [self.texts addObject:youtubeText];
    
  
    
    Text *blackText = [[Text alloc] init];
    WorkManLogo2 *center = [WorkManLogo2 workManLogo2];
    blackText.scale = 0.78;
    blackText.center = CGPointMake(0.255,0.46);
    blackText.isTemplateItem = true;
    blackText.indexInLayer = @"4";
    blackText.text = @"유튜브 연봉 궁금해?";
    blackText.textView.text = @"유튜브 연봉 궁금해?";
    blackText.typo = center;
    
    WorkManLogo2 *black = [WorkManLogo2 workManLogo2];
    black.textColor = [UIColor colorWithRed:(0/255.0) green:(0/255.0) blue:(0/255.0) alpha:1] ;
    blackText.typoRangeArray = (NSMutableArray *)@[@[black,@"0-11"]];
    [self.texts addObject:blackText];
    
    Text *upTitleText = [[Text alloc] init];
    WorkmanYelloewTitle *upTitle = [WorkmanYelloewTitle workmanYelloewTitle];
    upTitleText.scale = 1.2;
    upTitleText.center = CGPointMake(0.355,0.73);
    upTitleText.isTemplateItem = true;
    upTitleText.indexInLayer = @"5";
    upTitleText.text = @"가자! 유튜브본사로!";
    upTitleText.textView.text = @"가자! 유튜브본사로!";
    upTitleText.typo = upTitle;
    
    WorkmanYelloewTitle *yellow = [WorkmanYelloewTitle workmanYelloewTitle];
    yellow.textColor = [UIColor colorWithRed:(238/255.0) green:(230/255.0) blue:(50/255.0) alpha:1] ;
    upTitleText.typoRangeArray = (NSMutableArray *)@[@[yellow,@"4-3"]];
    [self.texts addObject:upTitleText];
    
    Text *redtitle = [[Text alloc] init];
    WorkManSecondTitle *secondTitle = [WorkManSecondTitle workManSecondTitle];
    redtitle.scale = 0.83;
    redtitle.center = CGPointMake(0.22,0.87);
    redtitle.isTemplateItem = true;
    redtitle.indexInLayer = @"6";
    redtitle.text = @"유튜브 탐방";
    redtitle.textView.text = @"유튜브 탐방";
    redtitle.typo = secondTitle;
    
    WorkManRedTitle *red = [WorkManRedTitle workManRedTitle];
    red.textColor = [UIColor colorWithRed:(20/255.0) green:(48/255.0) blue:(209/255.0) alpha:1] ;
    redtitle.typoRangeArray = (NSMutableArray *)@[@[red,@"0-3"]];
    [self.texts addObject:redtitle];
    
}

-(void)setUpStickers{
    
}

@end
