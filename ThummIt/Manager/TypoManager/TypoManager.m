//
//  TypoManager.m
//  ThummIt
//
//  Created by 이성준 on 2021/01/08.
//

#import "TypoManager.h"
#import "Typography.h"
#import "TypoHeader.h"
@implementation TypoManager

+ (TypoManager *)sharedInstance {
    static TypoManager *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TypoManager alloc] init];
    });
    
    return sharedInstance;
}

-(NSArray *)typos{
    
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
    
    
    return @[normal, trapezoidTypo, seoYuGiLogoTypo, firstexperienceTypo, fightManTypo, seoYuGiCloudLogoTypo, inFrontOfGirlTypo, babarimanTypo, cowRiseTypo, eatRoomTypo, hungryTypo, dawnWatchingTypo,runningManLogoTypo];
}

@end
