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
    
    NSArray *typos = @[normal, trapezoidTypo, seoYuGiLogoTypo, seoYuGiGagwanTypo, vlogWebWrite,vlogDesiner,vlogCompany,vlogNewCampus, seoYuGiCloudLogoTypo, seoYuGiInFrontOfGirlTypo, seoYuGiCowRiseTypo,vlogDog,vlogModel,vlogSummer, vlogOriginal, vlogTrip, vlogInItaly, vlogItaly, vlogLongDance, vlogShortDance, vlogStudy, vlog365, seoYuGiHungryTypo, seoYuGiDawnWatchingTypo,runningManLogoTypo ,workManLogo, workManHandWrite,  workManTalkWrite, workManRedTitle, workManRightTag, workmanYelloewTitle,workManLogo2, workManLeftTag, workManSecondTitle, workManFast, infiniteChallengeLogo, infiniteChallengeEscapeRoom, infiniteChallengeWhiteTypo, infiniteChallengeBlackTypo, infiniteChallengeBlueTypo, infiniteChallengeOrangeTypo, infiniteChallengeLegeno, infiniteChallengeYellowSpeechBoxWhite, infiniteChallengeYellowSpeechBoxYellow, infiniteChallengeTopOfYellow, infiniteChallengeFiveMinutes, infiniteChallengeHashTag, infiniteChallengeSkyBlueBox, infiniteChallengeCloudBox, vlogLookbookTypo, vlogBrushTypo, vlogSummerTypo, vlogDailyTypo, vlogLogoTagTypo, vlogCookingTypo, vlogHashTagTypo, vlogBMDohyunTypo, vlogMyeongjoTypo, vlogGRWMTypo, vlogNanumSquareTypo, vlogMakingFilmTypo, ddamTypo, redShoutingTypo, yellowGradientTypo, workingManNameTypo, blueMoonTypo, whatTypo, atmosphereTypo, whiteYellowGradientTypo, tikiTypo, knockOutTypo, matterTypo, successTypo, whyrealTypo, ruleTypo, vlogVisitingCompanyTypo, vlogBarunGothicTypo, vlogMacaronTypo, vlogMomTypo, vlogHolidayTypo];
    
    
    return @[typos];
}



#pragma mark - 스티커
-(NSArray *)stickerCategories{

    NSString *basic = NSLocalizedString(@"basic", nil);

    NSArray *categories = @[basic];
    
    return categories;
}

-(NSArray *)stickerDatas{
    
    BasicCircleSticker *basicCircleSticker = [BasicCircleSticker basicCircleSticker];
    basicCircleSticker.backgroundImageName = @"basicCircleStickerWhite";
    BasicArrowSticker *basicArrowSticker  = [BasicArrowSticker basicArrowSticker];
    basicArrowSticker.backgroundImageName = @"basicArrowStickerWhite";
    XSticker *xSticker  = [XSticker xSticker];
    xSticker.backgroundImageName = @"xStickerWhite";
    RunningManExcSticker* runningManExcSticker =[RunningManExcSticker runningManExcSticker];
    runningManExcSticker.backgroundImageName = @"runningManExcSticker";
    RunningManQuSticker* runningManQuSticker =[RunningManQuSticker runningManQuSticker];
    runningManQuSticker.backgroundImageName = @"runningManQuSticker";
    SinSeoYuGiExc1Sticker* sinSeoYuGiExc1Sticker =[SinSeoYuGiExc1Sticker sinSeoYuGiExc1Sticker];
    sinSeoYuGiExc1Sticker.backgroundImageName = @"sinSeoYuGiExc1Sticker";
    SinSeoYuGiExc2Sticker* sinSeoYuGiExc2Sticker =[SinSeoYuGiExc2Sticker sinSeoYuGiExc2Sticker];
    sinSeoYuGiExc2Sticker.backgroundImageName = @"sinSeoYuGiExc2Sticker";
    SinSeoYuGiQuSticker* sinSeoYuGiQuSticker =[SinSeoYuGiQuSticker sinSeoYuGiQuSticker];
    sinSeoYuGiQuSticker.backgroundImageName = @"sinSeoYuGiQuSticker";
    SinSeoYuGiEffectSticker* sinSeoYuGiEffectSticker =[SinSeoYuGiEffectSticker sinSeoYuGiEffectSticker];
    sinSeoYuGiEffectSticker.backgroundImageName = @"sinSeoYuGiEffectSticker";
    
    
    
    WorkManAngrySticker *workManAngrySticker  = [WorkManAngrySticker workManAngrySticker];
    workManAngrySticker.backgroundImageName = @"workManAngrySticker";

    WorkManStartleSticker *workManStartleSticker  = [WorkManStartleSticker workManStartleSticker];
    workManStartleSticker.backgroundImageName = @"workManStartleSticker";
    
    InfiniteChallengeSkullSticker *infiniteChallengeSkullSticker = [InfiniteChallengeSkullSticker infiniteChallengeSkullSticker];
    infiniteChallengeSkullSticker.backgroundImageName = @"infiniteChallengeSkullSticker";
    
    VlogBlinkSticker1 *vlogBlinkSticker1 = [VlogBlinkSticker1 vlogBlinkSticker1];
    vlogBlinkSticker1.backgroundImageName = @"blinkSticker1";
    VlogPigtailSticker *vlogPigtailSticker = [VlogPigtailSticker vlogPigtailSticker];
    vlogPigtailSticker.backgroundImageName = @"pigtailSticker";
    VlogVideoSticker *vlogVideoSticker = [VlogVideoSticker vlogVideoSticker];
    vlogVideoSticker.backgroundImageName = @"videoSticker";
    VlogMacaronSticker *vlogMacaronSticker = [VlogMacaronSticker vlogMacaronSticker];
    
    WorkManTalkSticker *workManTalkSticker = [WorkManTalkSticker workManTalkSticker];
    WorkManFiveFingerSticker *workManFiveFingerSticker = [WorkManFiveFingerSticker workManFiveFingerSticker];
    WorkManYellowSticker *workManYellowSticker = [WorkManYellowSticker workManYellowSticker];

    NSArray *basicStickers = @[basicCircleSticker,basicArrowSticker,xSticker,runningManExcSticker,runningManQuSticker,sinSeoYuGiExc1Sticker,sinSeoYuGiExc2Sticker,sinSeoYuGiQuSticker,sinSeoYuGiEffectSticker, workManAngrySticker, workManTalkSticker, workManFiveFingerSticker, workManYellowSticker, vlogVideoSticker, vlogMacaronSticker];
    
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
