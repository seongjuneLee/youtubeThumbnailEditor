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
    FightManTypo *fightManTypo = [FightManTypo fightManTypo];
    SeoYuGiCloudLogoTypo *seoYuGiCloudLogoTypo = [SeoYuGiCloudLogoTypo seoYuGiCloudLogoTypo];
    InFrontOfGirlTypo *inFrontOfGirlTypo = [InFrontOfGirlTypo inFrontOfGirlTypo];
    BabarimanTypo *babarimanTypo = [BabarimanTypo babarimanTypo];
    CowRiseTypo *cowRiseTypo = [CowRiseTypo cowRiseTypo];
    EatRoomTypo *eatRoomTypo = [EatRoomTypo eatRoomTypo];
    HungryTypo *hungryTypo = [HungryTypo hungryTypo];
    DawnWatchingTypo *dawnWatchingTypo = [DawnWatchingTypo dawnWatchingTypo];
    WorkManLogo *workManLogo = [WorkManLogo workManLogo];
    WorkManHandWrite *workManHandWrite = [WorkManHandWrite workManHandWrite];
    WorkManTalkWrite *workManTalkWrite = [WorkManTalkWrite workManTalkWrite];
    WorkManRedTitle *workManRedTitle = [WorkManRedTitle workManRedTitle];
    WorkManRightTag *workManRightTag = [WorkManRightTag workManRightTag];
    WorkmanYelloewTitle *workmanYelloewTitle = [WorkmanYelloewTitle workmanYelloewTitle];
    WorkManLogo2 *workManLogo2 = [WorkManLogo2 workManLogo2];
   


    
    NSArray *typos = @[normal, trapezoidTypo, seoYuGiLogoTypo, firstexperienceTypo, fightManTypo, seoYuGiCloudLogoTypo, inFrontOfGirlTypo, babarimanTypo, cowRiseTypo, eatRoomTypo, hungryTypo, dawnWatchingTypo,runningManLogoTypo ,workManLogo, workManHandWrite,  workManTalkWrite, workManRedTitle,  workManRightTag, workmanYelloewTitle,workManLogo2];
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
    
    NSArray *typos = @[normal, trapezoidTypo, seoYuGiLogoTypo, firstexperienceTypo, fightManTypo, seoYuGiCloudLogoTypo, inFrontOfGirlTypo, babarimanTypo, cowRiseTypo, eatRoomTypo, hungryTypo, dawnWatchingTypo,runningManLogoTypo, infiniteChallengeLogo, infiniteChallengeEscapeRoom, infiniteChallengeWhite, infiniteChallengeBlackGrey, infiniteChallengeWhiteBlue, infiniteChallengeWhiteOrange, infiniteChallengeLegeno, infiniteChallengeYellowSpeechBoxWhite, infiniteChallengeYellowSpeechBoxYellow, infiniteChallengeTopOfYellow, infiniteChallengeFiveMinutes, infiniteChallengeHashTag, infiniteChallengeSkyBlueBox, infiniteChallengeCloudBox];
    
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
    WorkManAngrySticker *workManAngrySticker  = [WorkManAngrySticker workManAngrySticker];
    workManAngrySticker.backgroundImageName = @"workManAngrySticker";
    WorkManTalkSticker *workManTalkSticker  = [WorkManTalkSticker workManTalkSticker];
    workManTalkSticker.backgroundImageName = @"workManTalkSticker";
    WorkManFiveFingerSticker *workManFiveFingerSticker  = [WorkManFiveFingerSticker workManFiveFingerSticker];
    workManFiveFingerSticker.backgroundImageName = @"workManFiveFingerSticker";
    WorkManYellowSticker *workManYellowSticker  = [WorkManYellowSticker workManYellowSticker];
    workManYellowSticker.backgroundImageName = @"workManYellowSticker";
    
    
    NSArray *basicStickers = @[basicCircleSticker,basicArrowSticker,xSticker, workManAngrySticker, workManTalkSticker, workManFiveFingerSticker, workManYellowSticker];
    
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
