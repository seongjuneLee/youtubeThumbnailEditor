//
//  VlogPigtailSitcker.m
//  ThummIt
//
//  Created by 조재훈 on 2021/01/28.
//

#import "VlogPigtailSticker.h"

@implementation VlogPigtailSticker

-(id)init{
    
    self = [super init];
    if(self){
        self.itemName = @"pigtailSticker";
        self.backgroundImageName = @"pigtailSticker";

    }
    return self;
}

+(VlogPigtailSticker*) vlogPigtailSticker{
    
    VlogPigtailSticker* vlogPigtailSticker = [[self alloc] init];
    return vlogPigtailSticker;
}

@end
