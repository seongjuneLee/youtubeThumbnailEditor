//
//  InfiniteChallengeEscapeRoom.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/27.
//

#import "InfiniteChallengeEscapeRoom.h"

@implementation InfiniteChallengeEscapeRoom

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"방탈출",nil);
        self.fontName = @"S-CoreDream-9Black";
        self.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        self.fontSize = TEXT_FONT_SIZE;
    }
    return self;
}

+(InfiniteChallengeEscapeRoom*)infiniteChallengeEscapeRoom{
    
    InfiniteChallengeEscapeRoom* infiniteChallengeEscapeRoom = [[self alloc] init];
    return infiniteChallengeEscapeRoom;
    
}

@end
