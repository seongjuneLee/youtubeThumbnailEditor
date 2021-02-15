//
//  InfiniteChallengeMuYaHo.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/27.
//

#import "InfiniteChallengeYellowSpeechBoxWhite.h"

@implementation InfiniteChallengeYellowSpeechBoxWhite

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"무야~호~",nil);
        self.fontName = @"777Chocolatlatte-";
        self.textColor = [UIColor colorWithRed:184/255.0 green:3/255.0 blue:23/255.0 alpha:1];
        self.bgImageName = @"infiniteChallengeYellowSpeechBox";
        self.bgWidthPadding = 80;
        self.bgHeightPadding = 80;
        
        BGTextAttribute *attribute = [[BGTextAttribute alloc] init];
        attribute.borderWidth = 15;
        attribute.borderColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        
        BGTextAttribute *attribute2 = [[BGTextAttribute alloc] init];
        attribute2.shadowOffset = CGPointMake(0, 0);
        attribute2.shadowColor = [UIColor colorWithRed:106/255.0 green:53/255.0 blue:0/255.0 alpha:1.0];
        attribute2.shadowRadius = 5;
        
        self.bgTextAttributes = @[attribute, attribute2];
    }
    return self;
}

+(InfiniteChallengeYellowSpeechBoxWhite*)infiniteChallengeYellowSpeechBoxWhite{
    
    InfiniteChallengeYellowSpeechBoxWhite* infiniteChallengeYellowSpeechBoxWhite = [[self alloc] init];
    return infiniteChallengeYellowSpeechBoxWhite;
    
}

@end
