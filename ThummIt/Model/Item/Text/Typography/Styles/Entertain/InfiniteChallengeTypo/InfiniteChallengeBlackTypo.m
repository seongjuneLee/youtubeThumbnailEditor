//
//  InfiniteChallengeBlackWhite.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/27.
//

#import "InfiniteChallengeBlackTypo.h"

@implementation InfiniteChallengeBlackTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"무한검정",nil);
        self.fontName = @"S-CoreDream-9Black";
        self.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blackGreyGC"]];
        self.textColorPatternImageName = @"blackGreyGC";
        self.canChangeColor = true;
        BGTextAttribute *attribute = [[BGTextAttribute alloc] init];
        attribute.borderWidth = 15;
        attribute.borderColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        
        BGTextAttribute *attribute2 = [[BGTextAttribute alloc] init];
        attribute.shadowOffset = CGPointMake(0, 0);
        attribute.shadowColor = [UIColor colorWithRed:242/255.0 green:231/255.0 blue:105/255.0 alpha:1.0];
        attribute.shadowRadius = 5;
        self.bgTextAttributes = @[attribute, attribute2];
    }
    return self;
}

+(InfiniteChallengeBlackTypo*)infiniteChallengeBlackTypo{
    
    InfiniteChallengeBlackTypo* infiniteChallengeBlackTypo = [[self alloc] init];
    return infiniteChallengeBlackTypo;
    
}

@end
