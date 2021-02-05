//
//  InfiniteChallengeHashTag.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/28.
//

#import "InfiniteChallengeHashTag.h"

@implementation InfiniteChallengeHashTag

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"#예능레전드",nil);
        self.fontName = @"NanumBarunGothicOTF";
        self.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        
        BGTextAttribute *attribute = [[BGTextAttribute alloc] init];
        attribute.borderWidth = 9;
        attribute.borderColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
        
        self.bgTextAttributes = @[attribute];
    }
    return self;
}

+(InfiniteChallengeHashTag*)infiniteChallengeHashTag{
    
    InfiniteChallengeHashTag* infiniteChallengeHashTag = [[self alloc] init];
    return infiniteChallengeHashTag;
    
}

@end
