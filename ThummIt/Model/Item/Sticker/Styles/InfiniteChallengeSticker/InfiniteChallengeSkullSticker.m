//
//  InfiniteChallengeSticker.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/28.
//

#import "InfiniteChallengeSkullSticker.h"

@implementation InfiniteChallengeSkullSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"infiniteChallengeskullSticker";
        self.backgroundImageName = @"infiniteChallengeSkullSticker";
        self.isChangingColorAvailable = true;
    }
    return self;
}

+(InfiniteChallengeSkullSticker*) infiniteChallengeSkullSticker{
    
    InfiniteChallengeSkullSticker* infiniteChallengeSkullSticker = [[self alloc] init];
    return infiniteChallengeSkullSticker;
}

@end
