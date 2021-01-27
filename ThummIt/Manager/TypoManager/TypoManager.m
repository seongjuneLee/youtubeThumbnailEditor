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
    SeoYuGiCloudLogoTypo *seoYuGiCloudLogoTypo = [SeoYuGiCloudLogoTypo seoYuGiCloudLogoTypo];
    BabarimanTypo *babarimanTypo = [BabarimanTypo babarimanTypo];
    CowRiseTypo *cowRiseTypo = [CowRiseTypo cowRiseTypo];
    EatRoomTypo *eatRoomTypo = [EatRoomTypo eatRoomTypo];
    DawnWatchingTypo *dawnWatchingTypo = [DawnWatchingTypo dawnWatchingTypo];
    DDamTypo *ddamTypo = [DDamTypo ddamTypo];
    RedShountingTypo *redShoutingTypo = [RedShountingTypo redShountingTypo];
    YellowGradientTypo *yellowGradientTypo =[YellowGradientTypo yellowGradientTypo];
    WorkingManNameTypo *workingManNameTypo =[WorkingManNameTypo workingManNameTypo];
    RedShountingTypo *redShountingTypo = [RedShountingTypo redShountingTypo];
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
    
    return @[runningManLogoTypo, ddamTypo, redShountingTypo, yellowGradientTypo, workingManNameTypo, blueMoonTypo, whatTypo, atmosphereTypo, whiteYellowGradientTypo, tikiTypo, knockOutTypo, matterTypo, successTypo, whyrealTypo, ruleTypo, seoYuGiLogoTypo, firstexperienceTypo, seoYuGiCloudLogoTypo, babarimanTypo, cowRiseTypo, eatRoomTypo, dawnWatchingTypo];
}
@end
