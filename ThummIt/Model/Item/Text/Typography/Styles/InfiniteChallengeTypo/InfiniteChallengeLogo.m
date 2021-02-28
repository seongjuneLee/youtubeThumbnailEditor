//
//  InfiniteChallengeLogo.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/27.
//

#import "InfiniteChallengeLogo.h"

@implementation InfiniteChallengeLogo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"백만도전",nil);
        self.fontName = @"777Chocolatlatte-";
        self.textColor = [UIColor colorWithRed:70/255.0 green:52/255.0 blue:52/255.0 alpha:1];
        self.bgImageName = @"infiniteChallengeLogoBox";
        self.bgWidthPadding = 130;
        self.bgHeightPadding = 100;
        self.fontSize = 40;
        self.canChangeColor = true;
    }
    return self;
}

+(InfiniteChallengeLogo*)infiniteChallengeLogo{
    
    InfiniteChallengeLogo* infiniteChallengeLogo = [[self alloc] init];
    return infiniteChallengeLogo;
    
}

@end
