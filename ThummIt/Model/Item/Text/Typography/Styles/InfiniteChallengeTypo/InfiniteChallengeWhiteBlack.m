//
//  InfiniteChallengeWhiteBlack.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/27.
//

#import "InfiniteChallengeWhiteBlack.h"

@implementation InfiniteChallengeWhiteBlack

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"무한도전",nil);
        self.fontName = @"S-CoreDream-9Black";
        self.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1];
        self.fontSize = TEXT_FONT_SIZE;
    }
    return self;
}

+(InfiniteChallengeWhiteBlack*)infiniteChallengeWhiteBlack{
    
    InfiniteChallengeWhiteBlack* infiniteChallengeWhiteBlack = [[self alloc] init];
    return infiniteChallengeWhiteBlack;
    
}

@end
