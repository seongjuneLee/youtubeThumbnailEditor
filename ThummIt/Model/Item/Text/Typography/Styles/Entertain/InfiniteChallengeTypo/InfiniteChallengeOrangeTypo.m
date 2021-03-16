//
//  InfiniteChallengeWhiteOrange.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/27.
//

#import "InfiniteChallengeOrangeTypo.h"

@implementation InfiniteChallengeOrangeTypo

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"무한오렌",nil);
        self.fontName = @"S-CoreDream-9Black";
        self.textColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"whiteOrangeGC"]];
        self.textColorPatternImageName = @"whiteOrangeGC";
        

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

+(InfiniteChallengeOrangeTypo*)infiniteChallengeOrangeTypo{
    
    InfiniteChallengeOrangeTypo* infiniteChallengeOrangeTypo = [[self alloc] init];
    return infiniteChallengeOrangeTypo;
    
}

@end
