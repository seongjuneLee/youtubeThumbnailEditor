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
        self.tintColor = [UIColor colorWithRed:254/255.0 green:214/255.0 blue:141/255.0 alpha:1.0];

    }
    return self;
}

+(VlogPigtailSticker*) vlogPigtailSticker{
    
    VlogPigtailSticker* vlogPigtailSticker = [[self alloc] init];
    return vlogPigtailSticker;
}

@end
