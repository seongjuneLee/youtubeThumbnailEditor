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
    FirstExperienceTypo *firstexperienceTypo = [FirstExperienceTypo firstExperienceTypo];
    SeoYuGiCloudLogoTypo *seoYuGiCloudLogoTypo = [SeoYuGiCloudLogoTypo seoYuGiCloudLogoTypo];
    BabarimanTypo *babarimanTypo = [BabarimanTypo babarimanTypo];
    CowRiseTypo *cowRiseTypo = [CowRiseTypo cowRiseTypo];
    EatRoomTypo *eatRoomTypo = [EatRoomTypo eatRoomTypo];
    DawnWatchingTypo *dawnWatchingTypo = [DawnWatchingTypo dawnWatchingTypo];
    
    WorkManLogo *workManLogo = [WorkManLogo workManLogo];
    WorkManHandWrite *workManHandWrite = [WorkManHandWrite workManHandWrite];
    WorkManTalkWrite *workManTalkWrite = [WorkManTalkWrite workManTalkWrite];
    WorkManRedTitle *workManRedTitle = [WorkManRedTitle workManRedTitle];
    WorkManRightTag *workManRightTag = [WorkManRightTag workManRightTag];
    WorkmanYelloewTitle *workmanYelloewTitle = [WorkmanYelloewTitle workmanYelloewTitle];
    WorkManLogo2 *workManLogo2 = [WorkManLogo2 workManLogo2];
    WorkManLeftTag *workManLeftTag = [WorkManLeftTag workManLeftTag];
    
    InfiniteChallengeLogo *infiniteChallengeLogo = [InfiniteChallengeLogo infiniteChallengeLogo];
    InfiniteChallengeEscapeRoom *infiniteChallengeEscapeRoom = [InfiniteChallengeEscapeRoom infiniteChallengeEscapeRoom];
    InfiniteChallengeWhite *infiniteChallengeWhite = [InfiniteChallengeWhite infiniteChallengeWhite];
    InfiniteChallengeBlackGrey *infiniteChallengeBlackGrey = [InfiniteChallengeBlackGrey infiniteChallengeBlackGrey];
    InfiniteChallengeWhiteBlue *infiniteChallengeWhiteBlue = [InfiniteChallengeWhiteBlue infiniteChallengeWhiteBlue];
    InfiniteChallengeWhiteOrange *infiniteChallengeWhiteOrange = [InfiniteChallengeWhiteOrange infiniteChallengeWhiteOrange];
    InfiniteChallengeLegeno *infiniteChallengeLegeno = [InfiniteChallengeLegeno infiniteChallengeLegeno];
    InfiniteChallengeYellowSpeechBoxWhite *infiniteChallengeYellowSpeechBoxWhite = [InfiniteChallengeYellowSpeechBoxWhite infiniteChallengeYellowSpeechBoxWhite];
    InfiniteChallengeYellowSpeechBoxYellow *infiniteChallengeYellowSpeechBoxYellow = [InfiniteChallengeYellowSpeechBoxYellow infiniteChallengeYellowSpeechBoxYellow];
    InfiniteChallengeTopOfYellow *infiniteChallengeTopOfYellow = [InfiniteChallengeTopOfYellow infiniteChallengeTopOfYellow];
    InfiniteChallengeFiveMinutes *infiniteChallengeFiveMinutes = [InfiniteChallengeFiveMinutes infiniteChallengeFiveMinutes];
    InfiniteChallengeHashTag *infiniteChallengeHashTag = [InfiniteChallengeHashTag infiniteChallengeHashTag];
    InfiniteChallengeSkyBlueBox *infiniteChallengeSkyBlueBox = [InfiniteChallengeSkyBlueBox infiniteChallengeSkyBlueBox];
    InfiniteChallengeCloudBox *infiniteChallengeCloudBox = [InfiniteChallengeCloudBox infiniteChallengeCloudBox];
    
    VlogWebWrite *vlogWebWrite = [VlogWebWrite vlogWebWrite];
    VlogDesiner *vlogDesiner = [VlogDesiner vlogDesiner];
    VlogCompany *vlogCompany = [VlogCompany vlogCompany];
    VlogNewCampus *vlogNewCampus = [VlogNewCampus vlogNewCampus];
    VlogDog *vlogDog = [VlogDog vlogDog];
    VlogModel *vlogModel = [VlogModel vlogModel];
    VlogSummer *vlogSummer = [VlogSummer vlogSummer];
    VlogOriginal *vlogOriginal = [VlogOriginal vlogOriginal];
    VlogTrip *vlogTrip = [VlogTrip vlogTrip];
    VlogInItaly *vlogInIaly = [VlogInItaly vlogInItaly];
    VlogItaly *vlogItaly = [VlogItaly vlogItaly];
    VlogLongDance *vlogLongDance = [VlogLongDance vlogLongDance];
    VlogShortDance *vlogShortDance = [VlogShortDance vlogShortDance];
    VlogStudy *vlogStudy = [VlogStudy vlogStudy];
    Vlog365 *vlog365 = [Vlog365 vlog365];
    



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


    

    NSArray *typos = @[normal, trapezoidTypo, seoYuGiLogoTypo, firstexperienceTypo, fightManTypo, seoYuGiCloudLogoTypo, inFrontOfGirlTypo, babarimanTypo, cowRiseTypo, eatRoomTypo, hungryTypo, dawnWatchingTypo,runningManLogoTypo ,workManLogo, workManHandWrite,  workManTalkWrite, workManRedTitle,  workManRightTag,workManLeftTag, workmanYelloewTitle,workManLogo2, infiniteChallengeLogo, infiniteChallengeEscapeRoom, infiniteChallengeWhite, infiniteChallengeBlackGrey, infiniteChallengeWhiteBlue, infiniteChallengeWhiteOrange, infiniteChallengeLegeno, infiniteChallengeYellowSpeechBoxWhite, infiniteChallengeYellowSpeechBoxYellow, infiniteChallengeTopOfYellow, infiniteChallengeFiveMinutes, infiniteChallengeHashTag, infiniteChallengeSkyBlueBox, infiniteChallengeCloudBox, vlogWebWrite,vlogDesiner,vlogCompany,vlogNewCampus,vlogDog,vlogModel,vlogSummer,vlogOriginal,vlogTrip,vlogInIaly,vlogItaly,vlogLongDance,vlogShortDance,vlogStudy,vlog365];
    NSArray *typos = @[normal, trapezoidTypo, seoYuGiLogoTypo, firstexperienceTypo, seoYuGiCloudLogoTypo, babarimanTypo, cowRiseTypo, eatRoomTypo, dawnWatchingTypo,runningManLogoTypo ,workManLogo, workManHandWrite,  workManTalkWrite, workManRedTitle,  workManRightTag, workmanYelloewTitle,workManLogo2, infiniteChallengeLogo, infiniteChallengeEscapeRoom, infiniteChallengeWhite, infiniteChallengeBlackGrey, infiniteChallengeWhiteBlue, infiniteChallengeWhiteOrange, infiniteChallengeLegeno, infiniteChallengeYellowSpeechBoxWhite, infiniteChallengeYellowSpeechBoxYellow, infiniteChallengeTopOfYellow, infiniteChallengeFiveMinutes, infiniteChallengeHashTag, infiniteChallengeSkyBlueBox, infiniteChallengeCloudBox,ddamTypo, redShoutingTypo, yellowGradientTypo, workingManNameTypo, blueMoonTypo, whatTypo, atmosphereTypo, whiteYellowGradientTypo ,tikiTypo,knockOutTypo,matterTypo,successTypo,whyrealTypo,ruleTypo];

    
    
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
    WorkManTalkSticker *workManTalkSticker  = [WorkManTalkSticker workManTalkSticker];
    workManTalkSticker.backgroundImageName = @"workManTalkSticker";
    WorkManFiveFingerSticker *workManFiveFingerSticker  = [WorkManFiveFingerSticker workManFiveFingerSticker];
    workManFiveFingerSticker.backgroundImageName = @"workManFiveFingerSticker";
    WorkManYellowSticker *workManYellowSticker  = [WorkManYellowSticker workManYellowSticker];
    workManYellowSticker.backgroundImageName = @"workManYellowSticker";
    
    
    NSArray *basicStickers = @[basicCircleSticker,basicArrowSticker,xSticker,runningManExcSticker,runningManQuSticker,sinSeoYuGiExc1Sticker,sinSeoYuGiExc2Sticker,sinSeoYuGiQuSticker,sinSeoYuGiEffectSticker, workManAngrySticker, workManTalkSticker, workManFiveFingerSticker, workManYellowSticker];
    
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
