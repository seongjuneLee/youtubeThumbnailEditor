//
//  ItemManager.m
//  ThummIt
//
//  Created by 이성준 on 2020/12/29.
//

#import "ItemManager.h"
#import "SaveManager.h"
#import "PhotoFrameHeader.h"
#import "StickerHeader.h"

@implementation ItemManager

+ (ItemManager *)sharedInstance {
    static ItemManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ItemManager alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - 포토 프레임

-(NSArray *)photoFrameCategories{
    
    // 여기 카테고리의 순서와 아래 아이템 데이타에서 해당 카테고리 아이템 어레이의 순서를 맞춰주어야 함.
    NSString *circle = NSLocalizedString(@"circle", nil);
    NSArray *categories = @[circle];
    
    return categories;
}

-(NSArray *)photoFrameDatas{
    
    BasicCirclePhotoFrame *basicCircle = [BasicCirclePhotoFrame basicCirclePhotoFrame];
    ChristmasCircle *christmasCircle = [ChristmasCircle christmasCircle];
    
    NSArray *photoFrames = @[basicCircle, christmasCircle];
    return @[photoFrames];
}

#pragma mark - 텍스트

-(NSArray *)typoCategories{
    
    NSString *circle = NSLocalizedString(@"circle", nil);
    NSArray *categories = @[circle];
    
    return categories;
}


-(NSArray *)typoDatas{
    
    NormalTypo *normal = [NormalTypo normalTypo];
    TrapezoidTypo *trapezoidTypo = [TrapezoidTypo trapezoidTypo];
    RunningManLogoTypo *runningManLogoTypo = [RunningManLogoTypo runningManLogoTypo];
    SeoYuGiLogoTypo *seoYuGiLogoTypo = [SeoYuGiLogoTypo seoYuGiLogoTypo];
    SeoYuGiGagwanTypo *seoYuGiGagwanTypo = [SeoYuGiGagwanTypo seoYuGiGagwanTypo];
    SeoYuGiCloudLogoTypo *seoYuGiCloudLogoTypo = [SeoYuGiCloudLogoTypo seoYuGiCloudLogoTypo];
    SeoYuGiCowRiseTypo *seoYuGiCowRiseTypo = [SeoYuGiCowRiseTypo seoYuGiCowRiseTypo];
    SeoYuGiDawnWatchingTypo *seoYuGiDawnWatchingTypo = [SeoYuGiDawnWatchingTypo seoYuGiDawnWatchingTypo];
    
    WorkManLogo *workManLogo = [WorkManLogo workManLogo];
    WorkManHandWrite *workManHandWrite = [WorkManHandWrite workManHandWrite];
    WorkManTalkWrite *workManTalkWrite = [WorkManTalkWrite workManTalkWrite];
    WorkManRedTitle *workManRedTitle = [WorkManRedTitle workManRedTitle];
    WorkManRightTag *workManRightTag = [WorkManRightTag workManRightTag];
    WorkmanYelloewTitle *workmanYelloewTitle = [WorkmanYelloewTitle workmanYelloewTitle];
    WorkManLogo2 *workManLogo2 = [WorkManLogo2 workManLogo2];
    WorkManLeftTag *workManLeftTag = [WorkManLeftTag workManLeftTag];
    WorkManSecondTitle *workManSecondTitle = [WorkManSecondTitle workManSecondTitle];
    WorkManFast *workManFast = [WorkManFast workManFast];
    WorkManYoutube *workManYoutube =[WorkManYoutube workManYoutube];
    
    InfiniteChallengeLogo *infiniteChallengeLogo = [InfiniteChallengeLogo infiniteChallengeLogo];
    InfiniteChallengeEscapeRoom *infiniteChallengeEscapeRoom = [InfiniteChallengeEscapeRoom infiniteChallengeEscapeRoom];
    InfiniteChallengeWhiteTypo *infiniteChallengeWhiteTypo = [InfiniteChallengeWhiteTypo infiniteChallengeWhiteTypo];
    InfiniteChallengeBlackTypo *infiniteChallengeBlackTypo = [InfiniteChallengeBlackTypo infiniteChallengeBlackTypo];
    InfiniteChallengeBlueTypo *infiniteChallengeBlueTypo = [InfiniteChallengeBlueTypo infiniteChallengeBlueTypo];
    InfiniteChallengeOrangeTypo *infiniteChallengeOrangeTypo = [InfiniteChallengeOrangeTypo infiniteChallengeOrangeTypo];
    InfiniteChallengeLegeno *infiniteChallengeLegeno = [InfiniteChallengeLegeno infiniteChallengeLegeno];
    InfiniteChallengeYellowSpeechBoxWhite *infiniteChallengeYellowSpeechBoxWhite = [InfiniteChallengeYellowSpeechBoxWhite infiniteChallengeYellowSpeechBoxWhite];
    InfiniteChallengeYellowSpeechBoxYellow *infiniteChallengeYellowSpeechBoxYellow = [InfiniteChallengeYellowSpeechBoxYellow infiniteChallengeYellowSpeechBoxYellow];
    InfiniteChallengeTopOfYellow *infiniteChallengeTopOfYellow = [InfiniteChallengeTopOfYellow infiniteChallengeTopOfYellow];
    InfiniteChallengeFiveMinutes *infiniteChallengeFiveMinutes = [InfiniteChallengeFiveMinutes infiniteChallengeFiveMinutes];
    InfiniteChallengeHashTag *infiniteChallengeHashTag = [InfiniteChallengeHashTag infiniteChallengeHashTag];
    InfiniteChallengeSkyBlueBox *infiniteChallengeSkyBlueBox = [InfiniteChallengeSkyBlueBox infiniteChallengeSkyBlueBox];
    InfiniteChallengeCloudBox *infiniteChallengeCloudBox = [InfiniteChallengeCloudBox infiniteChallengeCloudBox];
    
    VlogWebWrite *vlogWebWrite = [VlogWebWrite vlogWebWrite];


    VlogLookbookTypo *vlogLookbookTypo = [VlogLookbookTypo vlogLookbookTypo];
    VlogBrushTypo *vlogBrushTypo = [VlogBrushTypo vlogBrushTypo];
    VlogSummerTypo *vlogSummerTypo = [VlogSummerTypo vlogSummerTypo];
    VlogDailyTypo *vlogDailyTypo = [VlogDailyTypo vlogDailyTypo];
    VlogLogoTagTypo *vlogLogoTagTypo = [VlogLogoTagTypo vlogLogoTagTypo];
    VlogCookingTypo *vlogCookingTypo = [VlogCookingTypo vlogCookingTypo];
    VlogHashTagTypo *vlogHashTagTypo = [VlogHashTagTypo vlogHashTagTypo];
    VlogBMDohyunTypo *vlogBMDohyunTypo = [VlogBMDohyunTypo vlogBMDohyunTypo];
    VlogMyeongjoTypo *vlogMyeongjoTypo = [VlogMyeongjoTypo vlogMyeongjoTypo];
    VlogGRWMTypo *vlogGRWMTypo = [VlogGRWMTypo vlogGRWMTypo];
    VlogNanumSquareTypo *vlogNanumSquareTypo = [VlogNanumSquareTypo vlogNanumSquareTypo];
    VlogMakingFilmTypo *vlogMakingFilmTypo = [VlogMakingFilmTypo vlogMakingFilmTypo];

    SeoYuGiInFrontOfGirlTypo *seoYuGiInFrontOfGirlTypo = [SeoYuGiInFrontOfGirlTypo seoYuGiInFrontOfGirlTypo];
    SeoYuGiHungryTypo *seoYuGiHungryTypo = [SeoYuGiHungryTypo seoYuGiHungryTypo];
    
    VlogDesiner *vlogDesiner = [VlogDesiner vlogDesiner];
    VlogCompany *vlogCompany = [VlogCompany vlogCompany];
    VlogNewCampus *vlogNewCampus = [VlogNewCampus vlogNewCampus];
    VlogDog *vlogDog = [VlogDog vlogDog];
    VlogModel *vlogModel = [VlogModel vlogModel];
    VlogSummer *vlogSummer = [VlogSummer vlogSummer];
    VlogOriginal *vlogOriginal = [VlogOriginal vlogOriginal];
    VlogTrip *vlogTrip = [VlogTrip vlogTrip];
    VlogInItaly *vlogInItaly = [VlogInItaly vlogInItaly];
    VlogItaly *vlogItaly = [VlogItaly vlogItaly];
    VlogLongDance *vlogLongDance = [VlogLongDance vlogLongDance];
    VlogShortDance *vlogShortDance = [VlogShortDance vlogShortDance];
    VlogStudy *vlogStudy = [VlogStudy vlogStudy];
    Vlog365 *vlog365 = [Vlog365 vlog365];
    VlogVisitingCompanyTypo *vlogVisitingCompanyTypo = [VlogVisitingCompanyTypo vlogVisitingCompanyTypo];
    VlogFreshmanTypo *vlogFreshmanTypo = [VlogFreshmanTypo vlogFreshmanTypo];
    VlogStudentTypo *vlogStudentTypo = [VlogStudentTypo vlogStudentTypo];
    DDamTypo *ddamTypo = [DDamTypo ddamTypo];
    RedShoutingTypo *redShoutingTypo = [RedShoutingTypo redShoutingTypo];
    YellowGradientTypo *yellowGradientTypo =[YellowGradientTypo yellowGradientTypo];
    WorkingManNameTypo *workingManNameTypo =[WorkingManNameTypo workingManNameTypo];
    BlueMoonTypo *blueMoonTypo = [BlueMoonTypo blueMoonTypo];
    WhatTypo *whatTypo = [WhatTypo whatTypo];
    AtmosphereTypo *atmosphereTypo = [AtmosphereTypo atmosphereTypo];
    WhiteYellowGradientTypo *whiteYellowGradientTypo = [WhiteYellowGradientTypo whiteYellowGradientTypo];
    TikiTypo *tikiTypo = [TikiTypo tikiTypo];
    KnockOutTypo *knockOutTypo = [KnockOutTypo knockOutTypo];
    MatterTypo *matterTypo = [MatterTypo matterTypo];
    SuccessTypo *successTypo = [SuccessTypo successTypo];
    WhyRealTypo *whyrealTypo = [WhyRealTypo whyRealTypo];
    RuleTypo *ruleTypo = [RuleTypo ruleTypo];
    VlogBarunGothicTypo *vlogBarunGothicTypo = [VlogBarunGothicTypo vlogBarunGothicTypo];
    VlogMacaronTypo *vlogMacaronTypo = [VlogMacaronTypo vlogMacaronTypo];
    VlogMomTypo *vlogMomTypo = [VlogMomTypo vlogMomTypo];
    VlogHolidayTypo *vlogHolidayTypo = [VlogHolidayTypo vlogHolidayTypo];

    NSArray *typos = @[normal, trapezoidTypo, seoYuGiLogoTypo, seoYuGiGagwanTypo, vlogWebWrite,vlogDesiner,vlogCompany,vlogNewCampus, seoYuGiCloudLogoTypo, seoYuGiInFrontOfGirlTypo, seoYuGiCowRiseTypo,vlogDog,vlogModel,vlogSummer, vlogOriginal, vlogTrip, vlogInItaly, vlogItaly, vlogLongDance, vlogShortDance, vlogStudy, vlog365,vlogFreshmanTypo,vlogStudentTypo, seoYuGiHungryTypo, seoYuGiDawnWatchingTypo,runningManLogoTypo ,workManLogo, workManHandWrite,  workManTalkWrite, workManRedTitle, workManRightTag,workManYoutube, workmanYelloewTitle,workManLogo2, workManLeftTag, workManSecondTitle, workManFast, infiniteChallengeLogo, infiniteChallengeEscapeRoom, infiniteChallengeWhiteTypo, infiniteChallengeBlackTypo, infiniteChallengeBlueTypo, infiniteChallengeOrangeTypo, infiniteChallengeLegeno, infiniteChallengeYellowSpeechBoxWhite, infiniteChallengeYellowSpeechBoxYellow, infiniteChallengeTopOfYellow, infiniteChallengeFiveMinutes, infiniteChallengeHashTag, infiniteChallengeSkyBlueBox, infiniteChallengeCloudBox, vlogLookbookTypo, vlogBrushTypo, vlogSummerTypo, vlogDailyTypo, vlogLogoTagTypo, vlogCookingTypo, vlogHashTagTypo, vlogBMDohyunTypo, vlogMyeongjoTypo, vlogGRWMTypo, vlogNanumSquareTypo, ddamTypo, redShoutingTypo, yellowGradientTypo, workingManNameTypo, blueMoonTypo, whatTypo, atmosphereTypo, whiteYellowGradientTypo, tikiTypo, knockOutTypo, matterTypo, successTypo, whyrealTypo, ruleTypo, vlogMakingFilmTypo,vlogVisitingCompanyTypo,     vlogBarunGothicTypo, vlogMacaronTypo, vlogMomTypo, vlogHolidayTypo];
    
    return @[typos];
}



#pragma mark - 스티커
-(NSArray *)stickerCategories{

    NSString *basic = NSLocalizedString(@"basic", nil);

    NSArray *categories = @[basic];
    
    return categories;
}

-(NSArray *)stickerDatas{

    RunningManExcSticker* runningManExcSticker =[RunningManExcSticker runningManExcSticker];
    runningManExcSticker.backgroundImageName = @"runningManExcSticker";
    RunningManQuSticker* runningManQuSticker =[RunningManQuSticker runningManQuSticker];
    runningManQuSticker.backgroundImageName = @"runningManQuSticker";
    SinSeoYuGiExc1Sticker* sinSeoYuGiExc1Sticker =[SinSeoYuGiExc1Sticker sinSeoYuGiExc1Sticker];
    sinSeoYuGiExc1Sticker.backgroundImageName = @"sinSeoYuGiExc1Sticker";
    SinSeoYuGiExc2Sticker* sinSeoYuGiExc2Sticker =[SinSeoYuGiExc2Sticker sinSeoYuGiExc2Sticker];
    sinSeoYuGiExc2Sticker.backgroundImageName = @"sinSeoYuGiExc2Sticker";
    SinSeoYuGiQu1Sticker* sinSeoYuGiQu1Sticker =[SinSeoYuGiQu1Sticker sinSeoYuGiQu1Sticker];
    sinSeoYuGiQu1Sticker.backgroundImageName = @"sinSeoYuGiQu1Sticker";
    SinSeoYuGiQu2Sticker* sinSeoYuGiQu2Sticker =[SinSeoYuGiQu2Sticker sinSeoYuGiQu2Sticker];
    sinSeoYuGiQu2Sticker.backgroundImageName = @"sinSeoYuGiQu2Sticker";


    WorkManStartleSticker *workManStartleSticker  = [WorkManStartleSticker workManStartleSticker];
    workManStartleSticker.backgroundImageName = @"workManStartleSticker";
    
    InfiniteChallengeSkullSticker *infiniteChallengeSkullSticker = [InfiniteChallengeSkullSticker infiniteChallengeSkullSticker];
    infiniteChallengeSkullSticker.backgroundImageName = @"infiniteChallengeSkullSticker";
    
    VlogVideoSticker *vlogVideoSticker = [VlogVideoSticker vlogVideoSticker];
    vlogVideoSticker.backgroundImageName = @"vlogVideoSticker";
    VlogMacaronSticker *vlogMacaronSticker = [VlogMacaronSticker vlogMacaronSticker];
    vlogMacaronSticker.backgroundImageName = @"vlogMacaronSticker";
    VlogTapeSticker *vlogTapeSticker = [VlogTapeSticker vlogTapeSticker];
    vlogTapeSticker.backgroundImageName = @"vlogTapeSticker";
    
    CircleSticker1 *circleSticker1 = [CircleSticker1 circleSticker1];
    circleSticker1.backgroundImageName = @"circleSticker1";
    ArrowSticker1 *arrowSticker1  = [ArrowSticker1 arrowSticker1];
    arrowSticker1.backgroundImageName = @"arrowSticker1";
    XSticker1 *xSticker1  = [XSticker1 xSticker1];
    xSticker1.backgroundImageName = @"xSticker1";
    StartleSticker1* startleSticker1 =[StartleSticker1 startleSticker1];
    startleSticker1.backgroundImageName = @"startleSticker1";
    AngrySticker1 *angrySticker1  = [AngrySticker1 angrySticker1];
    angrySticker1.backgroundImageName = @"angrySticker1";
    BlinkSticker1 *blinkSticker1 = [BlinkSticker1 blinkSticker1];
    blinkSticker1.backgroundImageName = @"blinkSticker1";
    PigtailSticker *pigtailSticker = [PigtailSticker pigtailSticker];
    pigtailSticker.backgroundImageName = @"pigtailSticker";
    HeartSticker1 *heartSticker1 = [HeartSticker1 heartSticker1];
    heartSticker1.backgroundImageName = @"heartSticker1";
    HeartSticker2 *heartSticker2 = [HeartSticker2 heartSticker2];
    heartSticker2.backgroundImageName = @"heartSticker2";
    HeartSticker3 *heartSticker3 = [HeartSticker3 heartSticker3];
    heartSticker3.backgroundImageName = @"heartSticker3";
    HeartSticker4 *heartSticker4 = [HeartSticker4 heartSticker4];
    heartSticker4.backgroundImageName = @"heartSticker4";
    
    
    ArrowSticker2 *arrowSticker2 = [ArrowSticker2 arrowSticker2];
    arrowSticker2.backgroundImageName = @"arrowSticker2";
    ArrowSticker3 *arrowSticker3 = [ArrowSticker3 arrowSticker3];
    arrowSticker3.backgroundImageName = @"arrowSticker3";
    ArrowSticker4 *arrowSticker4 = [ArrowSticker4 arrowSticker4];
    arrowSticker4.backgroundImageName = @"arrowSticker4";
    ArrowSticker5 *arrowSticker5 = [ArrowSticker5 arrowSticker5];
    arrowSticker5.backgroundImageName = @"arrowSticker5";
    ArrowSticker6 *arrowSticker6 = [ArrowSticker6 arrowSticker6];
    arrowSticker6.backgroundImageName = @"arrowSticker6";
    ArrowSticker7 *arrowSticker7 = [ArrowSticker7 arrowSticker7];
    arrowSticker7.backgroundImageName = @"arrowSticker7";
    BlinkSticker3 *blinkSticker3 = [BlinkSticker3 blinkSticker3];
    blinkSticker3.backgroundImageName = @"blinkSticker3";
    BulbSticker *bulbSticker = [BulbSticker bulbSticker];
    bulbSticker.backgroundImageName = @"bulbSticker";
    BurstSticker1 *burstSticker1 = [BurstSticker1 burstSticker1];
    burstSticker1.backgroundImageName = @"burstSticker1";
    ButtonPauseSticker *buttonPauseSticker = [ButtonPauseSticker buttonPauseSticker];
    buttonPauseSticker.backgroundImageName = @"buttonPauseSticker";
    ButtonPlaySticker *buttonPlaySticker = [ButtonPlaySticker buttonPlaySticker];
    buttonPlaySticker.backgroundImageName = @"buttonPlaySticker";
    ButtonStopSticker *buttonStopSticker = [ButtonStopSticker buttonStopSticker];
    buttonStopSticker.backgroundImageName = @"buttonStopSticker";
    CircleSticker2 *circleSticker2 = [CircleSticker2 circleSticker2];
    circleSticker2.backgroundImageName = @"circleSticker2";
    CloudSticker1 *cloudSticker1 = [CloudSticker1 cloudSticker1];
    cloudSticker1.backgroundImageName = @"cloudSticker1";
    CloudSticker2 *cloudSticker2 = [CloudSticker2 cloudSticker2];
    cloudSticker2.backgroundImageName = @"cloudSticker2";
    DollarSticker*dollarSticker = [DollarSticker dollarSticker];
    dollarSticker.backgroundImageName = @"dollarSticker";
    EffectSticker1*effectSticker1 = [EffectSticker1 effectSticker1];
    effectSticker1.backgroundImageName = @"effectSticker1";
    EffectSticker2*effectSticker2 = [EffectSticker2 effectSticker2];
    effectSticker2.backgroundImageName = @"effectSticker2";
    EffectSticker3*effectSticker3 = [EffectSticker3 effectSticker3];
    effectSticker3.backgroundImageName = @"effectSticker3";
    GameSticker*gameSticker = [GameSticker gameSticker];
    gameSticker.backgroundImageName = @"gameSticker";
    GlitterSticker*glitterSticker = [GlitterSticker glitterSticker];
    glitterSticker.backgroundImageName = @"glitterSticker";
    GoodSticker1*goodSticker1 = [GoodSticker1 goodSticker1];
    goodSticker1.backgroundImageName = @"goodSticker1";
    HeartSticker5*heartSticker5 = [HeartSticker5 heartSticker5];
    heartSticker5.backgroundImageName = @"heartSticker5";
    HeartSticker6*heartSticker6 = [HeartSticker6 heartSticker6];
    heartSticker6.backgroundImageName = @"heartSticker6";
    HeartSticker7*heartSticker7 = [HeartSticker7 heartSticker7];
    heartSticker7.backgroundImageName = @"heartSticker7";
    HeartSticker8*heartSticker8 = [HeartSticker8 heartSticker8];
    heartSticker8.backgroundImageName = @"heartSticker8";
    HeartSticker9*heartSticker9 = [HeartSticker9 heartSticker9];
    heartSticker9.backgroundImageName = @"heartSticker9";
    HeartSticker10*heartSticker10 = [HeartSticker10 heartSticker10];
    heartSticker10.backgroundImageName = @"heartSticker10";
    KoreanFlagSticker*koreanFlagSticker = [KoreanFlagSticker koreanFlagSticker];
    koreanFlagSticker.backgroundImageName = @"koreanFlagSticker";
    LockSticker*lockSticker = [LockSticker lockSticker];
    lockSticker.backgroundImageName = @"lockSticker";
    MedalBronzeSticker*medalBronzeSticker = [MedalBronzeSticker medalBronzeSticker];
    medalBronzeSticker.backgroundImageName = @"medalBronzeSticker";
    MedalSilverSticker*medalSilverSticker = [MedalSilverSticker medalSilverSticker];
    medalSilverSticker.backgroundImageName = @"medalSilverSticker";
    MedalGoldSticker*medalGoldSticker = [MedalGoldSticker medalGoldSticker];
    medalGoldSticker.backgroundImageName = @"medalGoldSticker";
    NoteSticker1*noteSticker1 = [NoteSticker1 noteSticker1];
    noteSticker1.backgroundImageName = @"noteSticker1";
    NoteSticker2*noteSticker2 = [NoteSticker2 noteSticker2];
    noteSticker2.backgroundImageName = @"noteSticker2";
    NoteSticker3*noteSticker3 = [NoteSticker3 noteSticker3];
    noteSticker3.backgroundImageName = @"noteSticker3";
    NuclearSticker*nuclearSticker = [NuclearSticker nuclearSticker];
    nuclearSticker.backgroundImageName = @"nuclearSticker";
    RspRockSticker*rspRockSticker = [RspRockSticker rspRockSticker];
    rspRockSticker.backgroundImageName = @"rspRockSticker";
    RspScissorsSticker*rspScissorsSticker = [RspScissorsSticker rspScissorsSticker];
    rspScissorsSticker.backgroundImageName = @"rspScissorsSticker";
    RspPaperSticker*rspPaperSticker = [RspPaperSticker rspPaperSticker];
    rspPaperSticker.backgroundImageName = @"rspPaperSticker";
    SnowflakeSticker1*snowflakeSticker1 = [SnowflakeSticker1 snowflakeSticker1];
    snowflakeSticker1.backgroundImageName = @"snowflakeSticker1";
    SnowflakeSticker2*snowflakeSticker2 = [SnowflakeSticker2 snowflakeSticker2];
    snowflakeSticker2.backgroundImageName = @"snowflakeSticker2";
    SnowmanSticker*snowmanSticker = [SnowmanSticker snowmanSticker];
    snowmanSticker.backgroundImageName = @"snowmanSticker";
    SpeechBubbleSticker1*speechBubbleSticker1 = [SpeechBubbleSticker1 speechBubbleSticker1];
    speechBubbleSticker1.backgroundImageName = @"speechBubbleSticker1";
    SpeechBubbleSticker2*speechBubbleSticker2 = [SpeechBubbleSticker2 speechBubbleSticker2];
    speechBubbleSticker2.backgroundImageName = @"speechBubbleSticker2";
    SpeechBubbleSticker3*speechBubbleSticker3 = [SpeechBubbleSticker3 speechBubbleSticker3];
    speechBubbleSticker3.backgroundImageName = @"speechBubbleSticker3";
    SpeechBubbleSticker4*speechBubbleSticker4 = [SpeechBubbleSticker4 speechBubbleSticker4];
    speechBubbleSticker4.backgroundImageName = @"speechBubbleSticker4";
    StainSticker1 *stainSticker1 =[StainSticker1 stainSticker1];
    stainSticker1.backgroundImageName =@"stainSticker1";
    StainSticker2 *stainSticker2 =[StainSticker2 stainSticker2];
    stainSticker2.backgroundImageName =@"stainSticker2";
    StarSticker1 *starSticker1 =[StarSticker1 starSticker1];
    starSticker1.backgroundImageName =@"starSticker1";
    StarSticker2 *starSticker2 =[StarSticker2 starSticker2];
    starSticker2.backgroundImageName =@"starSticker2";
    StarSticker3 *starSticker3 =[StarSticker3 starSticker3];
    starSticker3.backgroundImageName =@"starSticker3";
    StarSticker4 *starSticker4 =[StarSticker4 starSticker4];
    starSticker4.backgroundImageName =@"starSticker4";
    TargetSticker *targetSticker =[TargetSticker targetSticker];
    targetSticker.backgroundImageName =@"targetSticker";
    TagSticker *tagSticker =[TagSticker tagSticker];
    tagSticker.backgroundImageName =@"tagSticker";
    TearsSticker *tearsSticker =[TearsSticker tearsSticker];
    tearsSticker.backgroundImageName =@"tearsSticker";
    TriangleSticker1 *triangleSticker1 =[TriangleSticker1 triangleSticker1];
    triangleSticker1.backgroundImageName =@"triangleSticker1";
    
   
    
    
    

    NSArray *basicStickers = @[circleSticker1,arrowSticker1,xSticker1,runningManExcSticker,runningManQuSticker,sinSeoYuGiExc1Sticker,sinSeoYuGiExc2Sticker, sinSeoYuGiQu1Sticker,sinSeoYuGiQu2Sticker,startleSticker1, angrySticker1, workManStartleSticker, infiniteChallengeSkullSticker, vlogVideoSticker,pigtailSticker,heartSticker1,heartSticker2,heartSticker3,heartSticker4,heartSticker5,heartSticker6,heartSticker7,heartSticker8,heartSticker9,heartSticker10, vlogMacaronSticker,vlogTapeSticker,arrowSticker2,arrowSticker3,arrowSticker4,arrowSticker5,arrowSticker6,arrowSticker7,blinkSticker1,blinkSticker3,bulbSticker,burstSticker1,buttonPauseSticker,buttonPlaySticker,buttonStopSticker,circleSticker2,cloudSticker1,cloudSticker2,dollarSticker,effectSticker1,effectSticker2,effectSticker3,gameSticker,glitterSticker,goodSticker1,koreanFlagSticker,lockSticker,medalBronzeSticker,medalSilverSticker,medalGoldSticker,noteSticker1,noteSticker2,noteSticker3,nuclearSticker,rspRockSticker,rspScissorsSticker,rspPaperSticker,snowflakeSticker1,snowflakeSticker2,snowmanSticker,speechBubbleSticker1,speechBubbleSticker2,speechBubbleSticker3,speechBubbleSticker4,stainSticker1,stainSticker2,starSticker1,starSticker2,starSticker3,starSticker4,tagSticker,targetSticker,tearsSticker,triangleSticker1];
    
    return @[basicStickers];
}

-(void)addItem:(Item *)item{
    
    [SaveManager.sharedInstance addItem:item];
    [SaveManager.sharedInstance save];
    
}

-(void)deleteItem:(Item *)item{
    
    [item.baseView removeFromSuperview];
    [SaveManager.sharedInstance deleteItem:item];
    [SaveManager.sharedInstance save];
    
}

@end
