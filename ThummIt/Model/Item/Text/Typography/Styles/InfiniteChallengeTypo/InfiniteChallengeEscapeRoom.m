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
        
        self.name = NSLocalizedString(@"방탈출",nil); //italic
        self.fontName = @"S-CoreDream-9Black";
        self.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
        self.obliqueValue = 0.18;
        self.fontSize = 70;
        self.canChangeColor = true;
        BGTextAttribute *attribute = [[BGTextAttribute alloc] init];
        attribute.borderWidth = 10;
        attribute.borderColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        attribute.obliqueValue = 0.18;
        
        BGTextAttribute *attribute2 = [[BGTextAttribute alloc] init];
        attribute2.borderWidth = 15;
        attribute2.borderColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
        attribute2.obliqueValue = 0.18;
        
        self.bgTextAttributes = @[attribute, attribute2];
    }
    return self;
}

+(InfiniteChallengeEscapeRoom*)infiniteChallengeEscapeRoom{
    
    InfiniteChallengeEscapeRoom* infiniteChallengeEscapeRoom = [[self alloc] init];
    return infiniteChallengeEscapeRoom;
    
}

@end
