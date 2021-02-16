//
//  InfiniteChallengeYellowSpeechBoxYellow.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/28.
//

#import "InfiniteChallengeYellowSpeechBoxYellow.h"

@implementation InfiniteChallengeYellowSpeechBoxYellow

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"빨리!!",nil);
        self.fontName = @"777Chocolatlatte-";
        self.textColor = [UIColor colorWithRed:184/255.0 green:3/255.0 blue:23/255.0 alpha:1];
        self.bgImageName = @"infiniteChallengeYellowSpeechBox";
        self.bgWidthPadding = 80;
        self.bgHeightPadding = 80;
        self.fontSize = 60;
        
        BGTextAttribute *attribute = [[BGTextAttribute alloc] init];
        attribute.borderWidth = 15;
        attribute.borderColor = [UIColor colorWithRed:246/255.0 green:224/255.0 blue:87/255.0 alpha:1.0];
        
        BGTextAttribute *attribute2 = [[BGTextAttribute alloc] init];
        attribute2.shadowOffset = CGPointMake(0, 0);
        attribute2.shadowColor = [UIColor colorWithRed:106/255.0 green:53/255.0 blue:0/255.0 alpha:1.0];
        attribute2.shadowRadius = 10;
        self.bgTextAttributes = @[attribute, attribute2];
    }
    return self;
}

+(InfiniteChallengeYellowSpeechBoxYellow*)infiniteChallengeYellowSpeechBoxYellow{
    
    InfiniteChallengeYellowSpeechBoxYellow* infiniteChallengeYellowSpeechBoxYellow = [[self alloc] init];
    return infiniteChallengeYellowSpeechBoxYellow;
    
}

@end
