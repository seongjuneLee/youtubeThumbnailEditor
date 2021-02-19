//
//  InfiniteChallengeSkyBlueBox.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/28.
//

#import "InfiniteChallengeSkyBlueBox.h"

@implementation InfiniteChallengeSkyBlueBox

-(id)init{
    self = [super init];
    if (self) {
        
        self.name = NSLocalizedString(@"저한테 왜 그러세요..?",nil);
        self.fontName = @"NanumBarunGothicOTFBold";
        self.textColor = [UIColor colorWithRed:42/255.0 green:54/255.0 blue:158/255.0 alpha:1];
        self.bgImageName = @"infiniteChallengeSkyBlueBox";
        self.bgWidthPadding = 150;
        self.bgHeightPadding = 150;
        
        BGTextAttribute *attribute = [[BGTextAttribute alloc] init];
        attribute.borderWidth = 15;
        attribute.borderColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        
        BGTextAttribute *attribute2 = [[BGTextAttribute alloc] init];
        attribute2.borderWidth = 20;
        attribute2.borderColor = [UIColor colorWithRed:130/255.0 green:130/255.0 blue:130/255.0 alpha:1.0];
        
        self.bgTextAttributes = @[attribute, attribute2];
    }
    return self;
}

+(InfiniteChallengeSkyBlueBox*)infiniteChallengeSkyBlueBox{
    
    InfiniteChallengeSkyBlueBox* infiniteChallengeSkyBlueBox = [[self alloc] init];
    return infiniteChallengeSkyBlueBox;
    
}

@end
