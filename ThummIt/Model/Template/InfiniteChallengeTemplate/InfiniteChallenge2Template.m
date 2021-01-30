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
        self.backgroundImageName = @"infiniteChallengeFrame2";
        
    }
    return self;
    
}

+(InfiniteChallenge2Template*)infiniteChallenge2Template{
    
    InfiniteChallenge2Template* infiniteChallenge2Template = [[self alloc] init];
    
    return infiniteChallenge2Template;
    
}

-(void)setUpPhotoFrame{
    
    PhotoFrame *photoFrame1 = [[PhotoFrame alloc] init];
    photoFrame1.isTemplateItem = true;
    photoFrame1.isFixedPhotoFrame = true;
    float screenWidth = UIScreen.mainScreen.bounds.size.width;
    float frameWidth = screenWidth * 0.6;
    photoFrame1.baseView.backgroundColor = UIColor.grayColor;
    photoFrame1.baseView.frameSize = CGSizeMake(frameWidth, screenWidth * 9/16);
    photoFrame1.center = CGPointMake(0.3, 0.5);
    [self.photoFrames addObject:photoFrame1];
    
    
    PhotoFrame *photoFrame2 = [[PhotoFrame alloc] init];
    photoFrame2.isTemplateItem = true;
    photoFrame2.isFixedPhotoFrame = true;
    float frameWidth2 = screenWidth * 0.4;
    photoFrame2.baseView.backgroundColor = UIColor.lightGrayColor;
    photoFrame2.baseView.frameSize = CGSizeMake(frameWidth2, screenWidth * 9/16);
    photoFrame2.center = CGPointMake(0.8, 0.5);
    [self.photoFrames addObject:photoFrame2];
    
}

-(void)setUpTexts{
        
    //메인 텍스트
    Text *mainTextTop = [[Text alloc] init];
    InfiniteChallengeLegeno *legeno = [InfiniteChallengeLegeno infiniteChallengeLegeno];
    mainTextTop.scale = 0.78;
    mainTextTop.center = CGPointMake(0.36, 0.73);
    mainTextTop.isTemplateItem = true;
    mainTextTop.text = @"레전드 오브 레게노";
    mainTextTop.textView.text = @"레전드 오브 레게노";
    [mainTextTop applyTypo:legeno];
    [self.texts addObject:mainTextTop];
    
    Text *mainTextBottom = [[Text alloc] init];
    InfiniteChallengeLegeno *longJourney = [InfiniteChallengeLegeno infiniteChallengeLegeno];
    longJourney.textColor = [UIColor colorWithRed:254/255.0 green:208/255.0 blue:254/255.0 alpha:1];
    mainTextBottom.scale = 0.78;
    mainTextBottom.center = CGPointMake(0.32, 0.9);
    mainTextBottom.isTemplateItem = true;
    mainTextBottom.text = @"그 대장정의 시작";
    mainTextBottom.textView.text = @"그 대장정의 시작";
    [mainTextBottom applyTypo:longJourney];
    [self.texts addObject:mainTextBottom];
    
    //로고
    Text *logoText = [[Text alloc] init];
    InfiniteChallengeLogo *logo = [InfiniteChallengeLogo infiniteChallengeLogo];
    logoText.scale = 0.6;
    logoText.center = CGPointMake(0.89, 0.15);
    logoText.isTemplateItem = true;
    logoText.text = @"백만도전";
    logoText.textView.text = @"백만도전";
    [logoText applyTypo:logo];
    [self.texts addObject:logoText];

    //오분순삭
    Text *fiveMinutesText = [[Text alloc] init];
    InfiniteChallengeFiveMinutes *fiveMinutes = [InfiniteChallengeFiveMinutes infiniteChallengeFiveMinutes];
    fiveMinutesText.scale = 0.65;
    fiveMinutesText.center = CGPointMake(0.15, 0.11);
    fiveMinutesText.isTemplateItem = true;
    fiveMinutesText.text = @"오분순삭";
    fiveMinutesText.textView.text = @"오분순삭";
    [fiveMinutesText applyTypo:fiveMinutes];
    [self.texts addObject:fiveMinutesText];
    
    //#예능레전드
    Text *hashTagText = [[Text alloc] init];
    InfiniteChallengeHashTag *hashTag = [InfiniteChallengeHashTag infiniteChallengeHashTag];
    hashTagText.scale = 0.56;
    hashTagText.center = CGPointMake(0.13, 0.19);
    hashTagText.isTemplateItem = true;
    hashTagText.text = @"#예능레전드";
    hashTagText.textView.text = @"#예능레전드";
    
    InfiniteChallengeHashTag *hashTagYellow = [InfiniteChallengeHashTag infiniteChallengeHashTag];
    hashTagYellow.textColor = [UIColor colorWithRed:254/255.0 green:216/255.0 blue:60/255.0 alpha:1];
    hashTagText.typoRangeArray = (NSMutableArray *)@[@[hashTagYellow,@"1-2"]];
    
    [hashTagText applyTypo:hashTag];
    [self.texts addObject:hashTagText];
    
    //무야~호~
    Text *muYaHoText = [[Text alloc] init];
    InfiniteChallengeYellowSpeechBoxWhite *yellowSpeechBoxWhite = [InfiniteChallengeYellowSpeechBoxWhite infiniteChallengeYellowSpeechBoxWhite];
    muYaHoText.scale = 0.55;
    muYaHoText.center = CGPointMake(0.3, 0.45);
    muYaHoText.isTemplateItem = true;
    muYaHoText.text = @"무야~호~";
    muYaHoText.textView.text = @"무야~호~";
    muYaHoText.rotationDegree = 30;
    [muYaHoText applyTypo:yellowSpeechBoxWhite];
    [self.texts addObject:muYaHoText];
    
    //??
    Text *questionMarkText = [[Text alloc] init];
    InfiniteChallengeTopOfYellow *topOfYellow = [InfiniteChallengeTopOfYellow infiniteChallengeTopOfYellow];
    questionMarkText.scale = 0.63;
    questionMarkText.center = CGPointMake(0.33, 0.35);
    questionMarkText.isTemplateItem = true;
    questionMarkText.text = @"??";
    questionMarkText.textView.text = @"??";
    questionMarkText.rotationDegree = 30;
    [questionMarkText applyTypo:topOfYellow];
    [self.texts addObject:questionMarkText];
    
}

@end
