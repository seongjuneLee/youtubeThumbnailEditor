//
//  SpeechBubbleSticker1.m
//  ThummIt
//
//  Created by 이성준 on 2021/02/04.
//

#import "SpeechBubbleSticker1.h"

@implementation SpeechBubbleSticker1

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"speechBubbleSticker1";
        self.backgroundImageName = @"speechBubbleSticker1";
        self.tintColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        self.canChangeColor = true;
    }
    return self;
}

+(SpeechBubbleSticker1*)speechBubbleSticker1{
    
    SpeechBubbleSticker1* speechBubbleSticker1 = [[self alloc] init];
    return speechBubbleSticker1;
}

@end
