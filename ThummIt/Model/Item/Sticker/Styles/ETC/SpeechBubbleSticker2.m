//
//  SpeechBubbleSticker2.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "SpeechBubbleSticker2.h"

@implementation SpeechBubbleSticker2

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"speechBubbleSticker2";
        self.backgroundImageName = @"speechBubbleSticker2";
        self.tintColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        self.canChangeColor = true;
    }
    return self;
}

+(SpeechBubbleSticker2*)speechBubbleSticker2{
    
    SpeechBubbleSticker2* speechBubbleSticker2 = [[self alloc] init];
    return speechBubbleSticker2;
}

@end
