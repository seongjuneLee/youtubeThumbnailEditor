//
//  PigtailSitcker.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/28.
//

#import "PigtailSticker.h"

@implementation PigtailSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"pigtailSticker";
        self.backgroundImageName = @"pigtailSticker";
        self.tintColor = [UIColor colorWithRed:254/255.0 green:214/255.0 blue:141/255.0 alpha:1.0];
        self.canChangeColor = true;
    }
    return self;
}

+(PigtailSticker*) pigtailSticker{
    
    PigtailSticker* pigtailSticker = [[self alloc] init];
    return pigtailSticker;
}

@end
