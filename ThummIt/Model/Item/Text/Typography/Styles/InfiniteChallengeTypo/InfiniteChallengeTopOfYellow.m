//
//  InfiniteChallengeTopOfYellow.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/28.
//

#import "InfiniteChallengeTopOfYellow.h"

@implementation InfiniteChallengeTopOfYellow

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"??",nil);
        self.fontName = @"NanumGothicOTFExtraBold";
        self.textColor = [UIColor colorWithRed:184/255.0 green:33/255.0 blue:23/255.0 alpha:1.0];
        
        BGTextAttribute *attribute = [[BGTextAttribute alloc] init];
        attribute.borderWidth = 5;
        attribute.borderColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
        
        self.bgTextAttributes = @[attribute];
    }
    return self;
}

+(InfiniteChallengeTopOfYellow*)infiniteChallengeTopOfYellow{
    
    InfiniteChallengeTopOfYellow* infiniteChallengeTopOfYellow = [[self alloc] init];
    return infiniteChallengeTopOfYellow;
    
}

@end
