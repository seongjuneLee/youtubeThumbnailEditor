//
//  BlinkSticker1.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/28.
//

#import "BlinkSticker1.h"

@implementation BlinkSticker1

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"blinkSticker1";
        self.backgroundImageName = @"blinkSticker1";
        self.tintColor = [UIColor colorWithRed:1.0 green:201/255.0 blue:91/255.0 alpha:1.0];

    }
    return self;
}

+(BlinkSticker1*) blinkSticker1{
    
    BlinkSticker1* blinkSticker1 = [[self alloc] init];
    return blinkSticker1;
}

@end
