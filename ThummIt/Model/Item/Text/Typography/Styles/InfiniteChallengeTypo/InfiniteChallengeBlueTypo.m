//
//  InfiniteChallengeWhiteBlue.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/27.
//

#import "InfiniteChallengeBlueTypo.h"

@implementation InfiniteChallengeBlueTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"무한파랑",nil);
        self.fontName = @"S-CoreDream-9Black";
        self.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"whiteBlueGC"]];
        self.textColorPatternImageName = @"whiteBlueGC";
        self.fontSize = TEXT_FONT_SIZE + 10;
        self.isChangingAvailableColor = true;

        BGTextAttribute *attribute = [[BGTextAttribute alloc] init];
        attribute.borderWidth = 15;
        attribute.borderColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
        
        BGTextAttribute *attribute2 = [[BGTextAttribute alloc] init];
        attribute.shadowOffset = CGPointMake(0, 0);
        attribute.shadowColor = [UIColor colorWithRed:242/255.0 green:231/255.0 blue:105/255.0 alpha:1.0];
        attribute.shadowRadius = 5;
        self.bgTextAttributes = @[attribute, attribute2];
    }
    return self;
}

+(InfiniteChallengeBlueTypo*)infiniteChallengeBlueTypo{
    
    InfiniteChallengeBlueTypo* infiniteChallengeBlueTypo = [[self alloc] init];
    return infiniteChallengeBlueTypo;
    
}

@end
