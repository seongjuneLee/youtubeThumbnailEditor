//
//  InfiniteChallenge2Template.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/29.
//

#import "InfiniteChallenge2Template.h"

@implementation InfiniteChallenge2Template

-(id)init{
    
    self = [super init];
    if(self){
        
        self.previewImageName = @"infiniteChallengePreview2";
        self.category = NSLocalizedString(@"Entertainment", nil);
        self.templateName = @"infiniteChallenge2Template";
        
    }
    return self;
    
}

+(InfiniteChallenge2Template*)infiniteChallenge2Template{
    
    InfiniteChallenge2Template* infiniteChallenge2Template = [[self alloc] init];
    return infiniteChallenge2Template;
    
}

-(void)setUpMainFrames{
    
    InfiniteChallenge2MainFrame *mainFrame = [InfiniteChallenge2MainFrame infiniteChallenge2MainFrame];
    mainFrame.isTemplateItem = true;
    self.mainFrameImageName = mainFrame.backgroundImageName;
}

-(void)setUpPhotoFrame{
    
    PhotoFrame *photoFrame1 = [InfiniteTemplateRectangle1 infiniteTemplateRectangle1];
    photoFrame1.isTemplateItem = true;
    photoFrame1.isBasePhotoFrame = true;
    photoFrame1.relativeCenter = CGPointMake(0.3, 0.5);
    [self.photoFrames addObject:photoFrame1];
    
    PhotoFrame *photoFrame2 = [InfiniteTemplateRectangle2 infiniteTemplateRectangle2];
    photoFrame2.isTemplateItem = true;
    photoFrame2.isBasePhotoFrame = true;
    photoFrame2.relativeCenter = CGPointMake(0.8, 0.5);
    [self.photoFrames addObject:photoFrame2];
  
}

-(void)setUpTexts{
        
    //메인 텍스트
    Text *mainTextTop = [[Text alloc] init];
    InfiniteChallengeLegeno *legeno = [InfiniteChallengeLegeno infiniteChallengeLegeno];
    mainTextTop.scale = 0.7;
    mainTextTop.relativeCenter = CGPointMake(0.36, 0.73);
    mainTextTop.isTemplateItem = true;
    mainTextTop.indexInLayer =@"0";
    mainTextTop.text = @"레전드 오브 레게노";
    mainTextTop.textView.text = mainTextTop.text;
    mainTextTop.typo = legeno;
    [self.texts addObject:mainTextTop];
    
    Text *mainTextBottom = [[Text alloc] init];
    InfiniteChallengeLegeno *longJourney = [InfiniteChallengeLegeno infiniteChallengeLegeno];
    longJourney.textColor = [UIColor colorWithRed:254/255.0 green:208/255.0 blue:254/255.0 alpha:1];
    mainTextBottom.scale = 0.62;
    mainTextBottom.relativeCenter = CGPointMake(0.32, 0.9);
    mainTextBottom.isTemplateItem = true;
    mainTextBottom.indexInLayer =@"1";
    mainTextBottom.text = @"그 대장정의 시작";
    mainTextBottom.textView.text = mainTextBottom.text;
    mainTextBottom.typo = longJourney;
    [self.texts addObject:mainTextBottom];
    
    //로고
    Text *logoText = [[Text alloc] init];
    InfiniteChallengeLogo *logo = [InfiniteChallengeLogo infiniteChallengeLogo];
    logoText.scale = 0.1;
    logoText.relativeCenter = CGPointMake(0.885, 0.14);
    logoText.isTemplateItem = true;
    logoText.indexInLayer =@"2";
    logoText.text = @"백만도전";
    logoText.textView.text = logoText.text;
    logoText.typo = logo;
    [self.texts addObject:logoText];

    //오분순삭
    Text *fiveMinutesText = [[Text alloc] init];
    InfiniteChallengeFiveMinutes *fiveMinutes = [InfiniteChallengeFiveMinutes infiniteChallengeFiveMinutes];
    fiveMinutesText.scale = 0.24;
    fiveMinutesText.relativeCenter = CGPointMake(0.15, 0.11);
    fiveMinutesText.isTemplateItem = true;
    fiveMinutesText.indexInLayer =@"3";
    fiveMinutesText.text = @"오분순삭";
    fiveMinutesText.textView.text = fiveMinutesText.text;
    fiveMinutesText.typo = fiveMinutes;
    [self.texts addObject:fiveMinutesText];
    
    //#예능레전드
    Text *hashtagText = [[Text alloc] init];
    InfiniteChallengeHashTag *legend = [InfiniteChallengeHashTag infiniteChallengeHashTag];
    hashtagText.scale = 0.03;
    hashtagText.relativeCenter = CGPointMake(0.06, 0.195);
    hashtagText.isTemplateItem = true;
    hashtagText.indexInLayer =@"4";
    hashtagText.text = @"#";
    hashtagText.textView.text = @"#";
    hashtagText.typo = legend;
    
    Text *entertainText = [[Text alloc] init];
    InfiniteChallengeHashTag *hashTagYellow = [InfiniteChallengeHashTag infiniteChallengeHashTag];
    hashTagYellow.textColor = [UIColor colorWithRed:254/255.0 green:216/255.0 blue:60/255.0 alpha:1];
    entertainText.scale = 0.065;
    entertainText.relativeCenter = CGPointMake(0.1, 0.195);
    entertainText.isTemplateItem = true;
    entertainText.indexInLayer =@"5";
    entertainText.text = @"예능";
    entertainText.textView.text = @"예능";
    entertainText.typo = hashTagYellow;


    Text *legendText = [[Text alloc] init];
    InfiniteChallengeHashTag *hashTag = [InfiniteChallengeHashTag infiniteChallengeHashTag];
    legendText.scale = 0.09;
    legendText.relativeCenter = CGPointMake(0.17, 0.195);
    legendText.isTemplateItem = true;
    legendText.indexInLayer =@"6";
    legendText.text = @"레전드";
    legendText.textView.text = @"레전드";
    legendText.typo = hashTag;
    
    [self.texts addObject:entertainText];
    [self.texts addObject:legendText];
    [self.texts addObject:hashtagText];

    //무야~호~
    Text *muYaHoText = [[Text alloc] init];
    InfiniteChallengeYellowSpeechBoxWhite *yellowSpeechBoxWhite = [InfiniteChallengeYellowSpeechBoxWhite infiniteChallengeYellowSpeechBoxWhite];
    muYaHoText.scale = 0.15;
    muYaHoText.relativeCenter = CGPointMake(0.3, 0.45);
    muYaHoText.isTemplateItem = true;
    muYaHoText.indexInLayer =@"7";
    muYaHoText.text = @"무야~호~";
    muYaHoText.textView.text = muYaHoText.text;
    muYaHoText.rotationDegree = degreesToRadians(30);
    muYaHoText.typo = yellowSpeechBoxWhite;
    [self.texts addObject:muYaHoText];
    
    //??
    Text *questionMarkText = [[Text alloc] init];
    InfiniteChallengeTopOfYellow *topOfYellow = [InfiniteChallengeTopOfYellow infiniteChallengeTopOfYellow];
    questionMarkText.scale = 0.1;
    questionMarkText.relativeCenter = CGPointMake(0.33, 0.35);
    questionMarkText.isTemplateItem = true;
    questionMarkText.indexInLayer =@"8";
    questionMarkText.text = @"??";
    questionMarkText.textView.text = questionMarkText.text;
    questionMarkText.rotationDegree = degreesToRadians(30);
    questionMarkText.typo = topOfYellow;
    [self.texts addObject:questionMarkText];
    
}

@end
