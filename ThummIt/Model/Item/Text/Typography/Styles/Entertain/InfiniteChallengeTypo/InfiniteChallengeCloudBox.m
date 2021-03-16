//
//  InfiniteChallengeCloudBox.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/28.
//

#import "InfiniteChallengeCloudBox.h"

@implementation InfiniteChallengeCloudBox

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"당황",nil);
        self.fontName = @"777Chocolatlatte-";
        self.textColor = [UIColor colorWithRed:42/255.0 green:54/255.0 blue:158/255.0 alpha:1];
        self.bgImageName = @"infiniteChallengeCloudBox";
        self.bgWidthPadding = 120;
        self.bgHeightPadding = 120;
        self.fontSize = 100;
        self.canChangeColor = true;
        BGTextAttribute *attribute = [[BGTextAttribute alloc] init];
        attribute.borderWidth = 20;
        attribute.borderColor = [UIColor colorWithRed:172/255.0 green:245/255.0 blue:242/255.0 alpha:1.0];
        
        self.bgTextAttributes = @[attribute];
    }
    return self;
}

+(InfiniteChallengeCloudBox*)infiniteChallengeCloudBox{
    
    InfiniteChallengeCloudBox* infiniteChallengeCloudBox = [[self alloc] init];
    return infiniteChallengeCloudBox;
    
}

@end
